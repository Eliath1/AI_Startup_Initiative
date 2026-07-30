param(
  [string]$MarkdownPath,
  [string]$PdfPath,
  [string]$HtmlPath
)

$repoRoot = Split-Path $PSScriptRoot -Parent
$sampleOut = Join-Path $repoRoot "samples\enterprise-projects\outputs"

if (-not $MarkdownPath) { $MarkdownPath = Join-Path $sampleOut "Enterprise_Projects_Executive_Analysis.md" }
if (-not $PdfPath) { $PdfPath = Join-Path $sampleOut "Enterprise_Projects_Executive_Analysis.pdf" }
if (-not $HtmlPath) { $HtmlPath = Join-Path $sampleOut "Enterprise_Projects_Executive_Brief.html" }

$cssPath = Join-Path $repoRoot "skills\ai-program-manager\references\executive-brief-pdf.css"
$chrome = 'C:\Program Files\Google\Chrome\Application\chrome.exe'

function Inline-Format([string]$s) {
  $s = [regex]::Replace($s, '\*\*(.+?)\*\*', '<strong>$1</strong>')
  $s = [regex]::Replace($s, '`([^`]+)`', '<code>$1</code>')
  return $s
}

if (-not (Test-Path $MarkdownPath)) { throw "Markdown not found: $MarkdownPath" }
if (-not (Test-Path $cssPath)) { throw "CSS not found: $cssPath" }

$css = Get-Content -Path $cssPath -Raw -Encoding UTF8
$lines = Get-Content -Path $MarkdownPath -Encoding UTF8
$body = New-Object System.Collections.Generic.List[string]
$i = 0
$inMetadata = $false

while ($i -lt $lines.Count) {
  $trimmed = $lines[$i].Trim()

  if ($trimmed -eq '') { $i++; continue }
  if ($trimmed -eq '---') { $i++; continue }

  if ($trimmed -match '^# (.+)$') {
    $body.Add("<h1>$(Inline-Format $Matches[1])</h1>")
    $i++; continue
  }

  if ($trimmed -match '^\*\*Date:\*\*') {
    $body.Add("<p class=""meta-line"">$(Inline-Format ($trimmed -replace '\*\*',''))</p>")
    $i++; continue
  }

  if ($trimmed -match '^## Document metadata') {
    $inMetadata = $true
    $body.Add('<div class="metadata">')
    $body.Add('<h2>Document metadata</h2>')
    $i++; continue
  }

  if ($trimmed -match '^## (.+)$') {
    $body.Add("<h2>$(Inline-Format $Matches[1])</h2>")
    $i++; continue
  }

  if ($trimmed -match '^\|') {
    $tableRows = @()
    while ($i -lt $lines.Count -and $lines[$i].Trim() -match '^\|') {
      $tableRows += $lines[$i].Trim()
      $i++
    }
    if ($tableRows.Count -ge 2) {
      $headerCells = ($tableRows[0].Trim('|') -split '\|' | ForEach-Object { $_.Trim() })
      $body.Add('<table><thead><tr>' + (($headerCells | ForEach-Object { "<th>$(Inline-Format $_)</th>" }) -join '') + '</tr></thead><tbody>')
      for ($r = 2; $r -lt $tableRows.Count; $r++) {
        $cells = ($tableRows[$r].Trim('|') -split '\|' | ForEach-Object { $_.Trim() })
        $body.Add('<tr>' + (($cells | ForEach-Object { "<td>$(Inline-Format $_)</td>" }) -join '') + '</tr>')
      }
      $body.Add('</tbody></table>')
    }
    continue
  }

  if ($trimmed -match '^\*\*(.+)\*\*$' -and -not $inMetadata) {
    $title = $Matches[1]
    $i++
    $paraLines = New-Object System.Collections.Generic.List[string]
    while ($i -lt $lines.Count) {
      $next = $lines[$i].Trim()
      if ($next -eq '' -or $next -match '^\*\*' -or $next -match '^##' -or $next -match '^\|' -or $next -eq '---') { break }
      $paraLines.Add($next)
      $i++
    }
    $text = $paraLines -join ' '
    if ($text) {
      $body.Add("<div class=""achievement""><p class=""achievement-title"">$(Inline-Format $title)</p><p class=""achievement-body"">$(Inline-Format $text)</p></div>")
    }
    continue
  }

  if ($inMetadata -and $trimmed -match '^\*\*(.+):\*\*\s*(.+)$') {
    $body.Add("<p><strong>$($Matches[1]):</strong> $(Inline-Format $Matches[2])</p>")
    $i++; continue
  }

  if ($trimmed -match '^- (.+)$') {
    $body.Add('<ul>')
    while ($i -lt $lines.Count -and $lines[$i].Trim() -match '^- (.+)$') {
      $body.Add("<li>$(Inline-Format $Matches[1])</li>")
      $i++
    }
    $body.Add('</ul>')
    continue
  }

  if ($trimmed -match '^\*(.+)\*$' -and -not $inMetadata) {
    $body.Add("<p><em>$(Inline-Format $Matches[1])</em></p>")
    $i++; continue
  }

  $body.Add("<p>$(Inline-Format $trimmed)</p>")
  $i++
}

if ($inMetadata) { $body.Add('</div>') }

$html = @"
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<title>Executive Brief</title>
<style>
$css
</style>
</head>
<body>
$($body -join "`n")
</body>
</html>
"@

[System.IO.File]::WriteAllText($HtmlPath, $html, [System.Text.UTF8Encoding]::new($false))
if (Test-Path $PdfPath) { Remove-Item $PdfPath -Force }

if (-not (Test-Path $chrome)) {
  Write-Warning "Chrome not found; HTML written to $HtmlPath"
  exit 0
}

$resolvedHtml = (Resolve-Path $HtmlPath).Path
$fileUri = 'file:///' + ($resolvedHtml -replace '\\', '/')
Start-Process -FilePath $chrome -ArgumentList @(
  '--headless=new', '--disable-gpu', '--no-pdf-header-footer',
  "--print-to-pdf=$PdfPath", $fileUri
) -Wait -NoNewWindow | Out-Null
Write-Output "HTML: $HtmlPath"
Write-Output "PDF:  $PdfPath"

#!/usr/bin/env node
/**
 * generate-cursor-rules.js
 *
 * Derives .cursor/rules (.mdc) files from each skill's SKILL.md so this repo works natively in
 * Cursor without hand-maintaining a second copy of every skill. Re-run this any time a skill
 * under skills/ is added or edited.
 *
 * Usage: node tools/generate-cursor-rules.js
 *
 * Cursor rule format: YAML frontmatter (description, globs, alwaysApply) + markdown body.
 * We set alwaysApply: false and no globs — these are meant to be pulled in by the agent when
 * relevant to the task (matching how the `description` field is written), not force-loaded into
 * every context window. Reference files are noted but not inlined, matching the same
 * load-on-demand principle used in the Claude-format skills.
 */

const fs = require('fs');
const path = require('path');

const SKILLS_DIR = path.join(__dirname, '..', 'skills');
const RULES_DIR = path.join(__dirname, '..', '.cursor', 'rules');

function parseFrontmatter(content) {
  const match = content.match(/^---\n([\s\S]*?)\n---\n([\s\S]*)$/);
  if (!match) return { meta: {}, body: content };
  const [, frontmatter, body] = match;
  const meta = {};
  // Minimal YAML parse — good enough for this fixed schema (name/version/description block).
  let currentKey = null;
  for (const line of frontmatter.split('\n')) {
    const kv = line.match(/^(\w[\w-]*):\s?(.*)$/);
    if (kv) {
      currentKey = kv[1];
      meta[currentKey] = kv[2].trim().replace(/^>$/, '');
    } else if (currentKey && line.trim()) {
      meta[currentKey] = (meta[currentKey] || '') + ' ' + line.trim();
    }
  }
  return { meta, body: body.trim() };
}

function toMdc(skillName, meta, body, hasReferences) {
  const description = (meta.description || `Skill: ${skillName}`).replace(/\s+/g, ' ').trim();
  const refNote = hasReferences
    ? `\n\n> This skill has additional reference files under \`skills/${skillName}/references/\` — consult them when the task needs that depth (they are not inlined here to keep this rule lightweight).`
    : '';

  return `---
description: ${description}
globs:
alwaysApply: false
---

# ${skillName}

${body}${refNote}
`;
}

function main() {
  if (!fs.existsSync(SKILLS_DIR)) {
    console.error(`No skills/ directory found at ${SKILLS_DIR}`);
    process.exit(1);
  }
  fs.mkdirSync(RULES_DIR, { recursive: true });

  const skillDirs = fs.readdirSync(SKILLS_DIR, { withFileTypes: true }).filter((d) => d.isDirectory());
  let count = 0;

  for (const dir of skillDirs) {
    const skillName = dir.name;
    const skillMdPath = path.join(SKILLS_DIR, skillName, 'SKILL.md');
    if (!fs.existsSync(skillMdPath)) continue;

    const content = fs.readFileSync(skillMdPath, 'utf8');
    const { meta, body } = parseFrontmatter(content);
    const hasReferences = fs.existsSync(path.join(SKILLS_DIR, skillName, 'references'));

    const mdc = toMdc(skillName, meta, body, hasReferences);
    const outPath = path.join(RULES_DIR, `${skillName}.mdc`);
    fs.writeFileSync(outPath, mdc);
    count++;
    console.log(`Generated .cursor/rules/${skillName}.mdc`);
  }

  console.log(`\nDone — ${count} rule file(s) generated from ${skillDirs.length} skill folder(s).`);
}

main();

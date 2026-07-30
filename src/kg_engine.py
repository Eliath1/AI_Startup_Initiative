"""File-based aerospace knowledge graph engine backed by rdflib."""

from __future__ import annotations

from pathlib import Path
from typing import Any

from rdflib import Graph, Namespace, URIRef

# Must match @prefix declarations in knowledge_graph/*.ttl (no trailing slash on aero).
AERO = Namespace("http://example.org")
RDFS_TTL = Namespace("http://w3.org")


class AerospaceGraphEngine:
    """Loads TTL ontology and instance data and exposes query helpers."""

    def __init__(
        self,
        ontology_path: Path | str | None = None,
        data_path: Path | str | None = None,
    ) -> None:
        repo_root = Path(__file__).resolve().parent.parent
        self._ontology_path = Path(
            ontology_path or repo_root / "knowledge_graph" / "aerospace_ontology.ttl"
        )
        self._data_path = Path(data_path or repo_root / "knowledge_graph" / "mock_data.ttl")

        self.graph = Graph()
        self.graph.bind("aero", AERO)
        self.graph.parse(self._ontology_path, format="turtle")
        self.graph.parse(self._data_path, format="turtle")

    def _resolve_component_uri(self, component_uri_or_name: str) -> URIRef:
        raw = component_uri_or_name.strip()
        if raw.startswith("aero:"):
            local = raw.split(":", 1)[1]
            return AERO[local]
        if raw.startswith("http://") or raw.startswith("https://"):
            return URIRef(raw)
        return AERO[raw]

    def get_component_details(self, component_uri_or_name: str) -> dict[str, Any]:
        """Return label, compliance standard, and allocated task info for a component."""
        component = self._resolve_component_uri(component_uri_or_name)

        label = self.graph.value(component, RDFS_TTL.label)
        compliance_uri = self.graph.value(component, AERO.requiresCompliance)
        task_uri = self.graph.value(component, AERO.allocatedToTask)

        compliance_label = None
        compliance_short = None
        if compliance_uri is not None:
            compliance_label = self.graph.value(compliance_uri, RDFS_TTL.label)
            if compliance_uri == AERO.DO254:
                compliance_short = "DO-254"
            elif compliance_uri == AERO.DO178C:
                compliance_short = "DO-178C"
            else:
                local = str(compliance_uri).rsplit("/", 1)[-1]
                compliance_short = local

        task_info: dict[str, Any] | None = None
        if task_uri is not None:
            task_info = {
                "uri": str(task_uri),
                "label": self.graph.value(task_uri, RDFS_TTL.label),
                "status": self.graph.value(task_uri, AERO.taskStatus),
            }

        return {
            "uri": str(component),
            "label": str(label) if label is not None else None,
            "compliance_standard": compliance_short,
            "compliance_label": str(compliance_label) if compliance_label is not None else None,
            "allocated_task": task_info,
        }

    def get_all_blocked_tasks(self) -> list[dict[str, Any]]:
        """Return all aero:ProjectTask instances with aero:taskStatus \"Blocked\"."""
        query = """
            PREFIX aero: <http://example.org>
            PREFIX rdfs: <http://w3.org>

            SELECT ?task ?label ?status WHERE {
                ?task a aero:ProjectTask .
                ?task aero:taskStatus ?status .
                FILTER(?status = "Blocked")
                OPTIONAL { ?task rdfs:label ?label . }
            }
        """
        rows: list[dict[str, Any]] = []
        for task, label, status in self.graph.query(query):
            rows.append(
                {
                    "uri": str(task),
                    "label": str(label) if label is not None else None,
                    "status": str(status) if status is not None else None,
                }
            )
        return rows

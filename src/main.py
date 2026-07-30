"""Example entry point for the aerospace knowledge graph engine."""

from kg_engine import AerospaceGraphEngine


def _print_component(engine: AerospaceGraphEngine, name: str) -> None:
    details = engine.get_component_details(name)
    print(f"=== {name} ===")
    print(f"  Design label:        {details['label']}")
    print(f"  Compliance type:     {details['compliance_standard']} ({details['compliance_label']})")
    task = details["allocated_task"]
    if task:
        print(f"  Management task:     {task['label']}")
        print(f"  Task status:         {task['status']}")
    else:
        print("  Management task:     (none allocated)")
    print()


def main() -> None:
    engine = AerospaceGraphEngine()

    _print_component(engine, "aero:FlightControlPCB")
    _print_component(engine, "aero:AutopilotGuidanceCore")

    blocked = engine.get_all_blocked_tasks()
    print("=== Blocked project tasks (graph-wide) ===")
    if not blocked:
        print("  (none)")
    for task in blocked:
        print(f"  - {task['label']} [{task['status']}]")


if __name__ == "__main__":
    main()

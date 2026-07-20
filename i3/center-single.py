#!/usr/bin/env python3
from i3ipc import Connection, Event

FRACTION = 0.618  # golden ratio
EXCLUDED = {"firefox"}  # classes that stay full width (substring match)

i3 = Connection()
last_gap = {}  # workspace name -> last gap we set


def is_tiled(leaf):
    return leaf.floating not in ("auto_on", "user_on")


def output_width(i3, ws):
    for out in i3.get_outputs():
        if out.name == ws.ipc_data.get("output"):
            return out.rect.width
    return ws.rect.width  # fallback


def update(i3, e=None):
    focused = i3.get_tree().find_focused()
    if focused is None:
        return
    ws = focused.workspace()
    if ws is None:
        return

    tiled = [l for l in ws.leaves() if is_tiled(l)]

    gap = 0
    if len(tiled) == 1:
        cls = (tiled[0].window_class or "").lower()
        if not any(x in cls for x in EXCLUDED):
            gap = int(output_width(i3, ws) * (1 - FRACTION) / 2)

    if last_gap.get(ws.name) != gap:
        last_gap[ws.name] = gap
        i3.command(f"gaps horizontal current set {gap}")


for ev in (
    Event.WINDOW_NEW,
    Event.WINDOW_CLOSE,
    Event.WINDOW_MOVE,
    Event.WINDOW_FLOATING,
    Event.WORKSPACE_FOCUS,
):
    i3.on(ev, update)

update(i3)
i3.main()

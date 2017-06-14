#!/bin/bash
# Toggle xfce panel position from horizontal to vertical

HORIZONTAL=0
VERTICAL=1

mode=$(xfconf-query -c xfce4-panel -p /panels/panel-1/mode -v)

echo "$mode"
echo "$HORIZONTAL"

if [ "$mode" = "$HORIZONTAL" ]; then
	xfconf-query -c xfce4-panel -p /panels/panel-1/mode -s 1
else
	xfconf-query -c xfce4-panel -p /panels/panel-1/mode -s 0
fi


# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, qtile
from libqtile.config import Click, Drag, Group, Key, Screen, Match
from libqtile.lazy import lazy

import os
import subprocess
from libqtile import hook
from libqtile.log_utils import logger


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~")
    subprocess.Popen([home + "/.config/qtile/autostart.sh"])


@hook.subscribe.focus_change
def window_to_front():
    for window in qtile.current_group.windows:
        if window.floating:
            window.cmd_bring_to_front()


@hook.subscribe.restart
def on_restart():
    home = os.path.expanduser("~")
    with open(home + "/Wallpapers/current_wallpaper", "r") as file:
        wallpaper = file.readline().replace("\n", "")
        os.environ["WALLPAPER"] = wallpaper
        logger.debug("wallpaper set to " + wallpaper)


alt = "mod1"
mod = "mod4"

keys = [
    Key(
        [mod, "shift"],
        "Return",
        lazy.spawn(
            'rofi -show drun -monitor -4 -drun-display-format "{name}"'),
        desc="Run Launcher",
    ),
    Key(
        [mod],
        "s",
        lazy.spawn(
            "rofi -show power-menu -config ~/.config/rofi/config_powermenu.rasi -monitor primary -modi power-menu:rofi-power-menu"
        ),
        desc="Run Power-menu",
    ),
    Key(
        [alt],
        "Tab",
        lazy.spawn("rofi -show window -monitor -4"),
        desc="alt tab",
    ),
    Key([mod], "d", lazy.spawn("dunstctl history-pop"), desc="Show dunst history"),
    Key([], "Print", lazy.spawn("screenshot"), desc="Take a screensht"),
    Key(
        ["shift"],
        "Print",
        lazy.spawn("screenshot_select"),
        desc="Take a screensht with selection",
    ),
    Key([mod], "r", lazy.spawn("env LINES= COLUMNS= kitty -e ranger")),
    Key([mod], "e", lazy.spawn("env LINES= COLUMNS= kitty -e mutt")),
    Key([mod], "t", lazy.spawn("env LINES= COLUMNS= kitty -e rtorrent")),
    Key([mod], "q", lazy.spawn("qutebrowser")),
    Key([mod], "space", lazy.next_screen(), desc="move focus to next screen"),
    Key([mod], "f", lazy.window.toggle_floating()),
    Key([mod], "m", lazy.layout.maximize()),
    Key([mod], "n", lazy.layout.reset()),
    # Switch between windows in current stack pane
    Key([mod], "h", lazy.layout.left(), desc="Switch left in current stack "),
    Key([mod], "l", lazy.layout.right(), desc="Switch right in current stack "),
    Key([mod], "j", lazy.group.next_window(),
        desc="Switch to next window in group"),
    Key(
        [mod], "k", lazy.group.prev_window(), desc="Switch to previous window in group"
    ),
    # Move windows in current stack
    Key([mod, "shift"], "j", lazy.layout.shrink(), desc="Lock screen"),
    Key([mod, "shift"], "k", lazy.layout.grow(), desc="Lock screen"),
    Key([mod, "shift"], "l", lazy.spawn("slock"), desc="Lock screen"),
    # Move windows in current stack
    Key(
        [mod, "control"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window left in current stack ",
    ),
    Key(
        [mod, "control"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window right in current stack ",
    ),
    Key(
        [mod, "control"],
        "j",
        lazy.layout.shuffle_down(),
        desc="Move window down in current stack ",
    ),
    Key(
        [mod, "control"],
        "k",
        lazy.layout.shuffle_up(),
        desc="Move window up in current stack ",
    ),
    Key([mod], "Return", lazy.spawn("kitty"), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
    Key([mod], "p", lazy.spawn("toggle_picom")),
]

groups = [Group(f" {i} ") for i in "123456789"]

for i in groups:
    keys.append(
        Key([mod], str(i.name)[1], lazy.group[i.name].toscreen())
    )  # Switch to another group
    keys.append(
        Key([mod, "shift"], str(i.name)[1], lazy.window.togroup(i.name))
    )  # Send current window to another group

layout_theme = {
    "border_width": 2,
    "margin": 6,
    "border_focus": "#ff0000",
    "border_normal": "#440000",
}

layouts = [
    layout.MonadTall(
        min_ratio=0.3,
        max_ratio=0.7,
        **layout_theme,
    ),
    layout.Max(**layout_theme),
]

widget_defaults = dict(
    font="Fira Code Regular",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

barShape = "◢"

filled = "██"

barColor = ("#000000", "#440000", "#880000", "#cc0000")


def angle(x, y):
    return widget.TextBox(
        barShape, foreground=barColor[x], background=barColor[y], fontsize=43, width=28
    )


def space(x):
    return widget.TextBox(
        filled, foreground=barColor[x], fontsize=32, width=10, padding=0
    )


screens = [
    Screen(
        # wallpaper="~/Wallpapers/1636834139152.jpg",
        wallpaper=os.environ["WALLPAPER"],
        wallpaper_mode="fill",
        top=bar.Bar(
            [
                widget.GroupBox(
                    background=barColor[3],
                    highlight_method="block",
                    inactive="#ffaaaa",
                    this_current_screen_border=barColor[2],
                    this_screen_border="#aa0000",
                    rounded=False,
                    other_current_screen_border="#aa0000",
                    other_screen_border="#aa0000",
                    urgent_alert_method="line",
                    urgent_border=barColor[0],
                    urgent_text="#ffffff",
                    margin_x=0,
                    padding=5,
                    font="Fira Code Regular",
                ),
                angle(0, 3),
                space(0),
                widget.WindowName(background=barColor[0]),
                angle(3, 0),
                space(3),
                widget.CheckUpdates(
                    no_update_string="Updates: 0",
                    display_format="Updates: {updates}",
                    distro="Arch_checkupdates",
                    background=barColor[3],
                    execute="env LINES= COLUMNS= kitty -e paru",
                ),
                angle(0, 3),
                # angle(3, 0),
                # space(3),
                # widget.Battery(background=barColor[3]),
                # angle(0, 3),
                angle(3, 0),
                space(3),
                widget.Volume(
                    step=5,
                    background=barColor[3],
                    emoji=True,
                    volume_app="env LINES= COLUMNS= kitty -e pulsemixer",
                ),
                widget.Volume(
                    step=5,
                    background=barColor[3],
                    volume_app="env LINES= COLUMNS= kitty -e pulsemixer",
                ),
                angle(0, 3),
                angle(3, 0),
                space(3),
                widget.Clock(format=" %d %b, %a %H:%M",
                             background=barColor[3]),
                angle(0, 3),
                space(0),
                widget.Systray(),
                angle(3, 0),
                space(3),
                widget.CurrentLayoutIcon(
                    background=barColor[3], padding=5, scale=0.8),
            ],
            20,
        ),
    ),
    Screen(
        # wallpaper="~/Wallpapers/1636834139152.jpg",
        wallpaper=os.environ["WALLPAPER"],
        wallpaper_mode="fill",
        top=bar.Bar(
            [
                widget.GroupBox(
                    background=barColor[3],
                    highlight_method="block",
                    inactive="#ffaaaa",
                    this_current_screen_border=barColor[2],
                    this_screen_border="#aa0000",
                    rounded=False,
                    other_current_screen_border="#aa0000",
                    other_screen_border="#aa0000",
                    urgent_alert_method="line",
                    urgent_border=barColor[0],
                    urgent_text="#ffffff",
                    margin_x=0,
                    padding=5,
                    font="Fira Code Regular",
                ),
                angle(0, 3),
                space(0),
                widget.WindowName(background=barColor[0]),
                # widget.School(barShape, foreground=barColor[3], background=barColor[0], fontsize=34, width=26, padding=0),
                # widget.School(filled, foreground=barColor[3], background=barColor[0], fontsize=32, width=10, padding=0),
                # widget.School(background=barColor[3]),
                # widget.School(barShape, foreground=barColor[0], background=barColor[3], fontsize=34, width=26, padding=0),
                # angle(3, 0),
                # space(3),
                # widget.Battery(background=barColor[3]),
                # angle(0, 3),
                angle(3, 0),
                space(3),
                widget.Volume(
                    step=5,
                    background=barColor[3],
                    emoji=True,
                    volume_app="env LINES= COLUMNS= kitty -e pulsemixer",
                ),
                widget.Volume(
                    step=5,
                    background=barColor[3],
                    volume_app="env LINES= COLUMNS= kitty -e pulsemixer",
                ),
                angle(0, 3),
                angle(3, 0),
                space(3),
                widget.Clock(format=" %d %b, %a %H:%M",
                             background=barColor[3]),
                angle(0, 3),
                angle(3, 0),
                space(3),
                widget.CurrentLayoutIcon(
                    background=barColor[3], padding=5, scale=0.8),
            ],
            20,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    **layout_theme,
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(
            title="pinentry"
        ),  # GPG key password entry utility of `xprop` to see the wm class and name of an X client.
        Match(title="win0"),
        Match(wm_class="gpick"),
        Match(wm_class="feh"),
        Match(wm_class="qemu"),
        Match(wm_class="gimp"),
        Match(wm_class="qpassword_manager"),
        Match(title="Layers of Fear"),
    ],
)
auto_fullscreen = True
auto_minimize = False
focus_on_window_activation = "smart"

wmname = "Qtile"

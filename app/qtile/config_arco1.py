# (async-shell-command "ln -fs ~/config_github/app/qtile/config_arco1.py ~/.config/qtile/config.py")
# (dired "~/config_github/app/qtile/")
         # (dired "~/.config/qtile/")
# qtile의 강점: (C-S-r) 빠른 적용이 가능하다 file:config_arco1.py

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

from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget

from typing import List  # noqa: F401

mod = "mod4"

keys = [
    # Switch between windows in current stack pane
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),

    # Move windows up or down in current stack
#    Key([mod, "control"], "k", lazy.layout.shuffle_down()),
#    Key([mod, "control"], "j", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),

#    Key([modkey], "i", lazy.layout.grow()),
#    Key([modkey], "m", lazy.layout.shrink()),
#    Key([modkey], "n", lazy.layout.normalize()),
#    Key([modkey], "o", lazy.layout.maximize()),

    # Switch window focus to other pane(s) of stack
    #Key([mod], "space", lazy.layout.next()),
    Key([mod], "Tab", lazy.layout.next()),
    Key([mod], "space", lazy.next_layout()),
#    Key([modkey, "shift"], "space", lazy.layout.flip()),

    # Swap panes of split stack
    #Key([mod, "shift"], "space", lazy.layout.rotate()),
    Key([mod, "shift"], "r", lazy.layout.rotate()),
    Key([mod, "shift"], "s", lazy.layout.toggle_split()), # mod + shift + s => split
    
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    #Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
    
    Key([mod], "Return", lazy.spawn("urxvt")),
    Key([mod], "r", lazy.spawn("rofi -combi window drun run -show combi")),

    # Toggle between different layouts as defined below
    #Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "w", lazy.window.kill()),

    Key([mod, "control"], "r", lazy.restart()),
#    Key([mod, "control"], "q", lazy.shutdown()),
#    Key([mod], "r", lazy.spawncmd()),
  #  Key([mod, "control"], "r", lazy.restart()),
  #  Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod], "c", lazy.spawncmd()), # mod + c
        Key([mod], "i", lazy.layout.grow()),
        Key([mod], "m", lazy.layout.shrink()),
        Key([mod], "n", lazy.layout.normalize()),
        Key([mod], "o", lazy.layout.maximize()),
    Key([mod, "shift"], "space", lazy.layout.flip()),

]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
    ])

layouts = [
     layout.MonadWide(new_at_current=False, border_focus='orange', ratio=0.7),
     layout.MonadTall(new_at_current=False, border_focus='orange', ratio=0.7),
#     layout.Stack(num_stacks=3), #3줄은 불필요함
     layout.Max(), #최대화면으로 있어야 한다.
#    layout.Zoomy(), # 너무 자주 바뀌어서 막상 용도가 썩 그럼.
#    layout.Matrix(),
#    layout.Bsp()
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(        
        #bottom=bar.Bar(
            [
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                #widget.WindowTabs(),

		# widget.CurrentScreen(width=CALCULATED, 
#		widget.CurrentScreen(width=CALCULATED),

                                     # active_color  ='00ff00',
                                     # active_text   ='끈기용기',
                                     # inactive_color='ff0000',
                                     # inactive_text ='화두념두',



# key           default,
# active_color  ='00ff00',
# active_text   ='A',
# background    =None,
# fmt           ='{}',
# font          ='sans',
# fontshadow    =None,
# fontsize      =None,
# foreground    ='ffffff',
# inactive_color='ff0000',
# inactive_text ='I',
# markup        =True,
# padding       =None,
                        # ),
                
                widget.Pomodoro(),
                widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
                widget.CurrentLayout(),

                widget.TextBox("qtile Vol:", name="default"),
                widget.Volume(),
		widget.LaunchBar(
		    default_icon='/usr/share/icons/oxygen/base/256x256/mimetypes/application-x-executable-script.png',
		    progs=[
		           ('qtile.pdf-Okular', 'okular /home/thinkpad/Desktop/qtile.pdf', 'qtile.pdf 읽기를 실행'),
                           ('읽기 테스트', 'espeak hi', 'espeak hi'),
		          ]
                                ),
                widget.Battery(format="{watt:.1f}W 충전{char}{percent:2.0%}"), #(format="{char}{percent:2.0%} {hour:02d}:{min:02d} {watt:.2f}W"),
                widget.Systray(),
                widget.Clipboard(),
                widget.Wlan(),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

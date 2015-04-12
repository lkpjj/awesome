-- {{{ Required libraries
local gears     = require("gears")
local awful     = require("awful")
awful.rules     = require("awful.rules")
require("awful.autofocus")
local wibox     = require("wibox")
local beautiful = require("beautiful")
require("naughty")
local drop      = require("scratchdrop")
local menubar = require("menubar")
local lain      = require("lain")
local vicious = require("vicious")
-- }}}

-- {{{ Error handling
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Autostart applications
function run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
     findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

----used to config the screens
-- run_once("auto_projector.sh")
run_once("synapse &")
-- run_once("auto_display.sh")
-- run_once("dropbox &")
-- run_once("bcloud-gui &")
run_once("easystroke")
-- run_once("conky &")
-- run_once("wicd-clien --tray &")
---run_once("set-battery.sh")
-- }}}

-- {{{ Variable definitions
-- localization
os.setlocale(os.getenv("LANG"))

-- beautiful init
beautiful.init(os.getenv("HOME") .. "/.config/awesome/theme/multicolor/theme.lua")
theme.wallpaper             = ".config/awesome/wallpaper/forever.jpg"
-- common
modkey     = "Mod4"
altkey     = "Mod1"
terminal   = "xfce4-terminal" or "xterm"
editor     = os.getenv("EDITOR") or "emacs"
editor_cmd = terminal .. " -e " .. editor

-- user defined
browser    = "google-chrome-stable"
browser2   = "firefox"
gui_editor = "emacs"
graphics   = "gpicview"
filemanager= "pcmanfm"
mail       = terminal .. " -e mutt "

local layouts = {
   awful.layout.suit.floating,
   awful.layout.suit.tile,
   awful.layout.suit.tile.left,
   awful.layout.suit.tile.bottom,
   awful.layout.suit.tile.top,
   awful.layout.suit.fair,
   awful.layout.suit.fair.horizontal,
   awful.layout.suit.spiral,
   awful.layout.suit.spiral.dwindle,
   awful.layout.suit.max,
}
-- }}}


-- {{{ Tags
tags = {
   names = { '☭','⌥','✣', },
   layout = { layouts[2], layouts[1], layouts[10] }
}

for s = 1, screen.count() do
-- Each screen has its own tag table.
   tags[s] = awful.tag(tags.names, s, tags.layout)
end
-- }}}

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}

--{{{menu
awesome_menu = {
   { "manual", "xterm -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

menu_internet={
   {"chrome",               "google-chrome-stable",beautiful.chrome_icon},
   {"firefox",              "firefox",beautiful.firefox_icon},
   {"goagent",              "goagent-gtk"},
   {"droppox",              "dropbox",beautiful.dropbox_icon},
   {"qq2013",               "qq2013",beautiful.qq_icon},
   {"bcloud",               "bcloud-gui",beautiful.bcloud_icon},
   {"wicd",                 "wicd-client"}
}

menu_program={   
   {"QtCreator",      "qtcreator",beautiful.qt_icon},   
   {"Texmaker",       "texmaker",beautiful.texmaker_icon},
   {"Emacs",          "emacs",beautiful.emacs_icon},
   {"Cmake",          "cmake-gui"},
   {"Matlab",         "xterm -e /usr/local/MATLAB/R2013a/bin/matlab",beautiful.matlab_icon},
   {"Eclipse",        "eclipse-bin-4.2",beautiful.eclipse_icon}   
}

menu_office={
   {"libre-base",      "base",beautiful.librebase_icon},
   {"libre-calc",      "calc",beautiful.librecalc_icon},
   {"libre-draw",      "draw",beautiful.libredraw_icon},
   {"libre-math",      "math",beautiful.libremath_icon},
   {"libre-impress",   "impress",beautiful.libreimpress_icon},
   {"libre-writer",    "writer",beautiful.libremath_icon}
}

menu_editor={
   {"office",         menu_office, beautiful.menu_office_icon},
   {"Sublime",        "subl",beautiful.sublime_icon},
   {"Leafpad",        "leafpad",beautiful.leafpad_icon},
   {"Emacs",          "emacs",beautiful.emacs_icon}
}

menu_game={
   {"steam",                "steam",beautiful.steam_icon}
}

menu_image={
   {"gpicview",             "gpicview",beautiful.gthumb_icon},
   {"Inkscape",             "inkscape",beautiful.inkscope_icon},
   {"gimp",                 "gimp", beautiful.gimp_icon}
}

menu_media={
   {"Smplayer",             "smplayer",beautiful.smplayer_icon},
   {"VLC",                  "vlc",beautiful.vlc_icon}
}

menu_multimedia={
   {"media",                menu_media,beautiful.menu_multimedia_icon},
   {"image",                menu_image,beautiful.menu_graphics_icon},
   {"game",                 menu_game,beautiful.steam_icon}
}

menu_tools={
   {"Virtualbox",           "VirtualBox",beautiful.virtualbox_icon},
   {"Kttorrent",            "kttorrent", beautiful.qbittorrent_icon},
   {"Xmind",                "xmind",beautiful.xmind_icon},
   {"Okular",               "okular",beautiful.okular_icon},
   {"Email",                "thunderbird", beautiful.thunderbird_icon},
   {"synapse",              "synapse",beautiful.synapse_icon},
   {"Jabref",               "jabref",beautiful.jabref_icon},
   {"Chmsee",               "kchmviewer",beautiful.kchmviewer_icon},   
   {"Scrot",                "scrot"}   
}


menu_fav = {  
   {"Emacs",               "emacs",beautiful.emacs_icon},
   {"火狐",                 "firefox",  beautiful.firefox_icon},
   {"扩展屏幕",              "xterm -e auto_display.sh",beautiful.multiplemonitors_icon}
   
}

mymainmenu = awful.menu({ items = {
				 {"桌面",       awesome_menu, beautiful.awesome_icon },
				 {"常用",       menu_fav, beautiful.fav_icon},
				 {"编程",       menu_program,beautiful.menu_development_icon},
         {"网络",       menu_internet,beautiful.menu_web_icon},
				 {"视频",       menu_multimedia,beautiful.menu_multimedia_icon},
				 {"办公",       menu_editor, beautiful.editor_icon},
				 {"工具",       menu_tools,beautiful.menu_settings_icon},
				 {"火狐",       firefox,  beautiful.firefox_icon},
				 {"文件",       filemanager, beautiful.filemanager_icon},
				 {"终端",       terminal,beautiful.terminal_icon},
				 {"关机",       "/usr/bin/shutdown.sh",beautiful.shutdown_icon}
}
					   })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })
--}}}


-- {{{ Wibox
markup = lain.util.markup

-- Textclock
clockicon = wibox.widget.imagebox(beautiful.widget_clock)
mytextclock = awful.widget.textclock(markup("#7788af", "%A %d %B ") .. markup("#FF3639", ">") .. markup("#de5e1e", " %H:%M "))


-- Calendar
-- lain.widgets.calendar:attach(mytextclock, { font_size = 10 })

-- Weather
-- weathericon = wibox.widget.imagebox(beautiful.widget_weather)
-- yawn = lain.widgets.yawn(123456, {
--     settings = function()
--         widget:set_markup(markup("#eca4c4", forecast:lower() .. " @ " .. units .. "°C "))
--     end
-- })

-- / fs
fsicon = wibox.widget.imagebox(beautiful.widget_fs)
fswidget = lain.widgets.fs({
    settings  = function()
        widget:set_markup(markup("#80d9d8", fs_now.used .. "% "))
    end
})

-- CPU
cpuicon = wibox.widget.imagebox()
cpuicon:set_image(beautiful.widget_cpu)
cpuwidget = lain.widgets.cpu({
    settings = function()
        widget:set_markup(markup("#e33a6e", cpu_now.usage .. "% "))
    end
})

-- MEM
memicon = wibox.widget.imagebox(beautiful.widget_mem)
memwidget = lain.widgets.mem({
    settings = function()
        widget:set_markup(markup("#e0da37", mem_now.used .. "M "))
    end
})

-- Coretemp
tempicon = wibox.widget.imagebox(beautiful.widget_temp)
tempwidget = lain.widgets.temp({
    settings = function()
        widget:set_markup(markup("#f1af5f", coretemp_now .. "°C "))
    end
})

-- Battery
baticon = wibox.widget.imagebox(beautiful.widget_batt)
batwidget = lain.widgets.bat({
    settings = function()
        if bat_now.perc == "N/A" then
            bat_now.perc = "AC "
        else
            bat_now.perc = bat_now.perc .. "% "
        end
        widget:set_text(bat_now.perc)
    end
})

-- ALSA volume
volicon = wibox.widget.imagebox(beautiful.widget_vol)
volumewidget = lain.widgets.alsa({
    settings = function()
        if volume_now.status == "off" then
            volume_now.level = volume_now.level .. "M"
        end
        widget:set_markup(markup("#7493d2", volume_now.level .. "%"))
	end
})

--增加gmail插件
--需要在用户根目录下添加 .netrc
--配置文件内容为: machine mail.google.com login 账户 password 密码
-- {{{ Start Gmail 
mailicon = wibox.widget.imagebox(beautiful.widget_mail)
mailwidget = wibox.widget.textbox()
gmail_t = awful.tooltip({ objects = { mailwidget },})
vicious.register(mailwidget, vicious.widgets.gmail,
        function (widget, args)
        gmail_t:set_text(args["{subject}"])
        gmail_t:add_to_object(mailicon)
            return args["{count}"]
                 end, 120) 

     mailicon:buttons(awful.util.table.join(
         awful.button({ }, 1, function () awful.util.spawn("urxvt -e mutt", false) end)
     ))
-- End Gmail }}}

-- Net
netdownicon = wibox.widget.imagebox(beautiful.widget_netdown)
--netdownicon.align = "middle"
netdowninfo = wibox.widget.textbox()
netupicon = wibox.widget.imagebox(beautiful.widget_netup)
--netupicon.align = "middle"
netupinfo = lain.widgets.net({
    settings = function()
        widget:set_markup(markup("#e54c62", net_now.sent .. ""))
        netdowninfo:set_markup(markup("#87af5f", net_now.received .. ""))
    end
})

-- MPD
mpdicon = wibox.widget.imagebox()
mpdwidget = lain.widgets.mpd({
    settings = function()
        mpd_notification_preset = {
            text = string.format("%s [%s] - %s\n%s", mpd_now.artist,
                   mpd_now.album, mpd_now.date, mpd_now.title)
        }

        if mpd_now.state == "play" then
            artist = mpd_now.artist .. " > "
            title  = mpd_now.title .. " "
            mpdicon:set_image(beautiful.widget_note_on)
        elseif mpd_now.state == "pause" then
            artist = "mpd "
            title  = "paused "
        else
            artist = ""
            title  = ""
            mpdicon:set_image(nil)
        end
        widget:set_markup(markup("#e54c62", artist) .. markup("#b2b2b2", title))
    end
})

-- Spacer
spacer = wibox.widget.textbox(" ")

-- }}}

-- {{{ Layout
-- Create a wibox for each screen and add it
mywibox = {}
mybottomwibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do

    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()

    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                            awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                            awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                            awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                            awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))

    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the upper left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the upper right
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(mailicon)
    right_layout:add(mailwidget)
    right_layout:add(netdownicon)
    right_layout:add(netdowninfo)
    -- right_layout:add(netupicon)
    -- right_layout:add(netupinfo)
    right_layout:add(memicon)
    right_layout:add(memwidget)
    right_layout:add(cpuicon)
    right_layout:add(cpuwidget)
    -- right_layout:add(mpdicon)
    -- right_layout:add(mpdwidget)
    -- right_layout:add(fsicon)
    -- right_layout:add(fswidget)
    -- right_layout:add(weathericon)
    -- right_layout:add(yawn.widget)
    right_layout:add(tempicon)
    right_layout:add(tempwidget)
	right_layout:add(volicon)
	right_layout:add(volumewidget)
    right_layout:add(baticon)
    right_layout:add(batwidget)
    right_layout:add(clockicon)
    right_layout:add(mytextclock)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)

end
-- }}}

-- {{{ Mouse Bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(

   -- Capture a screenshot
   awful.key({ altkey }, "p", function() awful.util.spawn("screenshot",false) end),

   awful.key({ }, "XF86AudioNext",function () awful.util.spawn( "mpc next" ) end),
   awful.key({ }, "XF86AudioPrev",function () awful.util.spawn( "mpc prev" ) end),
   awful.key({ }, "XF86AudioPlay",function () awful.util.spawn( "mpc play" ) end),
   awful.key({ }, "XF86AudioStop",function () awful.util.spawn( "mpc pause" ) end),
  
   awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
   awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
   awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
   awful.key({ modkey,           }, "j",
			 function ()
				awful.client.focus.byidx( 1)
				if client.focus then client.focus:raise() end
   end),
   awful.key({ modkey,           }, "k",
			 function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
   end),
   awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

   -- Layout manipulation
   awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
   awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
   awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
   awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
   awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
   awful.key({ modkey,           }, "Tab",
			 function ()
            awful.client.focus.history.previous()
            if client.focus then
			   client.focus:raise()
            end
   end),
   
   -- Standard program
   awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
   awful.key({ modkey, "Control" }, "r", awesome.restart),
   awful.key({ modkey, "Shift"   }, "q", awesome.quit),
   
   awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
   awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
   awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
   awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
   awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
   awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
   awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
   awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),
	
   awful.key({ modkey, "Control" }, "n", awful.client.restore),
   
   -- Prompt
   awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

   awful.key({ modkey }, "x",
              function ()
				 awful.prompt.run({ prompt = "Run Lua code: " },
								  mypromptbox[mouse.screen].widget,
								  awful.util.eval, nil,
								  awful.util.getdir("cache") .. "/history_eval")
   end),
   -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end),
	---------{{{{ begin define myself keybinds }}}}
	
    -- Dropdown terminal
    awful.key({ modkey,	          }, "z",      function () drop(terminal) end),
	
    -- Widgets popups
    awful.key({ altkey,           }, "c",      function () lain.widgets.calendar:show(7) end),
    -- awful.key({ altkey,           }, "h",      function () fswidget.show(7) end),
	--  awful.key({ altkey,           }, "w",      function () yawn.show(7) end),
	
--Thinkpad volume control
	awful.key({ }, "XF86AudioRaiseVolume",
			  function ()
				 awful.util.spawn("amixer -q set Master 5%+")
				 volumewidget.update()
	end),

	awful.key({ }, "XF86AudioLowerVolume",
			  function ()
				 awful.util.spawn("amixer -q set Master 5%-")
				 volumewidget.update()
	end),
	
awful.key({ }, "XF86AudioMute",
		  function ()
			 awful.util.spawn("amixer -q set Master playback toggle")
				 volumewidget.update()
end),


-- ALSA volume control
awful.key({ altkey }, "Up",
		  function ()
            awful.util.spawn("amixer -q set Master 1%+")
            volumewidget.update()
end),

awful.key({ altkey }, "Down",
		  function ()
			 awful.util.spawn("amixer -q set Master 1%-")
            volumewidget.update()
end),
awful.key({ altkey }, "m",
        function ()
		   awful.util.spawn("amixer -q set Master playback toggle")
		   volumewidget.update()
        end),
awful.key({ altkey, "Control" }, "m",
		  function ()
            awful.util.spawn("amixer -q set Master playback 100%")
            volumewidget.update()
end),

    -- MPD control
awful.key({ altkey, "Control" }, "Up",
        function ()
		   awful.util.spawn_with_shell("mpc toggle || ncmpcpp toggle || ncmpc toggle || pms toggle")
		   mpdwidget.update()
end),
    awful.key({ altkey, "Control" }, "Down",
			  function ()
				 awful.util.spawn_with_shell("mpc stop || ncmpcpp stop || ncmpc stop || pms stop")
				 mpdwidget.update()
        end),
    awful.key({ altkey, "Control" }, "Left",
			  function ()
				 awful.util.spawn_with_shell("mpc prev || ncmpcpp prev || ncmpc prev || pms prev")
				 mpdwidget.update()
	end),
    awful.key({ altkey, "Control" }, "Right",
			  function ()
				 awful.util.spawn_with_shell("mpc next || ncmpcpp next || ncmpc next || pms next")
				 mpdwidget.update()
        end),
	
    -- User programs
    awful.key({ "Control", altkey }, "q", function () awful.util.spawn(browser) end),
    awful.key({ "Control", altkey }, "i", function () awful.util.spawn(browser2) end),
    awful.key({ "Control", altkey }, "e", function () awful.util.spawn(gui_editor) end),
    awful.key({ "Control", altkey }, "g", function () awful.util.spawn(graphics) end),
    awful.key({ "Control", altkey }, "o", function () awful.util.spawn(filemanager) end),

	--backlight control
	awful.key({ }, "XF86MonBrightnessDown", function () awful.util.spawn("xbacklight -dec 10") end),
	awful.key({ }, "XF86MonBrightnessUp" , function () awful.util.spawn("xbacklight -inc 10") end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey,           }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}


-- 需要自动设置为浮动的程序
-- 只需要把你想要设置为浮动窗口的程序的Instance或者class按照下面的格式写进去就行
-- 了。在awesome下用Mod4 + Ctr + i就可以看到当前程序的instance和class名字
-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    { rule = { class = "Firefox" },
      properties = { tag = tags[1][2] } },
	{rule = {class = "Firefox", name = "Download"},
     properties = {floating = true}},
	{rule = {class = "docky"},
	properties = {floating = true}}
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

------配置qq2013,解决窗口飘动的问题

function myfocus_filter(c)
  if awful.client.focus.filter(c) then
    -- This works with tooltips and some popup-menus
    if c.class == 'Wine' and c.above == true then
      return nil
    elseif c.class == 'Wine'
      and c.type == 'dialog'
      and c.skip_taskbar == true
      and c.size_hints.max_width and c.size_hints.max_width < 160
      then
      -- for popup item menus of Photoshop CS5
      return nil
    else
      return c
    end
  end
end

awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = { },
    properties = {
      -- 这里使用我们自己的函数
      focus = myfocus_filter,
      -- 以下是默认的部分
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      keys = clientkeys,
      buttons = clientbuttons,
    }
  }, {
    rule_any = {
      instance = {'TM.exe', 'QQ.exe'},
    },
    properties = {
      -- This, together with myfocus_filter, make the popup menus flicker taskbars less
      -- Non-focusable menus may cause TM2013preview1 to not highlight menu
      -- items on hover and crash.
      focusable = true,
      floating = true,
      -- 去掉边框
      border_width = 0,
    }
  }, {
    -- 其它规则
  }
}

alt_switch_keys = awful.util.table.join(
    -- it's easier for a vimer to manage this than figuring out a nice way to loop and concat
    awful.key({'Mod1'}, 1, function(c) awful.util.spawn('xdotool key --window ' .. c.window .. ' ctrl+1') end),
    awful.key({'Mod1'}, 2, function(c) awful.util.spawn('xdotool key --window ' .. c.window .. ' ctrl+2') end),
    awful.key({'Mod1'}, 3, function(c) awful.util.spawn('xdotool key --window ' .. c.window .. ' ctrl+3') end),
    awful.key({'Mod1'}, 4, function(c) awful.util.spawn('xdotool key --window ' .. c.window .. ' ctrl+4') end),
    awful.key({'Mod1'}, 5, function(c) awful.util.spawn('xdotool key --window ' .. c.window .. ' ctrl+5') end),
    awful.key({'Mod1'}, 6, function(c) awful.util.spawn('xdotool key --window ' .. c.window .. ' ctrl+6') end),
    awful.key({'Mod1'}, 7, function(c) awful.util.spawn('xdotool key --window ' .. c.window .. ' ctrl+7') end),
    awful.key({'Mod1'}, 8, function(c) awful.util.spawn('xdotool key --window ' .. c.window .. ' ctrl+8') end),
    awful.key({'Mod1'}, 9, function(c) awful.util.spawn('xdotool key --window ' .. c.window .. ' ctrl+9') end)
)
function bind_alt_switch_tab_keys(client)
    client:keys(awful.util.table.join(client:keys(), alt_switch_keys))
end -- }}}

client.connect_signal("manage", function (c, startup)
  -- 其它配置

  if c.instance == 'TM.exe' then
    -- 添加 Alt+n 支持
    bind_alt_switch_tab_keys(c)
    -- 关闭各类新闻通知小窗口
    if c.name and c.name:match('^腾讯') and c.above then
      c:kill()
    end
  end

  -- 其它配置
end)


client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

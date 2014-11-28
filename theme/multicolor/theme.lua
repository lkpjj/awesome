theme                               = {}

theme.confdir                       = os.getenv("HOME") .. "/.config/awesome/theme/multicolor"
theme.wallpaper                     = theme.confdir .. "/kakaxi.jpg"

-- theme.font                          = "HeldustryFTVBasic Black 9"
theme.font                          = "WenQuanYi Zen Hei Mono:style=Medium 10"

-- {{{ Colors
theme.fg_normal = "#aaaaaa"
theme.fg_focus  = "#ff0033"
theme.fg_urgent = "#929392"
theme.bg_normal = "#1c1d1c88"
theme.bg_focus  = "#0c0d0c88"
theme.bg_urgent = "#34353488"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.border_width  = "1.5"
theme.border_normal = "#727352"
theme.border_focus  = "#ff0303"
theme.border_marked = "#fc0303"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3F3F3F"
theme.titlebar_bg_normal = "#3F3F3F"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

---{{{ widgets icons
theme.widget_temp                   = theme.confdir .. "/icons/temp.png"
theme.widget_uptime                 = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                    = theme.confdir .. "/icons/cpu.png"
theme.widget_weather                = theme.confdir .. "/icons/dish.png"
theme.widget_fs                     = theme.confdir .. "/icons/fs.png"
theme.widget_mem                    = theme.confdir .. "/icons/mem.png"
theme.widget_fs                     = theme.confdir .. "/icons/fs.png"
theme.widget_note                   = theme.confdir .. "/icons/note.png"
theme.widget_note_on                = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown                = theme.confdir .. "/icons/net_down.png"
theme.widget_netup                  = theme.confdir .. "/icons/net_up.png"
theme.widget_mail                   = theme.confdir .. "/icons/mail.png"
theme.widget_batt                   = theme.confdir .. "/icons/bat.png"
theme.widget_clock                  = theme.confdir .. "/icons/clock.png"
theme.widget_vol                    = theme.confdir .. "/icons/spkr.png"
---}}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = "20"
theme.menu_width  = "110"
-- }}}

---{{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel           = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel         = theme.confdir .. "/icons/square_b.png"
theme.tasklist_disable_icon         = nil
theme.tasklist_floating             = ""
theme.tasklist_maximized_horizontal = ""
theme.tasklist_maximized_vertical   = ""
-- }}}

--- {{{ Msic
theme.awesome_icon                  = theme.confdir .. "/icons/awesome-icon.png"
theme.menu_submenu_icon             = theme.confdir .. "/icons/submenu.png"
--- }}}

---{{{ layout
theme.layout_tile                   = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps               = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft               = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom             = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                  = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                  = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                 = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle                = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                    = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen             = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier              = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating               = theme.confdir .. "/icons/floating.png"
--- }}}


---{{{ application icons
theme.acroread_icon                             = theme.confdir .. "/icons/acroread.png"
theme.anki_icon                                 = theme.confdir .. "/icons/anki.png"
theme.bcloud_icon                               = theme.confdir .. "/icons/bcloud.png"
theme.books_assembler_icon                      = theme.confdir .. "/icons/books_assembler.png"
theme.binclock_bgicon                           = theme.confdir .. "/icons/transbinclock.png"
theme.books_c_icon                              = theme.confdir .. "/icons/books_c.png"
theme.books_ror_icon                            = theme.confdir .. "/icons/books_ror.png"
theme.books_cpp_icon                            = theme.confdir .. "/icons/books_cpp.png"
theme.books_db_icon                             = theme.confdir .. "/icons/books_db.png"
theme.books_dlang_icon                          = theme.confdir .. "/icons/books_dlang.png"
theme.books_erlang_icon                         = theme.confdir .. "/icons/books_erlang.png"
theme.books_java_icon                           = theme.confdir .. "/icons/books_java.png"
theme.books_js_icon                             = theme.confdir .. "/icons/books_js.png"
theme.books_vcs_icon                            = theme.confdir .. "/icons/books_vcs.png"
theme.books_markup_icon                         = theme.confdir .. "/icons/books_markup.png"
theme.books_python_icon                         = theme.confdir .. "/icons/books_python.png"
theme.books_ruby_icon                           = theme.confdir .. "/icons/books_ruby.png"
theme.cancle_icon                               = theme.confdir .. "/icons/cancle.png"
theme.cdrom                                     = theme.confdir .. "/icons/disc.png"
theme.chromium_icon                             = theme.confdir .. "/icons/chromium.png"
theme.chrome_icon                               = theme.confdir .. "/icons/chrome.png"
theme.cups_icon                                 = theme.confdir .. "/icons/cups.png"
theme.deadbeef_icon                             = theme.confdir .. "/icons/deadbeef.png"
theme.djview_icon                               = theme.confdir .. "/icons/djview.png"
theme.dropbox_icon                              = theme.confdir .. "/icons/dropbox.png"
theme.dwb_icon                                  = theme.confdir .. "/icons/dwb.png"
theme.eclipse_icon                              = theme.confdir .. "/icons/eclipse.png"
theme.emacs_icon                                = theme.confdir .. "/icons/emacs.png"
theme.evince_icon                               = theme.confdir .. "/icons/evince.png"
theme.editor_icon                               = theme.confdir .. "/icons/editor.png"
theme.fav_icon                                  = theme.confdir .. "/icons/fav.png"
theme.firefox_icon                              = theme.confdir .. "/icons/firefox.png"
theme.filemanager_icon                          = theme.confdir .. "/icons/filemanager.png"
theme.fontypython_icon                          = theme.confdir .. "/icons/fontypython.png"
theme.free42_icon                               = theme.confdir .. "/icons/free42.png"
theme.gajim_icon                                = theme.confdir .. "/icons/gajim.png"
theme.gcalctool_icon                            = theme.confdir .. "/icons/gcalctool.png"
theme.gcolor_icon                               = theme.confdir .. "/icons/gcolor2.png"
theme.gelemental_icon                           = theme.confdir .. "/icons/gelemental.png"
theme.gimp_icon                                 = theme.confdir .. "/icons/gimp.png"
theme.goldendict_icon                           = theme.confdir .. "/icons/goldendict.png"
theme.gparted_icon                              = theme.confdir .. "/icons/gparted.png"
theme.gthumb_icon                               = theme.confdir .. "/icons/gthumb.png"
theme.gucharmap_icon                            = theme.confdir .. "/icons/gucharmap.png"
theme.gwenview_icon                             = theme.confdir .. "/icons/gwenviwer.png"
theme.htop_icon                                 = theme.confdir .. "/icons/htop.png"
theme.ideaCE_icon                               = theme.confdir .. "/icons/ideaCE.png"
theme.ideaUE_icon                               = theme.confdir .. "/icons/ideaUE.png"
theme.kchmviewer_icon                           = theme.confdir .. "/icons/kchmviewer.png"
theme.kdiff3_icon                               = theme.confdir .. "/icons/kdiff3.png"
theme.leafpad_icon                              = theme.confdir .. "/icons/leafpad.png"
theme.learning_icon                             = theme.confdir .. "/icons/learning.png"
theme.librebase_icon                            = theme.confdir .. "/icons/libreoffice-base.png"
theme.librecalc_icon                            = theme.confdir .. "/icons/libreoffice-calc.png"
theme.libredraw_icon                            = theme.confdir .. "/icons/libreoffice-draw.png"
theme.libreimpress_icon                         = theme.confdir .. "/icons/libreoffice-impress.png"
theme.libremath_icon                            = theme.confdir .. "/icons/libreoffice-math.png"
theme.librewriter_icon                          = theme.confdir .. "/icons/libreoffice-writer.png"
theme.books_linux_icon                          = theme.confdir .. "/icons/books_linux.png"
theme.mathematica_icon                          = theme.confdir .. "/icons/mathematica.png"
theme.menu_books_icon                           = theme.confdir .. "/icons/menu_books.png"
theme.menu_development_icon                     = theme.confdir .. "/icons/menu_development.png"
theme.menu_docs_icon                            = theme.confdir .. "/icons/menu_docs.png"
theme.menu_education_icon                       = theme.confdir .. "/icons/menu_education.png"
theme.menu_program_icon                         = theme.confdir .. "/icons/program.png"
theme.menu_graphics_icon                        = theme.confdir .. "/icons/menu_graphics.png"
theme.menu_multimedia_icon                      = theme.confdir .. "/icons/menu_multimedia.png"
theme.menu_office_icon                          = theme.confdir .. "/icons/menu_office.png"
theme.menu_settings_icon                        = theme.confdir .. "/icons/menu_settings.png"
theme.menu_tools_icon                           = theme.confdir .. "/icons/menu_tools.png"
theme.menu_web_icon                             = theme.confdir .. "/icons/menu_web.png"
theme.multiplemonitors_icon                     = theme.confdir .. "/icons/multiple_monitors.png"
theme.nvidia_icon                               = theme.confdir .. "/icons/nvidia-settings.png"
theme.okular_icon                               = theme.confdir .. "/icons/okular.png"
theme.qalculate_icon                            = theme.confdir .. "/icons/qalculate.png"
theme.qbittorrent_icon                          = theme.confdir .. "/icons/qbittorrent.png"
theme.qpdfview_icon                             = theme.confdir .. "/icons/pdf.png"
theme.qt_icon                                   = theme.confdir .. "/icons/qt.png"
theme.qq_icon                                   = theme.confdir .. "/icons/qq.png"
theme.rubymine_icon                             = theme.confdir .. "/icons/rubymine.png"
theme.screengrab_icon                           = theme.confdir .. "/icons/screengrab.png"
theme.shutdown_icon                             = theme.confdir .. "/icons/shutdown.png"
theme.sigil_icon                                = theme.confdir .. "/icons/sigil.png"
theme.skype_icon                                = theme.confdir .. "/icons/skype.png"
theme.smplayer_icon                             = theme.confdir .. "/icons/smplayer.png"
theme.spacefm_icon                              = theme.confdir .. "/icons/fm.png"
theme.steam_icon                                = theme.confdir .. "/icons/steam.png"
theme.sublime_icon                              = theme.confdir .. "/icons/sublime_text.png"
theme.synapse_icon                              = theme.confdir .. "/icons/synapse.png"
theme.synergy_icon                              = theme.confdir .. "/icons/synergy.png"
theme.teamviewer_icon                           = theme.confdir .. "/icons/teamviewer.png"
theme.terminal_icon                             = theme.confdir .. "/icons/terminal.png"
theme.terminalroot_icon                         = theme.confdir .. "/icons/terminal-root.png"
theme.texworks_icon                             = theme.confdir .. "/icons/TeXworks.png"
theme.texmaker_icon                             = theme.confdir .. "/icons/texmaker.png"
theme.thunderbird_icon                          = theme.confdir .. "/icons/thunderbird.png"
theme.tkdiff_icon                               = theme.confdir .. "/icons/tkdiff.png"
theme.tor_icon                                  = theme.confdir .. "/icons/tor.png"
theme.virtualbox_icon                           = theme.confdir .. "/icons/virtualbox.png"
theme.vlc_icon                                  = theme.confdir .. "/icons/vlc.png"
theme.wmsmixer_icon                             = theme.confdir .. "/icons/qasmixer.png"
theme.xmag_icon                                 = theme.confdir .. "/icons/xmag.png"
theme.xmind_icon                                = theme.confdir .. "/icons/xmind.png"
theme.xnview_icon                               = theme.confdir .. "/icons/xnview.png"
theme.xvkbd_icon                                = theme.confdir .. "/icons/xvkbd.png"
---}}}
---}}}
return theme

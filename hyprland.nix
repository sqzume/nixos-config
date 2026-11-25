{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    settings = {
      monitor = [
        {
          output = "Virtual-1";
          mode = "1920x1080@60";
          position = "auto";
          scale = "1";
        }
      ];

      mod = {
        _var = "SUPER";
      };
      terminal = {
        _var = "kitty";
      };
      menu = {
        _var = "";
      };
      browser = {
        _var = "kitty";
      };
      fileManager = {
        _var = "kitty";
      };

      config = {
        general = {
          gaps_in = 10;
          gaps_out = 10;
          border_size = 2;
        };
        decoration = {
          rounding = 5;
          blur = {
            size = 3;
            passes = 3;
          };
        };
        dwindle.preserve_split = true;
        input = {
          repeat_delay = 220;
          repeat_rate = 30;
          accel_profile = "flat";
        };
      };
    };

    extraConfig = /* lua */ ''
      -- おーとすたーと
      hl.on("hyprland.start", function()
        hl.exec_cmd("quickshell")
        hl.exec_cmd("fcitx5 -d")
      end)

      -- きーばいんど
      hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(terminal))
      hl.bind(mod .. " + C",      hl.dsp.window.close())
      hl.bind(mod .. " + M",      hl.dsp.exec_cmd("wlogout"))
      hl.bind(mod .. " + E",      hl.dsp.exec_cmd(fileManager))
      hl.bind(mod .. " + V",      hl.dsp.window.float({ action = "toggle" }))
      hl.bind(mod .. " + SPACE",  hl.dsp.exec_cmd(menu))
      hl.bind(mod .. " + P",      hl.dsp.window.close())
      hl.bind(mod .. " + B",      hl.dsp.exec_cmd(browser))
      hl.bind(mod .. " + F",      hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
      hl.bind(mod .. " + D",      hl.dsp.exec_cmd("slurp | grim -g - - | wl-copy"))

      -- ふぉーかすいどう
      hl.bind(mod .. " + H",  hl.dsp.focus({ direction = "left" }))
      hl.bind(mod .. " + J",  hl.dsp.focus({ direction = "down" }))
      hl.bind(mod .. " + K",  hl.dsp.focus({ direction = "up" }))
      hl.bind(mod .. " + L",  hl.dsp.focus({ direction = "right" }))

      for i = 1, 10 do
        local key = i % 10
        hl.bind(mod .. " + " .. key,        hl.dsp.focus({ workspace = i }))
        hl.bind(mod .. " + SHIFT +" .. key, hl.dsp.window.move({ workspace = i }))
      end
    '';
  };
}

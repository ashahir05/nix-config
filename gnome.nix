{ config, pkgs, lib, ... }: {
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      font-antialiasing = "rgba";
      monospace-font-name = "Iosevka Nerd Font Mono 13";
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      click-method = "areas";
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      action-middle-click-titlebar = "minimize";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
	      "appindicatorsupport@rgcjonas.gmail.com"
	      "drive-menu@gnome-shell-extensions.gcampax.github.com"
	      "caffeine@patapon.info"
	      "paperwm@hedning:matrix.org"
        "clipboard-history@alexsaveau.dev"
      ];
    };
    
    "org/gnome/shell/extensions/paperwm" = {
      use-default-background = true;
      vertical-margin = 10;
      vertical-margin-bottom = 10;
      horizontal-margin = 10;
      window-gap = 8;
      show-window-position-bar = false;
      only-scratch-in-overview = false;
    };
    "org/gnome/shell/extensions/paperwm/keybindings" = {
      switch-left = [ "<Super>h" ];
      switch-right = [ "<Super>l" ];
      switch-up = [ "<Super>k" ];
      switch-down = [ "<Super>j" ];
      switch-up-workspace = [ "<Control><Alt>k" ];
      switch-down-workspace = [ "<Control><Alt>j" ];

      move-left = [ "<Alt><Shift>h" ];
      move-right = [ "<Alt><Shift>l" ];
      move-up = [ "<Alt><Shift>k" ];
      move-down = [ "<Alt><Shift>j" ];
      move-up-workspace = [ "<Control><Shift>k" ];
      move-down-workspace = [ "<Control><Shift>j" ];
      
      toggle-scratch-layer = [ "<Super>s" ];
      toggle-scratch = [ "<Alt><Shift>s" ];
      toggle-scratch-window = [ "<Control><Shift>s" ];
    };
    
    "org/gnome/shell/extensions/espresso" = {
      show-notifications = false;
    };
    
    "org/gnome/shell/overrides" = {
      workspaces-only-on-primary = false;
      edge-tiling = false;
      attach-modal-dialogs = false;
    };
    
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };
    
    "org/gnome/desktop/session" = {
      idle-delay = lib.hm.gvariant.mkUint32 900;
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = [];
      switch-applications-backwards = [];
      switch-windows = [
        "<Super>Tab"
	"<Alt>Tab"
      ];
      switch-windows-backward = [
        "<Shift><Super>Tab"
        "<Shift><Alt>Tab"
      ];
      close = [
        "<Super>Q"
	"<Alt>F4"
      ];
      minimize = [ "<Super>m" ];
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/open-console/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/open-files/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/open-system-monitor/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/open-console" = {
      name = "Open Console";
      command = "kgx";
      binding = "<Control><Alt>c";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/open-files" = {
      name = "Open Files";
      command = "nautilus";
      binding = "<Control><Alt>f";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/open-system-monitor" = {
      name = "Open System Monitor";
      command = "gnome-system-monitor";
      binding = "<Control><Shift>Escape";
    };
  };
  
  gtk = {
    enable = true;
    theme.name = "adw-gtk3-dark";
    theme.package = pkgs.adw-gtk3;
  };
  
  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME="gtk3";
    QT_STYLE_OVERRIDE="fusion";
  };
}

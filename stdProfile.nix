{ stdProfilePath, pkgs, lib, budUtils, ... }: {
  bud.cmds = with pkgs; {
    update = {
      writer = budUtils.writeBashWithPaths [ nixUnstable git mercurial ];
      synopsis = "update [INPUT]";
      help = "Update and commit $FLAKEROOT/flake.lock file or specific input";
      script = ./scripts/utils-update.bash;
    };

    repl = {
      writer = budUtils.writeBashWithPaths [ nixUnstable gnused git coreutils ];
      synopsis = "repl [FLAKE]";
      help = "Enter a repl with the flake's outputs";
      script = (import ./scripts/utils-repl pkgs).outPath;
    };

    home = {
      writer = budUtils.writeBashWithPaths [ nixUnstable git coreutils ];
      synopsis = "home [switch] (user@fqdn | USER HOST | USER)";
      help =
        "Home-manager config of USER from HOST or host-less portable USER for current architecture";
      script = ./scripts/hm-home.bash;
    };

    build = {
      writer = budUtils.writeBashWithPaths [ nixUnstable git coreutils ];
      synopsis = "build HOST BUILD";
      help = "Build a variant of your configuration from system.build";
      script = ./scripts/hosts-build.bash;
    };

    rebuild = {
      writer =
        budUtils.writeBashWithPaths [ git coreutils ];
      synopsis = "rebuild HOST (switch|boot|test)";
      help = "Shortcut for darwin-rebuild";
      script = ./scripts/hosts-rebuild.bash;
    };
  };
}

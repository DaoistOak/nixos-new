{ config, pkgs, ... }:

{
  # Define user accounts
  users.users.zeph = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "SD";
    extraGroups = [ "networkmanager" "wheel" "audio" "libvirtd" "kvm" "qemu-libvirtd" "nixos" "dialout" "video" "render" "seat" "docker"];
  };

  # User-specific environment variables
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    ZDOTDIR = "/home/zeph/.config/zsh";
    XDG_CONFIG_HOME = "/home/zeph/.config";
    XDG_DATA_HOME = "/home/zeph/.local/share";
    XDG_CACHE_HOME = "/home/zeph/.cache";
  };
  environment.sessionVariables = {
    AMD_VULKAN_ICD = "RADV";
    VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json:/run/opengl-driver/share/vulkan/icd.d/radeon_icd.i686.json";
  };
  # Enable Zsh
  programs.zsh.enable = true;
  programs.direnv.enableZshIntegration=true;


}

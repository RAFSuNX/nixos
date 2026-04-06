{ config, lib, pkgs, ... }:

{
  # 1. Enable Graphics Drivers.
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Required for Steam/Wine
  };

  # 2. NVIDIA Driver Configuration.
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    # Modesetting is required for Hyprland.
    modesetting.enable = true;

    # Use the NVidia open source kernel module (required for RTX 50-series).
    open = true;

    # Enable the Nvidia settings menu.
    nvidiaSettings = true;

    # Fixes suspend/resume issues (essential for laptops).
    powerManagement.enable = true;

    # Fine-grained power management (Advanced Battery Saving).
    # Turns off GPU when not in use. Works best with Turing+.
    powerManagement.finegrained = true;

    # Select the beta driver for the best RTX 50-series support (version 570+).
    package = config.boot.kernelPackages.nvidiaPackages.beta;

    # NVIDIA PRIME (Offload Mode) for Hybrid Graphics.
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      # Bus IDs for AMD (Integrated) and NVIDIA (Dedicated).
      amdgpuBusId = "PCI:64:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # 3. Kernel Parameters for NVIDIA Stability.
  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=1" # Better console resolution and transition to Wayland
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1" # Essential for suspend/resume stability
  ];

  # 4. Essential Environment Variables.
  environment.sessionVariables = {
    # Hint Electron apps to use Wayland.
    NIXOS_OZONE_WL = "1";
    # Hardware acceleration for NVIDIA.
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    # Force GBM backend.
    GBM_BACKEND = "nvidia-drm";
    # Ensure apps use the correct Wayland backend.
    GDK_BACKEND = "wayland,x11,*";
    QT_QPA_PLATFORM = "wayland;xcb";
  };

  # 5. Enable NVIDIA Container Toolkit for GPU acceleration in containers.
  hardware.nvidia-container-toolkit.enable = true;
}

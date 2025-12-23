{ config, pkgs, lib, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics.enable = true;

boot.kernelParams = [
  "nvidia-drm.modeset=1"
  "nvidia-drm.fbdev=1"      # Better console/Plymouth support
  "nvidia.NVreg_PreserveVideoMemoryAllocations=1"  # Preserve VRAM on suspend
];

boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

boot.extraModprobeConfig = ''
  options nvidia NVreg_PreserveVideoMemoryAllocations=1
'';
systemd.services.nvidia-suspend.enable = true;
systemd.services.nvidia-resume.enable = true;
systemd.services.nvidia-hibernate.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    forceFullCompositionPipeline = false;  # Better for Wayland
    package = config.boot.kernelPackages.nvidiaPackages.beta;

    #prime = {
     # offload.enable = true;
      #nvidiaBusId = "PCI:1:0:0";
      #amdgpuBusId = "PCI:54:0:0";
    #};
  };
}

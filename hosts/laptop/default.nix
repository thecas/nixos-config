{ pkgs, config, disko, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
    ./disk-config.nix
  ];

  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
    cpupower-gui
    powertop
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;



  services = {
    power-profiles-daemon.enable = false;

    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
    };

    tlp = {
      enable = true;
      settings = {

        CPU_ENERGY_PERF_POLICY_ON_AC = "power";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 1;

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 1;

        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "performance";

        #Hyprland optimalisation
        INTEL_GPU_MIN_FREQ_ON_AC=500;
        INTEL_GPU_MIN_FREQ_ON_BAT=500;

        # helps save long term battery health
        START_CHARGE_THRESH_BAT0 = 70; # 45 and bellow it starts to charge
        STOP_CHARGE_THRESH_BAT0 = 85; # 85 and above it stops charging


        # INTEL_GPU_MAX_FREQ_ON_AC=0;
        # INTEL_GPU_MAX_FREQ_ON_BAT=0;
        # INTEL_GPU_BOOST_FREQ_ON_AC=0;
        # INTEL_GPU_BOOST_FREQ_ON_BAT=0;

        # PCIE_ASPM_ON_AC = "default";
        # PCIE_ASPM_ON_BAT = "powersupersave";
      };
    };
  };

  powerManagement.cpuFreqGovernor = "performance";

  boot = {
    kernelModules = ["acpi_call"];
    extraModulePackages = with config.boot.kernelPackages;
      [
        acpi_call
        cpupower
      ]
      ++ [pkgs.cpupower-gui];
  };
}

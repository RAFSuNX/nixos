{ config, pkgs, ... }:
let
  nbfcConfig = pkgs.writeText "nbfc.json" (builtins.toJSON {
    NotebookModel = "Acer Nitro ANV15-52";
    LegacyTemperatureThresholdsBehaviour = true;
    EcPollInterval = 3000;
    ReadWriteWords = false;
    CriticalTemperature = 95;
    FanConfigurations = [
      {
        ReadRegister = 92;
        WriteRegister = 73;
        MinSpeedValue = 0;
        MaxSpeedValue = 100;
        ResetRequired = false;
        FanSpeedResetValue = 0;
        TemperatureThresholds = [
          { UpThreshold = 0;  DownThreshold = 0;  FanSpeed = 0.0;   }
          { UpThreshold = 35; DownThreshold = 30; FanSpeed = 0.0;   }
          { UpThreshold = 45; DownThreshold = 40; FanSpeed = 30.0;  }
          { UpThreshold = 55; DownThreshold = 50; FanSpeed = 50.0;  }
          { UpThreshold = 65; DownThreshold = 60; FanSpeed = 70.0;  }
          { UpThreshold = 75; DownThreshold = 70; FanSpeed = 90.0;  }
          { UpThreshold = 85; DownThreshold = 80; FanSpeed = 100.0; }
        ];
      }
      {
        ReadRegister = 106;
        WriteRegister = 74;
        MinSpeedValue = 0;
        MaxSpeedValue = 100;
        ResetRequired = false;
        FanSpeedResetValue = 0;
        TemperatureThresholds = [
          { UpThreshold = 0;  DownThreshold = 0;  FanSpeed = 0.0;   }
          { UpThreshold = 35; DownThreshold = 30; FanSpeed = 0.0;   }
          { UpThreshold = 45; DownThreshold = 40; FanSpeed = 30.0;  }
          { UpThreshold = 55; DownThreshold = 50; FanSpeed = 50.0;  }
          { UpThreshold = 65; DownThreshold = 60; FanSpeed = 70.0;  }
          { UpThreshold = 75; DownThreshold = 70; FanSpeed = 90.0;  }
          { UpThreshold = 85; DownThreshold = 80; FanSpeed = 100.0; }
        ];
      }
    ];
    RegisterWriteConfigurations = [
      {
        WriteMode = "Set";
        WriteOccasion = "OnInitialization";
        Register = 190;
        Value = 0;
        ResetRequired = true;
        ResetValue = 224;
        ResetWriteMode = "Set";
        Description = "Set EC to manual/enabled control mode";
      }
    ];
  });
in {
  systemd.services.nbfc_service = {
    enable = true;
    description = "NoteBook FanControl service";
    serviceConfig.Type = "simple";
    path = [ pkgs.kmod ];
    script = "${pkgs.nbfc-linux}/bin/nbfc_service --config-file '${nbfcConfig}'";
    wantedBy = [ "multi-user.target" ];
  };
}

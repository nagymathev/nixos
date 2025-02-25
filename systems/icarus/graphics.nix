{pkgs, ...}: {
  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
    intel-ocl
    intel-vaapi-driver
    vpl-gpu-rt
  ];

  # Apparently X Server may fail to start with the newer 12th generation, Alder Lake, intel cpus.
  # I put this here just in case.
  boot.kernelParams = ["i915.force_probe=46a8"];
}

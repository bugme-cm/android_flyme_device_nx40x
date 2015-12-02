#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 10868736 6f0bec7330827d5b927d0656be135eacd78d6918 8589312 bf21820c6cf1707877dd7f0ccc9ceeb989aedc11
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:10868736:6f0bec7330827d5b927d0656be135eacd78d6918; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:8589312:bf21820c6cf1707877dd7f0ccc9ceeb989aedc11 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 6f0bec7330827d5b927d0656be135eacd78d6918 10868736 bf21820c6cf1707877dd7f0ccc9ceeb989aedc11:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

# /opt/petalinux/sysroots/x86_64-petalinux-linux/usr/bin/qemu-system-microblazeel -M microblaze-fdt  \
# -serial mon:stdio -serial /dev/null -display none  \
# -kernel /home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/pmu_rom_qemu_sha3.elf \
# -device loader,file=/home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/pmufw.elf \
# -hw-dtb /home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/zynqmp-qemu-multiarch-pmu.dtb \
# -machine-path /tmp/tmp4qn4ywb7 -device loader,addr=0xfd1a0074,data=0x1011003,data-len=4 \
# -device loader,addr=0xfd1a007C,data=0x1010f03,data-len=4 &

# /opt/petalinux/sysroots/x86_64-petalinux-linux/usr/bin/qemu-system-aarch64 -M arm-generic-fdt  \
# -serial mon:stdio -serial /dev/null -display none  \
# -device loader,file=/home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/system.dtb,addr=0x100000,force-raw=on  \
# -device loader,file=/home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/u-boot.elf \
# -device loader,file=/home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/Image,addr=0x200000,force-raw=on  \
# -device loader,file=/home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/rootfs.cpio.gz.u-boot,addr=0x04000000,force-raw=on  \
# -device loader,file=/home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/bl31.elf,cpu-num=0 \
# -hw-dtb /home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/zynqmp-qemu-multiarch-arm.dtb \
# -device loader,file=/home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/boot.scr,addr=0x20000000,force-raw=on  \
# -gdb tcp:localhost:9000  -net nic -net nic -net nic -net nic,netdev=eth3 -netdev user,id=eth3, \
# -machine-path /tmp/tmp4qn4ywb7  \
# -global xlnx,zynqmp-boot.cpu-num=0 \
# -global xlnx,zynqmp-boot.use-pmufw=true \
# -m 4G

/opt/petalinux/sysroots/x86_64-petalinux-linux/usr/bin/qemu-system-microblazeel -M microblaze-fdt  \
-serial mon:stdio -serial /dev/null -display none  \
-kernel /home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/pmu_rom_qemu_sha3.elf \
-device loader,file=/home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/pmufw.elf \
-hw-dtb /home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/zynqmp-qemu-multiarch-pmu.dtb \
-machine-path /tmp/tmpuotisquj -device loader,addr=0xfd1a0074,data=0x1011003,data-len=4 \
-device loader,addr=0xfd1a007C,data=0x1010f03,data-len=4 &
sleep 3
/opt/petalinux/sysroots/x86_64-petalinux-linux/usr/bin/qemu-system-aarch64  -M arm-generic-fdt  \
-serial mon:stdio -serial /dev/null -display none  \
-device loader,file=/home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/system.dtb,addr=0x100000,force-raw=on  \
-device loader,file=/home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/u-boot.elf \
-device loader,file=/home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/Image,addr=0x200000,force-raw=on  \
-device loader,file=/home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/rootfs.cpio.gz.u-boot,addr=0x04000000,force-raw=on \
-device loader,file=/home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/bl31.elf,cpu-num=0 \
-hw-dtb /home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/zynqmp-qemu-multiarch-arm.dtb \
-device loader,file=/home/zhqian/archive/xilinx_proj/dpu_zcu106/pre-built/linux/images/boot.scr,addr=0x20000000,force-raw=on  -gdb tcp:localhost:9000  -net nic -net nic -net nic -net nic,netdev=eth3 -netdev user,id=eth3, \
-machine-path /tmp/tmpuotisquj  -global xlnx,zynqmp-boot.cpu-num=0 -global xlnx,zynqmp-boot.use-pmufw=true \
-m 4G 

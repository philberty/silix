#!/bin/bash

mkdir -p _vm_silix/boot/grub
cp vmsilix.bin _vm_silix/boot
cp tools/grub.cfg _vm_silix/boot/grub
grub-mkrescue -o silix.iso _vm_silix

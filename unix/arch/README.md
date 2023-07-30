# Introduction

# Content


## Installation guide

---
1. Connect to network
```console
iwctl device list                       # usually produces wlan0
iwctl station <wlan0> get-networks      # all available networks
iwctl --passphrase <password> station <wlan0> connect <network name>

ping ya.ru -c 3
```
[iwctl documentation](https://wiki.archlinux.org/title/iwd)

---
2. Partioning disk
2.1 Create partitions
```console
fdisk -l        # usually produces nvme0n1
cfdisk <nvme0n1>
```

The best choice is UEFI system
/mnt/boot - 2GB
swap - RAM + 2GB
/mnt - the rest of space

2.2 Format partitions
```console
mkswap /dev/<swap_partition>
mkfs.fat -F32 /dev/<_/mnt/boot_>
mkfs.fat -F32 /dev/<_/mnt_>
```

2.3 Mount partitions
```console
swapon /dev/<swap_partition>        # Exactly for swap
mount /dev/<the_rest_partition> /mnt
mount --mkdir /dev/<efi_partition> /mnt/boot
```

3. Installing linux
```console
pacstrap -K /mnt base linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab
```
# Introduction

# Content


## Installation guide

---
1. Connect to network
```console
iwctl device list                       # usually produces wlan0
iwctl station <wlan0> get-networks      # all available networks
iwctl --passphrase <password> station <wlan0> connect <network name>

ping ya.ru
```
[iwctl documentation](https://wiki.archlinux.org/title/iwd)

---
2. Partioning disk
```console
fdisk -l        # usually produces nvme0n1
cfdisk <nvme0n1>
```

For
## Virtualization
***KVM*** - linux-based virtualization module. Provide resources (CPU, RAM, GPU, scheduler, etc.) for guest.
- *Guests* - is a virtual OS, worked on a virtualization module. 
- [Habr](https://habr.com/en/post/466549/)
###### Contains:
1. 

```mermaid
  graph TD;
      Hardware <-- Virt-API;
      Virt-API <-- KVM;
      X11 --> KVM;
```

###### Requires:
1. Hardware-support
2. Virtualization API (i.e. [libvirt](https://libvirt.org/))
3. I/O-support (i.e. [QEMU](https://habr.com/en/post/466549/))


###### See also:
- [virt-manager](https://github.com/virt-manager/virt-manager) - desktop user interface for managing virtual machines through libvirt. It primarily targets KVM VM.
- [X11-forwarding](https://www.businessnewsdaily.com/11035-how-to-use-x11-forwarding.html#:~:text=X11%20forwarding%20is%20a%20mechanism,to%20your%20local%20Windows%20machine.) - run remote graphical applications for Windows.
- [(RU) Backup principles](https://docs.ispsystem.ru/vmmanager-kvm/rezervnoe-kopirovanie/printsipy-rezervnogo-kopirovaniya)



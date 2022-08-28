# Introduction

# Content
- [Routers](#routers) - маршрутизатор
- [Hub](#hub) - концентратор
- [Switch](#switch) - коммутатор
  - [Domain collision](#domain-collision)
- [Cables](#cables)

# Routers
Is a network-layer device. They route traffic through independent networks.
- Backbone routes (магистральные маршрутизаторы)
- 
# Hub
- Proprietary
- Physical layer 

Hub is a device that allows to connect many devices to each
other at the same time. The biggest minus consists in generated noises 
during data transfer - [domain collision](#domain-collision).
# Switch
- Like [hub](#hub)
- Data link layer

Switch is very similar to a hub, but with one difference - it's a
data link layer device (hub is physical layer device). It's reduce
the size of collision domains thanks to checking packages payload and
send it only to required consumer.
## Domain collision
Network segment, where only one node can transmit data at the same time.  
It happens because data transmit to all network nodes, even if they shouldn't
accept it. If you try to send data from both edges of cable they just face
and make data unreadable.
# Cables
There are 2 types:
- Copper (consists of copper twisted pairs). In this type used line coding to understand where zeros on ones.
- Fiber (consists of glass strings) - more expensive and fragile
# Introduction

# Content
<!-- TOC -->
* [Introduction](#introduction)
* [Content](#content)
* [Definitions](#definitions)
* [NGINX](#nginx)
* [Zabbix](#zabbix)
* [Istio](#istio)
* [Virtualization](#virtualization)
  * [Docker](#docker)
    * [Docker-compose](#docker-compose)
    * [Docker Swarm](#docker-swarm)
      * [Docker Swarm vs Kubernetes](#docker-swarm-vs-kubernetes)
  * [Kubernetes](#kubernetes)
    * [Composition](#composition)
      * [kube-apiserver](#kube-apiserver)
      * [etcd](#etcd)
      * [kube-scheduler](#kube-scheduler)
      * [kube-controller-manager](#kube-controller-manager)
      * [cloud-controller-manager](#cloud-controller-manager)
      * [kubelet](#kubelet)
      * [kube-proxy](#kube-proxy)
      * [Additions](#additions)
        * [DNS](#dns)
        * [Dashboard](#dashboard)
        * [Container resource monitoring](#container-resource-monitoring)
        * [Cluster logging](#cluster-logging)
    * [Concepts](#concepts)
      * [Pod](#pod)
      * [Service](#service)
      * [Deployment](#deployment)
      * [StatefulSet](#statefulset)
      * [ReplicaSet](#replicaset)
    * [Helm](#helm)
  * [OpenShift](#openshift)
* [Grafana](#grafana)
  * [Clients](#clients)
    * [Promtail](#promtail)
    * [Fluentd](#fluentd)
  * [Loki](#loki)
  * [Prometheus](#prometheus)
* [ELK-stack](#elk-stack)
  * [Elasticsearch](#elasticsearch)
  * [Logstash](#logstash)
  * [Kibana](#kibana)
<!-- TOC -->

# Definitions
- Reverse-proxy translate requests from outer network to company inner network
- Orchestration is an automatic container deployment and managing 

# NGINX
Used as:
- Load balancer
- Web server
- Reverse proxy

# Zabbix
Tool for monitoring IT infrastructure such as networks, 
servers, virtual machines, and cloud services.

# Istio
Istio is a modernized service networking layer that provides a 
transparent and language-independent way to flexibly and easily 
automate application network functions.

[//]: # (FIXME)
# Virtualization
## Docker
Tool for simple containerization
### Docker-compose
To dockerize multiple containers in one virtual network

### Docker Swarm
It provides orchestration like kubernetes out of the box.
It's simpler then kubernetes, therefore easier to use. But it's also disadvantage
because it not so flexible and fail-safe.

#### Docker Swarm vs Kubernetes
Kubernetes is better because:
- Supports other containers (rkt, CRI-O)
- Provide more abilities because
  - Contains proxy-balancer
  - Contains etcd to store cluster state

## Kubernetes
In terms of infrastructure, kubernetes consists of
1. Master node
2. Multiple workers

### Composition
[(RU) Documentation](https://kubernetes.io/ru/docs/concepts/overview/components/)
![img.png](img.png)
Kubernetes control plane consists of:

#### kube-apiserver
Provide kubernetes API

#### etcd
key-value storage. Kubernetes use it to store the entire cluster state,
and as such for monitoring and managing.

#### kube-scheduler
Binds created pods to a worker.

#### kube-controller-manager
#### cloud-controller-manager

In turn workers contains
#### kubelet
Agent that controls container startup

#### kube-proxy
Configures network to provide connect to pods on its worker 

#### Additions
##### DNS
##### Dashboard
##### Container resource monitoring
##### Cluster logging

### Concepts
#### Pod
Smallest unit in kubernetes, contains one or more containers 
with shared storage and network resources, and a specification 
for how to run the containers.

#### Service
Abstract object that defines logical bunch of pods and access policy

#### Deployment
- Runs a set of identical pods
- Monitors the state of each pod, updating as necessary

#### StatefulSet
[//]: # (FIXME)

#### ReplicaSet
A ReplicaSet's purpose is to maintain a stable set of 
replica Pods running at any given time.

### Helm
Helm is a tool to help you define, install, and upgrade 
applications running on Kubernetes.

## OpenShift
[(RU) Habr](https://habr.com/en/company/redhatrussia/blog/494254/)
OpenShift is a wrap around the Kubernetes. Fully built on Kubernetes

Advantages:
- Let control load on specified endpoints

[//]: # (FIXME)

# Grafana
## Clients
### Promtail
Promtail is an agent which ships the contents of local 
logs to a private Grafana Loki instance or Grafana Cloud. 
It is usually deployed to every machine that has applications 
needed to be monitored.

### Fluentd
Grafana Loki has a Fluentd output plugin called 
fluent-plugin-grafana-loki that enables shipping logs to 
a private Loki instance or Grafana Cloud.

## Loki
## Prometheus

# ELK-stack
## Elasticsearch
## Logstash
## Kibana
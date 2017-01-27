# spar-kube
Spark cluster deployment on a k8s cluster

Updated to latest versions:
- Hadoop 2.7.3
- Spark 2.1.0
- Zeppelin 0.6.2


## Clone

`cd` to an appropriate directory on your OS

```bash
git clone https://github.com/srfrnk/spar-kube.git
```

## Deploy

connect `kubectl` to your cluster

```bash
cd spar-kube
make deploy
```

## Build Images Locally

**Not required for deployment.**

```bash
cd spar-kube
make images
```

## Push Locally Built Images

**Not required for deployment.**

Requires privileges to push images to docker hub. 

```bash
cd spar-kube
make push
```


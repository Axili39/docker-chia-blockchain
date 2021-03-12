# docker-chia-blockchain
Dockerfile for chia-blockchain app

Usage for plotting:
===============
```
docker pull axili39/chia-blockchain:1rc6
docker run -d -v /path/to/chia/home:/home/chia/.chia -v /path/to/temporary/drive:/home/chia/tmp -v /path/to/final/drive:/home/chia/plots --name chia1 axili39/chia-blockchain:1rc6
```

now container is running and chia has been initialized.

Import private keys:
================
```
docker exec -it chia1 chiactl keys add -m mnemonic mnemonic ..... mnemonic
docker exec -it chia1 chiactl keys show
```

Start plotting process:
==================
```
docker exec -it chia1 chiactl plots create -k 32 -t /home/chia/tmp -d /home/chia/plots -n 1 -b 10000 -u 128
```

Starts plotting process, for plotting 1 plot (k32) with 10MiB of memory and 128 buckets using tmp drive and destination drive shared with host.

my way:
```
docker exec -it chia1 bash
cd /chia-blockchain
. ./activate
nohup chia plots create -k 32 -t /home/chia/tmp -d /home/chia/plots -n 1 -b 10000 -u 128 > plotting.txt &
```
next closing terminal and wait.

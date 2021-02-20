FROM ubuntu:20.04
RUN apt-get update && apt-get upgrade -y 
RUN apt-get install -y apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN apt-get clean
RUN apt-get autoclean
RUN apt-get update
RUN apt-get install -y lsb-release bc sudo git libasound2 libnss3-tools libgdk-pixbuf2.0-0 libgtk-3-0
RUN cd / && git clone https://github.com/Chia-Network/chia-blockchain.git
RUN cd /chia-blockchain && sh install.sh 
RUN  cd /chia-blockchain && . ./activate && sh install-gui.sh
RUN adduser --gecos "" --shell /bin/bash chia
RUN usermod --password chia chia
RUN chown -R chia:chia ./chia-blockchain/
RUN chown root:root /chia-blockchain/electron-react/node_modules/electron/dist/chrome-sandbox
RUN chmod 4755 /chia-blockchain/electron-react/node_modules/electron/dist/chrome-sandbox
WORKDIR /chia-blockchain/electron-react
#WORKDIR /chia-blockchain
#:npm run electron &



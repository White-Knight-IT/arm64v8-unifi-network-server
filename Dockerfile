FROM mongo:4.4.18 AS build

RUN DEBIAN_FRONTEND=noninteractive apt-mark hold mongodb-database-tools mongodb-org-shell mongodb-org-server mongodb-org-mongos mongodb-org-database-tools-extra mongodb-org-tools mongodb-org

RUN DEBIAN_FRONTEND=noninteractive apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get -yq install tzdata ca-certificates wget nano ubuntu-keyring

RUN wget -qO- https://dl.ui.com/unifi/unifi-repo.gpg   | tee /etc/apt/trusted.gpg.d/unifi-repo.gpg > /dev/null

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/unifi-repo.gpg] https://www.ui.com/downloads/unifi/debian stable ubiquiti"   | tee /etc/apt/sources.list.d/ubnt-unifi-stable.list > /dev/null

RUN DEBIAN_FRONTEND=noninteractive apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq openjdk-17-jre-headless unifi

WORKDIR /scripts

COPY scripts /scripts

RUN chmod 555 /scripts/start.sh

CMD /scripts/start.sh

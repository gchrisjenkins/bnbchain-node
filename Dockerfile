FROM ubuntu:18.04

ARG LIGHTNODE_VERSION=0.6.3
ARG CLI_VERSION=0.6.3

ARG GIT_REPO_URL=https://github.com/binance-chain/node-binary/raw/master

LABEL Maintainer = "Chris Jenkins <g.chris.jenkins@gmail.com>"
LABEL Description="Docker image for Binance light nodes"
LABEL License="MIT License"

ENV USR_LOCAL_BIN /usr/local/bin

RUN apt-get update && apt-get install -y wget

RUN wget -q --show-progress -P ${USR_LOCAL_BIN} "${GIT_REPO_URL}/lightnode/testnet/${LIGHTNODE_VERSION}/linux/lightd" \
&& chmod 755 ${USR_LOCAL_BIN}/lightd

RUN wget -q --show-progress -P ${USR_LOCAL_BIN} "${GIT_REPO_URL}/cli/testnet/${CLI_VERSION}/linux/tbnbcli" \
&& chmod 755 ${USR_LOCAL_BIN}/tbnbcli

COPY ./bin/*.sh /usr/local/bin/

RUN set -ex \
&& chmod +x /usr/local/bin/*.sh

EXPOSE 26657 8080

ENTRYPOINT ["entrypoint.sh"]

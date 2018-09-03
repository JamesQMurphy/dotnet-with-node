#
#  This Dockerfile is based on the first example from here:
#  https://github.com/aspnet/Announcements/issues/298
#
FROM microsoft/dotnet:2.1-sdk
WORKDIR /app

# setup node
# take a look at https://nodejs.org/dist/v10.9.0/SHASUMS256.txt.asc
ENV NODE_VERSION 10.9.0
ENV NODE_DOWNLOAD_SHA d061760884e4705adfc858eb669c44eb66cd57e8cdf6d5d57a190e76723af416

RUN curl -SL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz" --output nodejs.tar.gz \
    && echo "$NODE_DOWNLOAD_SHA nodejs.tar.gz" | sha256sum -c - \
    && tar -xzf "nodejs.tar.gz" -C /usr/local --strip-components=1 \
    && rm nodejs.tar.gz \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs

WORKDIR /

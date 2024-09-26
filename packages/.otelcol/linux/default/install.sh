#!/bin/sh

DIR=$PWD

mkdir -p /opt/otelcol/bin/

cd /opt/otelcol/bin/

wget -O otelcol-contrib_0.109.0_linux_amd64.tar.gz https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.109.0/otelcol-contrib_0.109.0_linux_amd64.tar.gz

if $DIR/checkmd5 --hash=ed96fe60b2b2fecfc95df1da38cb3a11f7770d87e4e8b4a8afd102a113305b89d1f01a719b4fc98e525e1c0c5e1acfd05f2d91399ab725c01ec2bb73a49f2603 --file=otelcol-contrib_0.109.0_linux_amd64.tar.gz; then
    tar -xzvf otelcol-contrib_0.109.0_linux_amd64.tar.gz;
    mkdir -p /etc/otelcol/;
else
    echo "Downloaded package files do not match checksum";
    exit 1;
fi

#!/bin/sh

DIR=$PWD

mkdir -p /opt/datadog/bin/

cd /opt/datadog/bin/

wget -O datadog_7.57.2_linux_amd64.tar.gz https://github.com/DataDog/datadog-agent/archive/refs/tags/7.57.2.tar.gz

if $DIR/checkmd5 --hash=c3135f940adb5bfa62fa2ffb777bdd2b241c9b4c9827334e0a0b889505541f10e98db35995fa2512e411b6cf52bf1146ffad42efedb9b346cbe73d4f1a6ebbd0 --file=datadog_7.57.2_linux_amd64.tar.gz; then
    tar -xzvf datadog_7.57.2_linux_amd64.tar.gz;
    mkdir -p /etc/datadog/;
else
    echo "Downloaded package files do not match checksum";
    exit 1;
fi

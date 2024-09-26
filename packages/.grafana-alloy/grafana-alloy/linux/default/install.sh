#!/bin/sh

DIR=$PWD

mkdir -p /opt/grafana-alloy/bin/

cd /opt/grafana-alloy/bin/

wget -O alloy-1.4.0.tar.gz https://github.com/grafana/alloy/archive/refs/tags/v1.4.0.tar.gz

if $DIR/checkmd5 --hash=e7fdc4a314ae8bcc1ef655daeb6c848af47190b7e21ab7b11a04f4a8ff47803709e66c96390b3336492e7b23544edd1fd1048da400d05123d175d4629e2ec7d2 --file=alloy-1.4.0.tar.gz; then
    tar -xzvf alloy-1.4.0.tar.gz;
    mkdir -p /etc/grafana-alloy/;
else
    echo "Downloaded package files do not match checksum";
    exit 1;
fi
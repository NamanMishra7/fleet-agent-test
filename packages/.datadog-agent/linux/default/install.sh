#!/bin/sh

DIR=$PWD

mkdir -p /opt/datadog-agent/install/

cd /opt/datadog-agent/install/

wget -O install_script https://install.datadoghq.com/scripts/install_script_agent7.sh

if $DIR/checkmd5 --hash=774cea02de61b37aaffc70d39004a13804fe7b27899c25f07518c0320cdf761cf645c75c84cfa74f5686ff91af4cf38661f7e506c42226645163e509da2d4736 --file=install_script; then
    # dummy API Key
    DD_API_KEY=f8023136f0b65fd87f2ba698f5f7c73f \
    DD_SITE="datadoghq.com" \
    bash -c "$(cat install_script)";
else
    echo "Downloaded package files do not match checksum";
    exit 1;
fi

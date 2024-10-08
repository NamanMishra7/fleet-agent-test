#!/bin/bash

# Default values for variables
API_KEY=""
DD_SITE=""

# Function to display usage
usage() {
  echo "Usage: $0 --api-key <api_key> [--dd-site <datadog_site>]"
  echo "Or: $0 --api-key=<api_key> [--dd-site=<datadog_site>]"
  exit 1
}

# Parse arguments
while [[ "$1" != "" ]]; do
    case $1 in
        --api-key=* )        API_KEY="${1#*=}"  # Extract value after "="
                             ;;
        --api-key )          shift
                             API_KEY=$1
                             ;;
        --dd-site=* )         DD_SITE="${1#*=}"
                             ;;
        --dd-site )           shift
                             DD_SITE=$1
                             ;;
        -h | --help )        usage
                             exit
                             ;;
        * )                  usage
                             exit 1
    esac
    shift
done

# Check if required parameters are passed
if [ -z "$API_KEY" ]; then
    echo "Error: Missing required parameter: --api-key"
    usage
fi

DIR=$PWD

mkdir -p /opt/datadog-agent/install/

cd /opt/datadog-agent/install/

wget -O install_script https://install.datadoghq.com/scripts/install_script_agent7.sh

if $DIR/checkmd5 --hash=774cea02de61b37aaffc70d39004a13804fe7b27899c25f07518c0320cdf761cf645c75c84cfa74f5686ff91af4cf38661f7e506c42226645163e509da2d4736 --file=install_script; then

    CMD="DD_INSTALL_ONLY=true DD_API_KEY=\"$API_KEY\""

    if [ -n "$DD_SITE" ]; then
        CMD="$CMD DD_SITE=\"$DD_SITE\""
    fi

    # Run the command to install the agent
    bash -c "$CMD bash -c \"\$(cat install_script)\""

    # Remove the script after installation
    rm -rf install_script
else
    echo "Downloaded package files do not match checksum";
    exit 1;
fi
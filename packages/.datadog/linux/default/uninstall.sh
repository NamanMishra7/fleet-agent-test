#!/bin/sh

apt-get remove datadog-agent
rm -rf /opt/datadog
rm -rf /etc/datadog-agent /var/log/datadog

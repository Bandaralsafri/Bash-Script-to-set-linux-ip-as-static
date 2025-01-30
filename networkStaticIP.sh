#!/bin/bash

echo "Enter the network interface name (i.g eth0, use "ip a" to check the interface ): "
read -r interface

echo "Enter the static IP: "
read -r staticIP

echo "Enter the subnetmask (in the form of "Network bits",i.g 24 or 8 ): "
read -r subnetmask

echo "Enter the gateway (routing) IP: "
read -r routing

echo "Enter the DNS server address:"

read -r DNSSERVER

BACKUP_FILE="/etc/netplan/$(ls /etc/netplan | head -n 1).bak"
sudo cp /etc/netplan/* $BACKUP_FILE

echo "original file backed up successfully at $BACKUP_FILE"

NETPLAN_FILE="/etc/netplan/$(ls /etc/netplan | head -n 1)"

echo "Updating $NETPLAN_FILE for static ip configuration.."


echo "network:
        version: 2
        renderer: networkd
        ethernets:
         $interface:
           dhcp4: false
           addresses:
                - $staticIP/$subnetmask
           routes:
                - to: 0.0.0.0/0
                  via: $routing"|sudo tee $NETPLAN_FILE > /dev/null

echo "Trying the new configuration..."

sudo netplan apply


echo "Configuration updated..."

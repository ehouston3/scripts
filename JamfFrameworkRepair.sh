#!/bin/sh
# Jamf Framework Repair
# Re-installs the Jamf Management framework, forces a policy check and a recon.
# software updates, and reboots the device

jamf -manage && jamf -policy && jamf -recon && softwareupdate -iav && reboot
exit 0

#!/bin/bash
################################################################################
# Author: ansidev                                                              #
# Email: ansidev@gmail.com                                                     #
# Homepage: ansidev.uni.me                                                     #
# Filename: gitsetup.sh                                                        #
# Date Created: 20/02/2014                                                     #
# Last Updated: 20/02/2014                                                     #
# Version: 14.02.20.0001                                                       #
# Description: Simple update and upgrade shell script for Ubuntu               #
################################################################################
set +x
sudo apt-get update && sudo apt-get dist-upgrade -y

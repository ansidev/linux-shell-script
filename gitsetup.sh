#!/bin/bash
################################################################################
# Author: ansidev                                                              #
# Email: ansidev@gmail.com                                                     #
# Homepage: ansidev.uni.me                                                     #
# Filename: gitsetup.sh                                                        #
# Date Created: 20/02/2014                                                     #
# Last Updated: 20/02/2014                                                     #
# Version: 14.02.20.0001                                                       #
# Description: Linux Shell script for install & setting git version control    #
################################################################################
#set -x
function gitsetup()
{
	echo "Installing package git. Please wait..."
	sudo apt-get install git -y
}

function gitusername()
{
	#Setup username account
	echo "Enter your username. (Leave blank if you do not want to change current this setting)"
	read -p "Username = " username
	if [ "$username" != "" ]; then
	git config --global user.name "$username"
	fi
}

function gitemail()
{
	#Setup email account
	echo "Enter your email. (Leave blank if you do not want to change current this setting)"
	read -p "Email = " email
	if [ "$email" != "" ]; then
	git config --global user.email "$email"
	fi
}
function gittimeout()
{
	#Setup timeout for password caching
	echo "Default timeout for password caching is 15 minutes."
	read -p "Do you want to change timeout for password caching? (y/n) " confirm
	if [ "$confirm" == y ]; then
		read -p "Enter timeout in second(s): " timeout
		git config --global credential.helper 'cache --timeout=3600'
	fi
}

function gitconfig()
{
	gitusername
	gitemail
	gittimeout
}

if [ "$#" == "0" ]; then
	gitsetup
	gitconfig
fi
while (( "$#" )); do
case $1 in
	"-i" | "--install" )
		gitsetup
		;;
	"-c" | "--config")
		gitconfig
		;;
	"-u" | "--user")
		gitusername
		;;
	"-e" | "--email")
		gitemail
		;;
	"-t" | "--timeout")
		gittimeout
		;;
	*)
		gitsetup
		gitconfig
		;;
esac
shift
done
echo "Finished setup!"

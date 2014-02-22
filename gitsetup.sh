#!/bin/bash
################################################################################
# Author: ansidev                                                              #
# Email: ansidev@gmail.com                                                     #
# Homepage: http://ansidev.esy.es/blog                                         #
# Filename: gitsetup.sh                                                        #
# Date Created: 20/02/2014                                                     #
# Last Updated: 22/02/2014                                                     #
# Version: 14.02.22                                                            #
# Description: Install & setting git version control for Ubuntu                #
# Usage: gitsetup --help for full help                                         #
################################################################################
#set -x
#Variables
author=ansidev
email=ansidev@gmail.com
homepage=http://ansidev.esy.es/blog
version=14.02.22  
#End Variables
#Functions
function gitsetup()
{
	echo "Installing package git. Please wait..."
	sudo apt-get install git -y
}

function gitusername()
{
	#Setup username account
	echo "Config git username..."
	if [ "$#" != "0" ]; then
		git config --global user.name "$1"
	else
		echo "Enter your username. (Leave blank if you do not want to change current this setting)"
		read -p "Username = " username
		if [ "$username" != "" ]; then
			git config --global user.name "$username"
		fi
	fi
}

function gitemail()
{
	#Setup email account
	echo "Config git email..."
	if [ "$#" != "0" ]; then
		git config --global user.email "$1"
	else
		echo "Enter your email. (Leave blank if you do not want to change current this setting)"
		read -p "Email = " email
		if [ "$email" != "" ]; then
		git config --global user.email "$email"
		fi
	fi
}

function gittimeout()
{
	#Setup timeout for password caching
	echo "Config git timeout for password caching..."
	if [ "$#" != "0" ]; then
		if [ "$#" == "1" ]; then
			timeout=$1
		elif [ "$#" == "2" ]; then
			timeout=$(($1*3600+$2*60))
		elif [ "$#" == "3" ]; then
			timeout=$(($1*3600+$2*60+$3))
		fi
		git config --global credential.helper "cache --timeout=$timeout"
	else
		echo "Default timeout for password caching is 15 minutes."
		read -p "Do you want to change timeout for password caching? (y/n) " confirm
		if [ "$confirm" == y ]; then
			read -p "Enter timeout in second(s): " timeout
			git config --global credential.helper 'cache --timeout=$timeout'
		fi
	fi
}

function gitconfig()
{
	if [ "$#" != "0" ]; then
		gitusername $1
		gitemail $2
		gittimeout $3 $4 $5
	else
		gitusername
		gitemail
		gittimeout
	fi
}

function gitinfo()
{
	echo "################################################################################"
	echo "# Author: $author                                                              #"
	echo "# Email: $email                                                     #"
	echo "# Homepage: $homepage                                         #"
	echo "# Version: $version                                                            #"
	echo "# Description: Install & setting git version control for Ubuntu                #"
	echo "################################################################################"
	printf "\n"
	printf "%s\n%s\n%s\n%s\n%s\n" "Supported features:" "- Install git package for Ubuntu." "- Config git username." "- Config git email." "- Config git timeout for password caching."
	printf "\n"
}

function githelp()
{
	gitinfo
	printf "%s\n%s\n%s\n" "Usage: gitsetup.sh [OPTION] <args>." "You can use no option or argument. If not, you should use only one option." "Arguments depend on option and you can use no argument."
	printf "%s\n" "[OPTION]"
	printf "%s%s\t\t%s\n" " " "-a | --auto" "Default option if you use no option. [-a] = [-i] && [-c]"
	printf "%s%s\t\t%s\n" " " "-i | --install" "Install package git."
	printf "%s%s\t\t%s\n" " " "-c | --config" "Default config mode: username, email, timeout for password caching."
	printf "%s\n" "Arguments for [-c | --config] option"
	printf "%s%s\t\t%s\n\t\t\t%s\n" "   " "<arg1>" "Must be git username." "Config git username."
	printf "%s%s\t\t%s\n\t\t\t%s\n" "   " "<arg2>" "Must be git email." "Config git email."
	printf "%s%s\t\t%s\n\t\t\t%s\n" "   " "<arg3> " "If there are no argument(s) after, it will be timeout, else it will be timeout hour(s)." "Config git timeout for password caching."
	printf "%s%s\t\t%s\n" "   " "<args4>" "If exist, it will be timeout minute(s)."
	printf "%s%s\t\t%s\n" "   " "<args5>" "If exist, it will be timeout second(s)."
	printf "%s\n" "Example for config timeout"
	printf "%s%s\t%s\n" "  " "gitsetup.sh -c example example@example.com 3600" "Timeout is 3600 seconds."
	printf "%s%s\t%s\n" "  " "gitsetup.sh -c example example@example.com 1 0 0" "Timeout is 3600 seconds. (1 x 3600 + 0 x 60 + 0 = 3600)"
	printf "%s%s\t%s\n" "  " "gitsetup.sh -c example example@example.com 0 30" "Timeout is 1800 seconds. (0 x 3600 + 30 x 60 = 1800)"
	printf "%s%s\t\t%s\n" "  " "gitsetup.sh -c example example@example.com 1" "Timeout is 1 second."
	printf "%s%s\t\t%s\n" " " "-u | --user" "Config only git username."
	printf "%s%s\t\t%s\n" " " "-e | --email" "Config only git email."
	printf "%s%s\t\t%s\n\t\t\t%s\n" " " "-t | --timeout" "Config only git timeout for password caching." "See <arg3|args4|args5> in 'Arguments for [-c | --config] option' for more information."
	printf "%s%s\t%s\n" " " "-h | -? | --help" "Help for gitsetup."
	printf "%s%s\t\t%s\n" " " "-I | --info" "Information about gitsetup shell script."
	printf "\n"
}

function gitfinish()
{
	echo "Finished setup!"
	exit
}
#End Functions

if [ "$#" == "0" ]; then
	gitsetup
	gitconfig
fi
while (( "$#" )); do
case $1 in
	"-i" | "--install")
		gitsetup
		gitfinish
		;;
	"-c" | "--config")
		gitconfig $2 $3 $4 $5 $6
		gitfinish
		;;
	"-u" | "--user")
		gitusername $2
		gitfinish
		;;
	"-e" | "--email")
		gitemail $2
		gitfinish
		;;
	"-t" | "--timeout")
		gittimeout $2 $3 $4
		gitfinish
		;;
	"-h" | "-?" | "--help")
		githelp
		;;
	"-I" | "--info")
		gitinfo
		;;
	"" | "-a" | "--auto")
		gitsetup
		gitconfig
		gitfinish
		;;
	*)
		githelp
		;;
esac
shift
done

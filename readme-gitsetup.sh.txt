gitsetup.sh
=====================

Supported features:
- Install git package for Ubuntu.
- Config git username.
- Config git email.
- Config git timeout for password caching.

Usage: gitsetup.sh [OPTION] <args>.
You can use no option or argument. If not, you should use only one option.
Arguments depend on option and you can use no argument.
[OPTION]
 -a | --auto		Default option if you use no option. [-a] = [-i] && [-c]
 -i | --install		Install package git.
 -c | --config		Default config mode: username, email, timeout for password caching.
Arguments for [-c | --config] option
   <arg1>		Must be git username.
			Config git username.
   <arg2>		Must be git email.
			Config git email.
   <arg3> 		If there are no argument(s) after, it will be timeout, else it will be timeout hour(s).
			Config git timeout for password caching.
   <args4>		If exist, it will be timeout minute(s).
   <args5>		If exist, it will be timeout second(s).
Example for config timeout
  gitsetup.sh -c example example@example.com 3600	Timeout is 3600 seconds.
  gitsetup.sh -c example example@example.com 1 0 0	Timeout is 3600 seconds. (1 x 3600 + 0 x 60 + 0 = 3600)
  gitsetup.sh -c example example@example.com 0 30	Timeout is 1800 seconds. (0 x 3600 + 30 x 60 = 1800)
  gitsetup.sh -c example example@example.com 1		Timeout is 1 second.
 -u | --user		Config only git username.
 -e | --email		Config only git email.
 -t | --timeout		Config only git timeout for password caching.
			See <arg3|args4|args5> in 'Arguments for [-c | --config] option' for more information.
 -h | -? | --help	Help for gitsetup.
 -I | --info		Information about gitsetup shell script.


cyan='\e[0;36m'
green='\e[0;32m'
red='\e[1;31m'
Escape="\033";
Reset="${Escape}[0m";

clear
chmod +x rscan
chmod +x src/help
chmod +x src/scan
chmod +x stats/messages
clear

if [ $1 == '-h' ] || [ $1 == '--help' ]; then
    echo -e "Usage: ./configure.sh [OPTION]
./configure.sh -h, --help       To show this message and exit
./configure.sh -r, --root       To use this cfg in sudo mode
./configure.sh -t, --termux     To configure this tool in termux android
"
    exit 1
fi
if [ $1 == '-r' ] || [ $1 == '--root' ]; then
    echo -en $Reset"["; echo -en $green"#"; echo -e $Reset"]" "Starting config script!"
    sleep 2
    [[ `id -u` -eq 0 ]] > /dev/null 2>&1 || { 
        echo -en $Reset"["; echo -en $red"!"; echo -en $Reset"]"; echo -en " You must be root to run the script"; echo -e $Reset ; exit 1;
    }
    {
        chmod +x rscan
        chmod +x src/help
        chmod +x src/scan
        chmod +x stats/messages
    } || {
        #echo missing files!
        #while true; do
         #   read -p "Do you wish to clone repo again (Y/n)" yn
          #  case $yn in
           #     [Yy]* ) cd .. && rm -rf dbuster-pro && git clone "https://github.com/DioBruh/dbuster-pro/"; break;;
            #    [Nn]* ) exit;;
             #   * ) exit 1;;
            #esac
        #done
        exit 1
    }
    { # try
        cp -r src/ stats/ /usr/bin/
        cp rscan /usr/bin/  
        chmod +x /usr/bin/rscan
    } || { # catch
        echo -en $Reset"["; echo -en $red"!"; echo -en $Reset"]"; echo -en " You must be root to run the script"; echo -e $Reset ; exit 1;
    }
    echo rscan successfully installed, type: "rscan --help"
fi

if [ $1 == ''] || [ $1 == '' ]; then
    clear
    echo Invalid arguments!
    echo -e "Usage: ./configure.sh [OPTION]
./configure.sh -h, --help       To show this message and exit
./configure.sh -r, --root       To use this cfg in sudo mode
./configure.sh -n, --no-root    To use this cfg not in sudo mode
./configure.sh -t, --termux     To configure this tool in termux android
"
fi
if [ $1 == '-t' ] || [ $1 == '--termux' ]; then
    clear 
    echo -en $Reset"["; echo -en $green"#"; echo -e $Reset"]" "Starting config script!"
    sleep 2
    {
        cp -r src/ stats/ $HOME/../usr/bin
        cp rscan $HOME/../usr/bin
        chmod +x $HOME/../usr/bin/rscan   
    } || { # catch
        echo bin/local not found
        exit 1
    }
    echo rscan successfully installed, type: "rscan --help"
fi
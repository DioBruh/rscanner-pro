def print_help()
    message = 
    'Usage: scanrb [OPTION...] <ip>
    -h, --help              To show this message and exit
    -i, --ip <ip>           Target to scan.
    -t, --timeout <seconds> Timeout in seconds
    -v, --verbose           Make the operation more talkative
    -u, --url <url>         Scan from http and get the ip
    -s, --simple            Make the simple and fast scan
    -d, --dns-resolver      Use Dns-resolver tool
    -V, --version           Show version and quit program
    -C, --credits           Display credits
    '
    usage = 
    'Example: scanrb -i 192.168.0.1      For scan
scanrb -i 192.168.0.1 -t TIMEOUT    For use timout per seconds
scanrb -v true -i 192.168.0.1	    For use verbose
scanrb -d <dns>                     For use DNS-RESOLVER tool
scanrb -h                           For show this message
scanrb -V                           For show program version
scanrb -C                           For display credits
    '
    puts message
    puts usage
end

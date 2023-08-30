#!/bin/bash
# Check if port 80 is reachable and the file exists
nc -z -w2 127.0.0.1 80 || exit 1
[[ -f /var/www/html/index.nginx-debian.html ]] || exit 1
exit 0

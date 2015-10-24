IP=$(ip a sh dev rmnet0 | grep rmnet0$ | busybox awk '{print $2}' | busybox cut -d'/' -f1)
ip r add default via $IP table rmnet0

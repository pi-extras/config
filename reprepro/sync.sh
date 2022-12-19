#!/bin/bash
cd /root/pi-extras/debian
  
for new_pkg in `ls pkgs_incoming`; do
    echo $new_pkg
    #reprepro_expect
    /root/secrets/reprepro.exp -- --noguessgpgtty -Vb /root/pi-extras/debian/ includedeb precise /root/pi-extras/debian/pkgs_incoming/$new_pkg
    if [ $? != 0 ]; then
        echo "Import of $new_pkg failed, reporting ..."
    else
        rm -rf pkgs_incoming/$new_pkg
    fi
done

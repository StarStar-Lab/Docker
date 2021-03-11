#!/bin/sh
set -e
function initCustom() {
    mkdir /custom
    cd /custom
    git init
    git remote add -f origin https://github.com/Sunert/Scripts.git
    git config core.sparsecheckout true
    echo Task/package.json >>/custom/.git/info/sparse-checkout
    echo Task/txnews.js >>/custom/.git/info/sparse-checkout
    echo Task/youth.js >>/custom/.git/info/sparse-checkout
    echo Task/Youth_Read.js >>/custom/.git/info/sparse-checkout
    echo Task/sendNotify.js >>/custom/.git/info/sparse-checkout
    git pull origin master
    cd Task
    npm i
}
if [ ! -d "/custom/" ]; then
    echo "init custom" 
    initCustom
else
    echo "update custom"
    git -C /custom reset --hard
    git -C /custom pull origin master
fi
    cp /Cookie/YOUTH_READ.txt /custom/Task
    echo "insert cookie"
    cd /custom/Task
    sed -i '10 r YOUTH_READ.txt' Youth_Read.js
    echo "insert cookie finished"
    echo "*/15 * * * * sleep \$((RANDOM % 120)); node /custom/Task/youth.js |ts >> /logs/youth.log 2>&1" >> /pss/merged_list_file.sh
    echo "*/7 * * * * sleep \$((RANDOM % 120)); node /custom/Task/txnews.js |ts >> /logs/txnews.log 2>&1" >> /pss/merged_list_file.sh
    echo "6 7,12,19 * * * node /custom/Task/Youth_Read.js |ts >> /logs/Youth_Read.log 2>&1" >> /pss/merged_list_file.sh
   #  wget -O jrtt.js https://raw.githubusercontent.com/ZhiYi-N/Private-Script/master/Scripts/jrtt.js
   #  echo "5,35 8-23 * * * sleep \$((RANDOM % 120)); node /custom/Task/jrtt.js |ts >> /logs/jrtt.log 2>&1" >> /pss/merged_list_file.sh


#!/bin/sh
set -e
#cd /scripts/docker
#wget -O shell_script_mod.sh https://github.com/iouAkira/someDockerfile/raw/master/jd_scripts/shell_script_mod.sh
#chmod +x shell_script_mod.sh
#sh shell_script_mod.sh
## 删掉异常任务
# sed -i "/jd_joy_steal/d" /scripts/docker/merged_list_file.sh
echo "拉取monk-coder仓库的代码，并增加相关任务"
if [ ! -d "/monk/" ]; then
  echo "未检查到monk-coder仓库脚本，初始化下载相关脚本..."
  git clone https://github.com/monk-coder/dust /monk
else
  echo "更新monk-coder脚本相关文件..."
  git -C /monk reset --hard
  git -C /monk pull --rebase
fi

if [ -n "$(ls /monk/car/*_*.js)" ]; then
  cp -f /monk/car/*_*.js /scripts
fi
if [ -n "$(ls /monk/i-chenzhe/*_*.js)" ]; then
  cp -f /monk/i-chenzhe/*_*.js /scripts
fi
if [ -n "$(ls /monk/member/*_*.js)" ]; then
  cp -f /monk/member/*_*.js /scripts
fi
if [ -n "$(ls /monk/normal/*_*.js)" ]; then
  cp -f /monk/normal/*_*.js /scripts
fi
cat /monk/i-chenzhe/remote_crontab_list.sh /monk/remote_crontab_list.sh >> $mergedListFile
echo "修改超市兑换物品"
export MARKET_COIN_TO_BEANS='蒙牛 纯甄'

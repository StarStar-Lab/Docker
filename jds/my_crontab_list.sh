# 1 7,12,19 * * * node /scripts/jd_beauty.js >> /scripts/logs/jd_beauty.log 2>&1
# 0 8 * * * node /scripts/jd_redpacket.js >> /scripts/logs/jd_redpacket.log 2>&1
# 0 0-16/8 * * * node /scripts/joy_reward.js >> /scripts/logs/jd_joy_reward.log 2>&1
# 0 7,12,19 * * * cd /scripts && npm install websocket >> /scripts/logs/jd_beauty.log 2>&1

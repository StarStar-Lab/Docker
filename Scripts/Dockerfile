FROM alpine
LABEL AUTHOR="Star <mail@starstar.cf>" \
        VERSION=0.0.1 \
        
RUN set -ex \
        && apk update && apk upgrade\
        && apk add --no-cache tzdata \
        git \
        nodejs \
        moreutils \
        npm \
        python3-dev \
        py3-pip \
        py3-cryptography \
        jq \
        curl \
        && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && echo "Asia/Shanghai" > /etc/timezone
        
RUN mkdir /logs \
        && mkdir /docker \
        && cd  /docker \
        && git init \
        && git remote add -f https://github.com/StarStar-Lab/Docker.git \
        && git config core.sparsecheckout true \
        && echo Scripts/* >> /pss/.git/info/sparse-checkout \
        && git pull origin master \
        && cp /docker/Scripts/crontab_list.sh /pss/crontab_list.sh

RUN mkdir /Sunert \
        && cd /Sunert \
        && git init \
        && git remote add -f https://github.com/Sunert/Scripts.git \
        && git config core.sparsecheckout true \
        && echo Task/package.json >>/baidu_speed/.git/info/sparse-checkout \
        && echo Task/baidu_speed.js >>/baidu_speed/.git/info/sparse-checkout \
        && echo Task/sendNotify.js >>/baidu_speed/.git/info/sparse-checkout \
        && git pull origin master \
        && cd Task\
        && npm install
        
ENTRYPOINT ["docker_entrypoint.sh"]

CMD [ "crond" ]

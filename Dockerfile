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
ENTRYPOINT ["docker_entrypoint.sh"]

CMD [ "crond" ]

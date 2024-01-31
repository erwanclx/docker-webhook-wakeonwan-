# FROM ubuntu:latest
# ENV MAC=$MAC
# ENV PORT=$PORT
# ENV EX='$1'
# ENV EX2='${1//[-]/:}'
# ENV EX3='$2'
# RUN apt-get update -y \
#     && apt-get install -y webhook etherwake nano

# RUN cat <<EOT >> entrypoint.sh
# #!/bin/bash
# rm run.sh
# rm hooks.json
# echo '#!/bin/sh' >> run.sh
# echo echo $EX >> run.sh
# echo echo $EX2 >> run.sh
# echo etherwake -i INTERFACE_ETH $EX2 >> run.sh
# echo echo run >> run.sh
# $interface = $(route | grep '^default' | grep -o '[^ ]*$')
# sed -i "s/INTERFACE_ETH/$interface/g" run.sh
# chmod +x run.sh
# echo [ >> hooks.json
# echo  { >> hooks.json
# echo    "id": "run", >> hooks.json
# echo    "execute-command": "/run.sh" >> hooks.json
# echo  } >> hooks.json
# echo ] >> hooks.json
# webhook -port $EX3 --verbose --hooks ./hooks.json
# EOT
# RUN chmod +x ./entrypoint.sh
# ENTRYPOINT ./entrypoint.sh $MAC $PORT

FROM ubuntu:latest
ENV MAC=$MAC
ENV PORT=$PORT
# RUN sed -i "s/-/:/g" /etc/environment && \
#     ENV FORMATTED_MAC=$MAC

RUN apt-get update -y \
    && apt-get install -y webhook etherwake nano wget net-tools

RUN wget "https://raw.githubusercontent.com/erwanclx/docker-webhook-wakeonwan-/main/run.sh" && \
    chmod +x run.sh

RUN wget "https://raw.githubusercontent.com/erwanclx/docker-webhook-wakeonwan-/main/hooks.json"

ENTRYPOINT webhook -port $PORT --verbose --hooks ./hooks.json



FROM ubuntu:latest
ENV MAC=$MAC
ENV PORT=$PORT
ENV EX='$1'
ENV EX2='${1//[-]/:}'
ENV EX3='$2'
RUN apt-get update -y \
    && apt-get install -y webhook etherwake nano

RUN cat <<EOT >> entrypoint.sh
#!/bin/bash
rm run.sh
rm hooks.json
echo #!/bin/bash >> run.sh
echo echo $EX >> run.sh
echo echo $EX2 >> run.sh
echo etherwake -i ens34 $EX2 >> run.sh
echo echo run >> run.sh
chmod +x run.sh
echo [ >> hooks.json
echo  { >> hooks.json
echo    "id": "run", >> hooks.json
echo    "execute-command": "/run.sh" >> hooks.json
echo  } >> hooks.json
echo ] >> hooks.json
webhook -port $EX3 --verbose --hooks ./hooks.json
EOT
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ./entrypoint.sh $MAC $PORT

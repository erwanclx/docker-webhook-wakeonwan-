FROM ubuntu:latest
RUN apt-get update -y \
    && apt-get install -y webhook etherwake
RUN cat <<EOT >> wake.sh
#!/bin/sh
etherwake -i ens34 00:D8:61:19:6D:12
echo wakeup
EOT
RUN chmod +x ./wake.sh
RUN echo ' [ \n\
  { \n\
    "id": "run", \n\
    "execute-command": "/wake.sh" \n\
  } \n\
]' > ./hooks.json
ENTRYPOINT webhook --verbose --hooks ./hooks.json
EXPOSE 9000

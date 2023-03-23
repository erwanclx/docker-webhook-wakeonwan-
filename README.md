# Docker Webhook WoL

Actually working with network mode host and request on 9000 port in dockerfile

## How-to run ?
Simplest way with your MAC and port :
```
docker run --network host -e MAC="01-23-45-67-89-10" -e PORT="9001" --name WoW -d erwanclx/webhook-wakeonlan
```

### OR

Clone the repo :
```
git clone https://github.com/erwanclx/docker-webhook-wakeonwan-
```

Build image :
```
docker build -t docker-webhook-wakeonwan .
```
Or simply build with docker-compose :

```
docker-compose up -d
```

## What can I do with ?

WakeUp your PC with one of some methods :

*Replace 192.168.1.60 by IP of your Docker host*

- Curl method :
```
curl 192.168.1.60:9000
```

- Go to the page 192.168.1.60:9000/hooks/run with your browser

- Add Webhooks request with IFTTT to wakeUP your computer with some services like Google Assistant

- etc.


# Docker Webhook WoL

Actually working with network mode host and request on 9000 port in dockerfile

## How-to run ?

Clone the repo :
```
git clone https://github.com/erwanclx/docker-webhook-wakeonwan-
```

Build image :
```
docker build -t docker-webhook-wakeonwan .
```

Run the container with your MAC Address (split by - or :)
```
docker run --network host -e MAC="01-23-45-67-89-10" --name WoW -d -p 9000:9000 docker-webhook-wakeonwan
```

Or simply build with docker-compose, indicate your mac address and do :

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

- Go to the page 192.168.1.60:9000 with your browser

- Add Webhooks request with IFTTT to wakeUP your computer with some services like Google Assistant

- etc.



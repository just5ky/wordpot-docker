# wordpot-docker
wordpress honeypot dockerized

![Docker Build](https://github.com/just5ky/wordpot/workflows/Docker/badge.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/justsky/wordpot) ![Docker Size](https://img.shields.io/docker/image-size/justsky/wordpot?color=orange)

```yml
version: "3"

networks:
  wordpot:

services:
  wordpot:
    container_name: wordpot
    image: "justsky/wordpot"
    restart: unless-stopped
    networks:
      - wordpot
    ports:
      - "80:80"
    volumes:
      - $DOCKERDIR/wordpot/:/log/
```

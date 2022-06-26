# wordpot-docker
wordpress honeypot dockerized

[![Docker](https://github.com/Just5KY/wordpot-docker/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/Just5KY/wordpot-docker/actions/workflows/docker-publish.yml) ![Docker Pulls](https://img.shields.io/docker/pulls/justsky/wordpot) ![Docker Size](https://img.shields.io/docker/image-size/justsky/wordpot?color=orange)

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

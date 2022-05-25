# wordpot-docker
wordpress honeypot dockerized


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

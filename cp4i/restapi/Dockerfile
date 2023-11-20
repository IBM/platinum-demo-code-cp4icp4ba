# syntax=docker/dockerfile:1

FROM node:20.1.0-alpine3.17

ENV NODE_ENV=production

WORKDIR /app

COPY code/server.js .
COPY code/data.json .
CMD [ "node", "server.js" ]

# Allow traffic on port 8000
EXPOSE 8000

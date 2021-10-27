FROM node:14 as build

WORKDIR /app

COPY  . .
RUN  yarn
RUN  build

CMD     ["node", "."]

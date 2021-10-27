FROM node:14 as build

WORKDIR /app

COPY  . .
RUN  yarn
RUN yarn install && yarn build && yarn cache clean

# Runtime container
FROM node:${NODE_VERSION}-alpine

WORKDIR /app

COPY --from=build /app /app

EXPOSE 3000
CMD ["yarn", "start"]

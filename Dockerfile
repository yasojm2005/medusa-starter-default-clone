FROM node:latest

WORKDIR /app/medusa

COPY . .

RUN apt-get update && apt-get install -y python3 python3-pip python-is-python3

RUN yarn global add @medusajs/medusa-cli

RUN yarn

RUN yarn build

CMD medusa migrations run && yarn start

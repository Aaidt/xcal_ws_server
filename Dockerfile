FROM node:22-alpine

WORKDIR /usr/src/app

RUN npm install -g pnpm

COPY package*.json ./
COPY pnpm-lock.yaml ./

RUN pnpm install

COPY . .

RUN pnpm run db:generate
RUN pnpm run build

EXPOSE 8080

CMD [ "pnpm", "run", "start" ]

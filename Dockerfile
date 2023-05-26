FROM node:18-alpine AS deps

WORKDIR /app

COPY package.json ./

RUN npm install

# Build source code
FROM node:18-alpine AS builder

WORKDIR /app
VOLUME /app

COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN npm run build

CMD ["npm", "start"]

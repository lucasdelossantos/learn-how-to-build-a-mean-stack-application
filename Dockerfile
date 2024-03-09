FROM node:10.23.0-alpine3.9 as build

# Create app directory
WORKDIR /src/app/lafs

FROM build as dep
# Install app dependencies
COPY package*.json ./
RUN npm install
COPY . .
FROM dep as expose 
EXPOSE 3000
CMD ["node", "server/server.js"]
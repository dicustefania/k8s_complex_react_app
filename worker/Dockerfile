FROM node:14.14.0-alpine
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY . .
CMD ["npm","run","start"]   

#script start or dev are defined in package.json
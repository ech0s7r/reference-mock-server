FROM node:8.4-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git

WORKDIR /home/node/app
#ARG TAG_VERSION=master
ADD . /home/node/app/reference-mock-server
#RUN git clone -b ${TAG_VERSION} --single-branch https://github.com/OpenBankingUK/reference-mock-server.git /home/node/app/reference-mock-server
#RUN chown -R node:node /home/node/app
#USER node:node
WORKDIR /home/node/app/reference-mock-server
RUN npm install -g nodemon
RUN npm install

RUN cp .env.sample .env
EXPOSE 8001
CMD ["npm", "run", "foreman"]

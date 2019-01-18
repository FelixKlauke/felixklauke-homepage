# We want to use the latest node version
FROM node:latest as build

# Maintainer
MAINTAINER Felix Klauke <info@felix-felix.de>

# Workdir
WORKDIR /opt/app

# Copy package.json only
COPY package.json /opt/app

# Install dependencies
RUN npm install

# Copy files
COPY . /opt/app

# Build step
RUN npm run build

# We want to allow HTTP traffic only
EXPOSE 3000

# Start command
CMD [ "npm", "start" ]



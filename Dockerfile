##################
### Base Image ###
##################
FROM node:latest

##################
### Maintainer ###
##################
MAINTAINER Felix Klauke <info@felix-klauke.de>

#########################
### Working Directroy ###
#########################
WORKDIR /opt/app

#############################
### Copy dependency files ###
#############################
COPY package*.json ./

#############
### Build ###
#############
RUN npm ci --only=production

#########################
### Copy source files ###
#########################
COPY . .

##################################
### Expose Port for web server ###
##################################
EXPOSE 3000

###################
### Healthcheck ###
###################
HEALTHCHECK --interval=10s --timeout=10s --retries=3 \
    CMD curl -sS http://127.0.0.1:3000 || exit 1

############
### User ###
############
RUN id -u www-data &>/dev/null || useradd -ms /bin/bash www-data && \
    chown www-data /opt/app -R

USER www-data

#####################
### Start the app ###
#####################
CMD [ "npm", "start" ]

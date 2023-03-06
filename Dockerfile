# Documentation
# https://docs.docker.com/engine/reference/builder/#env

# 1
FROM node:18

LABEL version="1.0"


# 1
WORKDIR /usr/src/app

# 2
# ENV SERVER_PORT=8081

# 1
# There are 2 forms of RUN (shell and exec), we'll only use shell today.
RUN apt update && apt install -y net-tools

# 1
# ADD and COPY 
# They are similar but, generally speaking, COPY is preferred.
# Because COPY is more transparent. COPY only supports the basic copying of local files into the container, while ADD has some features (like local-only tar extraction and remote URL support) that are not immediately obvious. 
COPY package*.json ./

### AT THIS POINT WE CAN BUILD THE FIRST TIME

# 1
# There are 2 forms of RUN (shell and exec), we'll only use shell today.
RUN npm install ci --omit=dev

# 1
COPY server.js ./

# 1
# It doesn't publish the port. It acts as kind of a documentstion between the person building the image and the person running the container.  
EXPOSE 8080

# 2
# EXPOSE ${SERVER_PORT}

# 3
# Exec into the container and execute `ps aux`, see that all processes are running as root. How do we fix this?
RUN useradd --uid 10000 runner
USER 10000

# 1
# There can be only 1
# 3 forms
# - exec form (the one we use)
# - parameters ["", ..., ""] list of parameters
# - shell form CMD node server.js
CMD ["node", "server.js"]
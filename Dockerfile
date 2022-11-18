# Documentation
# https://docs.docker.com/engine/reference/builder/#env

# 1
FROM node:18

LABEL version="1.0"


# 1
WORKDIR /usr/src/app

# 2
ENV SERVER_PORT=8000

# 1
# ADD and COPY 
# They are similar but, generally speaking, COPY is preferred.
# Because COPY is more transparent. COPY only supports the basic copying of local files into the container, while ADD has some features (like local-only tar extraction and remote URL support) that are not immediately obvious. 
COPY package*.json ./
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
# USER node

# 1
# There can be only 1
# 3 forms
# - exec form (the one we use)
# - parameters ["", ..., ""] list of parameters
# - shell form CMD node server.js
CMD ["node", "server.js"]
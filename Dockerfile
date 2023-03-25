FROM directus/directus:9.23.1

# Install git 
# We need this part becaus "npm install" will fail without the git package.
# Installing apk packages needs permissions, so we need to switch to root user.
USER root  
RUN apk add git --no-cache 

# SearchSync extension
# First we copy the config file, then we install the extension.
COPY searchsync.config.cjs ./ 
RUN npm install dimitrov-adrian/directus-extension-searchsync

# Start command for our image
CMD npx directus bootstrap && \
  npx directus database migrate:latest && \
  npx directus start 
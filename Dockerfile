# Use a lightweight base image
FROM docker.arvancloud.ir/alpine:latest

# Install required packages
RUN apk add --no-cache bash

# Create the necessary directories
RUN mkdir -p /app/volumes/app/mattermost/{config,data,logs,plugins,client/plugins,bleve-indexes}

# Set the working directory
WORKDIR /app

# Copy the docker-compose file
COPY docker-compose.yml .

# Run the commands
RUN chmod +x ./docker-compose.yml \
    && mkdir -p ./volumes/app/mattermost/{config,data,logs,plugins,client/plugins,bleve-indexes} \
    && chown -R 2000:2000 ./volumes/app/mattermost

# Set the entrypoint
ENTRYPOINT ["bash"]

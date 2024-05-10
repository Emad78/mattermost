FROM mattermost/${MATTERMOST_IMAGE}:${MATTERMOST_IMAGE_TAG}
WORKDIR .

RUN mkdir -p ./volumes/app/mattermost/{config,data,logs,plugins,client/plugins,bleve-indexes}
RUN sudo chown -R 2000:2000 ./volumes/app/mattermost
RUN cp env.example .env

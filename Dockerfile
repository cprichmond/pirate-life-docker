FROM ghost:0.11.4

# 1. move this entire repo into a temp directory
ADD . /docker_tmp
WORKDIR /docker_tmp

# 2. overwrite the default config with our own
RUN cp config.js /usr/src/ghost/config.example.js

# 3. download and install the target theme
# RUN curl https://s3-ap-southeast-2.amazonaws.com/pirate-life/030115_054915/pirate-life-theme.zip
RUN npm install --production
RUN cp -R themes/* /usr/src/ghost/content/themes

# 4. clean-up
WORKDIR /usr/src/ghost
RUN rm -r /docker_tmp

# 5. use our custom entry-point script
COPY .docker/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# 6. port and startup
EXPOSE 2368
CMD ["npm", "start"]

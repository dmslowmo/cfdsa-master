FROM node:latest

ENV APP_ROOT=/app APP_PORT=3000

# create APP_ROOT and cd in
WORKDIR ${APP_ROOT}

# copy the files and directory into image
ADD main.js .
ADD package.json .
ADD package-lock.json .

ADD public public
# be mindful of the order; views folder is put here because it is more likely to change. If it is put above public, rebuild is required for public even if it does not change.
ADD views views 

# install the dependencies
RUN npm install

# health check
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl -s -f http://localhost:${APP_PORT}/health || exit 1

# tell what port we are using
EXPOSE ${APP_PORT}

ENTRYPOINT [ "node", "main.js" ]

# CMD [ "${APP_PORT}" ]
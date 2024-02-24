FROM zenika/alpine-chrome:with-node AS chrome

FROM node:lts-alpine3.19 AS pnpm
ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/ \
    FORCE_COLOR=1 \
    PNPM_HOME="/pnpm" \
    PATH="$PNPM_HOME:$PATH"
RUN corepack enable pnpm
COPY --from=chrome ${CHROME_BIN} ${CHROME_BIN}
COPY --from=chrome ${CHROME_PATH} ${CHROME_PATH}

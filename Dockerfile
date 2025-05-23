FROM n8nio/n8n:1.39.0-alpine

USER root
RUN apk add --no-cache ffmpeg \
    && npm i -g ffmpeg-static

ENV NODE_FUNCTION_ALLOW_BUILTIN="child_process,buffer" \
    NODE_FUNCTION_ALLOW_EXTERNAL="ffmpeg-static"

USER node

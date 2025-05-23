# ---- n8n with FFmpeg ----
FROM docker.n8n.io/n8nio/n8n:1.94.0

USER root
RUN apt-get update \
  && apt-get install -y --no-install-recommends ffmpeg \
  && npm install -g ffmpeg-static \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV NODE_FUNCTION_ALLOW_BUILTIN="child_process,buffer" \
    NODE_FUNCTION_ALLOW_EXTERNAL="ffmpeg-static"

USER node

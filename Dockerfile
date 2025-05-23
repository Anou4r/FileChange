# ---------- Dockerfile ----------
FROM n8nio/n8n:1.39.0-alpine     # tiny base image
USER root                        # get permissions to install
RUN apk add --no-cache ffmpeg && \
    npm i -g ffmpeg-static       # belt-and-suspenders fallback  :contentReference[oaicite:3]{index=3}

# Let the Code node import what it needs
ENV NODE_FUNCTION_ALLOW_BUILTIN=child_process,buffer \
    NODE_FUNCTION_ALLOW_EXTERNAL=ffmpeg-static

USER node                        # drop back to non-root
# ---------- end ----------

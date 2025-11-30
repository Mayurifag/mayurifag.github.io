FROM oven/bun:1 AS build
WORKDIR /app
COPY package*.json ./
RUN bun install --frozen-lockfile
COPY . .
RUN bunx --bun astro telemetry disable \
  && bunx --bun astro build \
  ;

FROM caddy:2.10-alpine
# RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY --from=build /app/dist /usr/share/caddy
# RUN mkdir -p /data /config
# RUN chown -R appuser:appgroup /usr/share/caddy /data /config
# USER appuser
EXPOSE 80
CMD ["caddy", "file-server", "--root", "/usr/share/caddy"]

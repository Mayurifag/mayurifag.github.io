FROM oven/bun:1 AS build
WORKDIR /app
COPY package*.json ./
RUN bun install --frozen-lockfile
COPY . .
RUN bunx --bun astro telemetry disable \
  && bunx --bun astro build \
  ;

FROM caddy:2.9.1-alpine
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY --from=build /app/dist /usr/share/caddy
RUN chown -R appuser:appgroup /usr/share/caddy
USER appuser
EXPOSE 80
CMD ["caddy", "file-server", "--root", "/usr/share/caddy"]

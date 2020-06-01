FROM crystallang/crystal as build
WORKDIR /src
COPY . .
RUN shards install
RUN crystal build --release --static run.cr -o /src/run

FROM busybox
WORKDIR /app
COPY --from=build /src/run /app/run
ENTRYPOINT ["/app/run"]
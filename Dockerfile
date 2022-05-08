FROM golang as build

COPY ./app /go/src/app
WORKDIR /go/src/app
RUN go install app

FROM alpine as prob

COPY --from=build /go/bin/app /app

COPY ./healthcheck.sh /healthcheck.sh
HEALTHCHECK \
	--interval=1s\
	--timeout=5s\
	--start-period=5s\
	--retries=3\
	CMD sh /healthcheck.sh

# libc6-compat: Resolve go executable program dependencies.
# curl: Use for health check.
RUN apk add libc6-compat curl

EXPOSE 80:80
ENTRYPOINT [ "/app" ]

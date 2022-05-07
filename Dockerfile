FROM golang as build

COPY ./app /go/src/app
WORKDIR /go/src/app
RUN go install app

FROM alpine as prob
COPY --from=build /go/bin/app /app

# Resolve go executable program dependencies.
RUN apk add libc6-compat

EXPOSE 80:80
ENTRYPOINT [ "/app" ]

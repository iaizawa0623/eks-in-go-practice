FROM golang as build

COPY ./app /go/src/app
WORKDIR /go/src/app
RUN go install app

FROM alpine as prob
COPY --from=build /go/bin/app /app

EXPOSE 80:80
ENTRYPOINT [ "/app" ]

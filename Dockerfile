FROM golang:1.9 as build

ADD hello.go /app/
WORKDIR /app
RUN go build -o hello-world && cp -v hello-world /

FROM alpine:latest

WORKDIR /app

COPY --from=build /hello-world .
CMD ["./hello-world"]

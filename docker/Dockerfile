# BUILD IMAGE
FROM golang:1-alpine AS builder

WORKDIR /app/
RUN apk --no-cache add git
RUN go get -d github.com/MichaelS11/go-dht
COPY src/main.go .
RUN go version
RUN go build -o dht22 .

## RUNTIME IMAGE
FROM alpine:latest

RUN apk --no-cache add ca-certificates
WORKDIR /root
COPY --from=builder /app/dht22 .

CMD ["./dht22"]


# Simples aplicação golang com Docker multistage com Scratch.

## Docker build

docker build -t esouza/go-helloworld . -f Dockerfile.multistage

## Docker run

docker run --rm -p 8080:8080 --name fullcycle esouza/go-helloworld

# Dockerfile image com Scratch

```
FROM golang:alpine AS build-stage

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY main.go ./

RUN go build -ldflags '-s -w' main.go

FROM scratch

WORKDIR /

COPY --from=build-stage /app /

EXPOSE 8080

ENTRYPOINT ["/main"]
```

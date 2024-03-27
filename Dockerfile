FROM golang:latest

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY main.go ./

RUN go build -o /app

EXPOSE 8080

ENTRYPOINT ["/app"]
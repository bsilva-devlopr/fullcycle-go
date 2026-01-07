FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY go.mod .
RUN go mod download

COPY main.go .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o fullcycle

FROM scratch

COPY --from=builder /app/fullcycle /

CMD ["/fullcycle"]

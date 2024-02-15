FROM golang:1.17-alpine as builder-stage
WORKDIR /app
COPY . .
RUN go build -ldflags "-s -w" -o main cmd/main.go

FROM scratch
WORKDIR /app
COPY --from=builder-stage /app/main .
ENTRYPOINT [ "./main" ]
FROM golang:1.14 as build
WORKDIR /build
COPY . .
RUN CGO_ENABLED=0 go build -o 1st-demo-unique-repo cmd/main.go

FROM alpine:3.12
EXPOSE 8080
WORKDIR /app
COPY --from=build /build/1st-demo-unique-repo .
CMD ["./1st-demo-unique-repo"]

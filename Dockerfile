# Build the application from source
FROM golang:1.20 AS build-stage
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY *.go ./
RUN go build -o app

# Run the tests in the container
FROM build-stage AS run-test-stage
RUN go test -v ./...

# Deploy the application binary into a lean image
FROM alpine AS build-release-stage
RUN apk --no-cache add libc6-compat
WORKDIR /
COPY --from=build-stage /app/app /
EXPOSE 8080
USER nobody:nobody
ENTRYPOINT ["/app"]

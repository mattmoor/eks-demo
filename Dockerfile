FROM golang:1.17 as builder
WORKDIR /app
COPY . ./
RUN CGO_ENABLED=0 GOOS=linux go build -o server


FROM gcr.io/distroless/static:nonroot
COPY --from=builder /app/server /server
CMD ["/server"]
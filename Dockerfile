# Etapa 1: Build
FROM golang:1.21 AS builder
WORKDIR /app
COPY app/go.mod ./
COPY app/main.go ./

# Compilar como binario estático
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /app/app

# Etapa 2: Producción segura con distroless
FROM gcr.io/distroless/static
COPY --from=builder /app/app /app/app
USER nonroot
EXPOSE 8080
CMD ["/app/app"]
HEALTHCHECK --interval=10s --timeout=3s --start-period=15s --retries=3 \
  CMD ["/app/app", "-health"]


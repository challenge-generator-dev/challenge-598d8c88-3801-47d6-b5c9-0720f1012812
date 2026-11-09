# Dockerfile multi-stage para el servicio de notificaciones
# Stage 1: Build - Compilación del servicio
FROM golang:1.21-alpine AS builder

WORKDIR /build

# Copy go mod files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy source code
COPY . .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o notification-service .

# Stage 2: Runtime - Imagen final ligera
FROM alpine:latest

# Install required packages for runtime
RUN apk --no-cache add ca-certificates curl

# Create non-root user for security
RUN adduser -D -u 1000 appuser

WORKDIR /app

# Copy binary from builder stage
COPY --from=builder /build/notification-service /app/

# Copy configuration files
COPY config/ /app/config/

# Set ownership
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Expose application port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1

# Set environment variables
ENV SERVICE_NAME=notification-service \
    ENVIRONMENT=production \
    LOG_LEVEL=info

# Entry point
ENTRYPOINT ["/app/notification-service"]
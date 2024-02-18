FROM golang:1.22.0-alpine3.19 AS goBuild

WORKDIR /app

COPY /src .

RUN apk add --no-cache go && \
    go build main.go

FROM scratch

WORKDIR /app

COPY --from=goBuild /app .

ENTRYPOINT ["./main"]
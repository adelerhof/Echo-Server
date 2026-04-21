# Echo Server — Quick Start

An HTTP server that echoes back request details as JSON. Useful for debugging HTTP clients and testing infrastructure.

## Run locally

```bash
npm ci
PORT=8080 npm start
```

## Run with Docker

```bash
docker run -p 8080:80 ghcr.io/adelerhof/echo-server:latest
```

## Custom responses

| Query / Header | Example | Description |
|---|---|---|
| `?echo_code=` / `X-ECHO-CODE` | `?echo_code=404` | Return a specific HTTP status code |
| `?echo_body=` / `X-ECHO-BODY` | `?echo_body=hello` | Return a custom body |
| `?echo_time=` / `X-ECHO-TIME` | `?echo_time=2000` | Delay response by N milliseconds |
| `?echo_header=` / `X-ECHO-HEADER` | `?echo_header=X-Foo:bar` | Add a response header |

## Build and publish image

```bash
git tag v1.0.0
make release   # builds and pushes :1.0.0 + :latest to ghcr.io/adelerhof/echo-server
```

## Tests

```bash
npm test
```

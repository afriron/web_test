FROM rust:1.50.0-slim-buster as builder

RUN rustup default nightly
RUN rustup update

WORKDIR /usr/src/web_test
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
COPY --from=builder /usr/local/cargo/bin/web_test /usr/local/bin/web_test
ENTRYPOINT ["web_test"]

# RUN chmod +x /usr/local/bin/web_test

# FROM debian:buster-slim
# RUN apt-get update && apt-get install -y extra-runtime-dependencies && rm -rf /var/lib/apt/lists/*
# COPY --from=builder /usr/local/cargo/bin/web_test /usr/local/bin/web_test



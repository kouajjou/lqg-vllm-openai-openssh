# syntax=docker/dockerfile:1
# Le QG: official vLLM v0.30.0 pinned by linux/amd64 digest + openssh-server only.
# No ENTRYPOINT/CMD change. No secrets. No model weights.
FROM --platform=linux/amd64 vllm/vllm-openai@sha256:5f5e535216848d0c52159c8c13a0af04be5f6fe1a84e79914300610796f76d40

USER root
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends openssh-server \
 && rm -rf /var/lib/apt/lists/*

FROM python:3.13-slim

# Keep dependency versions in Git so each release tag records what it builds.
ARG PYHOST_VERSION=0.1.3
ARG FEEDVANTA_VERSION=0.5.0

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /data

# Install the pinned PyHost and independently released Feedvanta plugin.
RUN python -m pip install --upgrade pip && \
    python -m pip install \
      "https://github.com/viper3400/pyhost/releases/download/pyhost-v${PYHOST_VERSION}/pyhost-${PYHOST_VERSION}-py3-none-any.whl" \
      "https://github.com/viper3400/feedvanta/releases/download/plugin-feedvanta-v${FEEDVANTA_VERSION}/feedvanta-${FEEDVANTA_VERSION}-py3-none-any.whl"

EXPOSE 8000

CMD ["pyhost", "--host", "0.0.0.0", "--port", "8000"]

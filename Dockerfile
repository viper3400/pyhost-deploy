FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /data

# Install the pinned PyHost release and its two independently released plugins.
RUN python -m pip install --upgrade pip && \
    python -m pip install \
      "https://github.com/viper3400/pyhost/releases/download/pyhost-v0.1.0/pyhost-0.1.0-py3-none-any.whl" \
      "https://github.com/viper3400/feedvanta/releases/download/plugin-feedvanta-v0.4.0/feedvanta-0.4.0-py3-none-any.whl" \
      "https://github.com/viper3400/pydo/releases/download/plugin-pydo-v2.0.0/pydo_fastapi_plugin-2.0.0-py3-none-any.whl"

EXPOSE 8000

CMD ["pyhost", "--host", "0.0.0.0", "--port", "8000"]

# Minimal python image

Based on buster-slim

Image size ~ 195 MB

### Usage:

Give the python version as a build argument, for example for `3.9.0a1`:

```console
$ PYTHON_VERSION="3.9.0a1" docker build --rm -t python:$PYTHON_VERSION --build-arg PYTHON_VERSION .
```

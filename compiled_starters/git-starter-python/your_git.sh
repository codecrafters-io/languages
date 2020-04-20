#!/bin/sh
PYTHONPATH=$(dirname $0) exec python -m app.main "$@"

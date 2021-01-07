#!/bin/sh
export PYTHONUNBUFFERED=1
PYTHONPATH=$(dirname $0) exec python3 -m app.main "$@"

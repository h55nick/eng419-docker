#!/bin/sh

docker run --name eng419 -it -d --rm -p 8888:8888 -v .:/mnt/notebooks eng419

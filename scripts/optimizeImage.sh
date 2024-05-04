#!/bin/env bash
# Reduce the size and quality of an image
# Usage:
# optimizeImage.sh inputimage.jpeg outputimage.jpeg
convert $1 -quality 80 -resize 40% $2

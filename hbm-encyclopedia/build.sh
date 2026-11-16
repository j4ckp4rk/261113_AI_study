#!/bin/sh
# Assemble the encyclopedia from the orchestrator shell + agent-written parts.
cd "$(dirname "$0")"
cat parts/head.html parts/part1.html parts/part2.html parts/part3.html parts/tail.html > index.html
echo "built index.html ($(wc -c < index.html) bytes)"

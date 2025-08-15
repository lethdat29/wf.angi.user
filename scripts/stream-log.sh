#!/bin/bash
"$@" 2>&1 | while IFS= read -r line; do
  echo "$line"
  curl -s -X POST https://test-publish-njka.onrender.com/publish \
    -H "Content-Type: application/json" \
    -d "{\"message\": \"$line\", \"job_id\": \"$JOB_ID\"}"
done

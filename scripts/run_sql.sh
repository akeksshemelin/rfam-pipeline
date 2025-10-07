#!/usr/bin/env bash
set -euo pipefail
SQL_FILE="$1"
OUT_DIR="out"
mkdir -p "$OUT_DIR"

echo "Running $SQL_FILE ..."
mysql --user=rfamro \
      --host=mysql-rfam-public.ebi.ac.uk \
      --port=4497 \
      --database=Rfam \
      --batch --raw --table \
      < "$SQL_FILE" | tee "$OUT_DIR/$(basename "$SQL_FILE").out"
echo "Done: $OUT_DIR/$(basename "$SQL_FILE").out"
#!/bin/bash

LOG_FILE=/var/log/kk-payments.log

ERRORS=$(grep '"level":"error"' $LOG_FILE | wc -l)
TOTAL=$(wc -l < $LOG_FILE)

RATE=$(echo "scale=2; $ERRORS/$TOTAL*100" | bc)

echo "Error rate: $RATE%" > monitoring/slo_report.txt

if (( $(echo "$RATE > 5" | bc -l) )); then
  echo "SLO BREACH" >> monitoring/slo_report.txt
fi

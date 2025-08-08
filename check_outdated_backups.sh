#!/bin/bash

# ==========================================
# Configuration
# ==========================================
BACKUP_DIR="/var/backups"       # Path to production backup folder
THRESHOLD_DAYS=7                # Max allowed age in days before considered outdated
REPORT_FILE="/var/log/outdated_backups_report.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# ==========================================
# Ensure backup directory exists
# ==========================================
if [ ! -d "$BACKUP_DIR" ]; then
    echo "[$DATE] ERROR: Backup directory '$BACKUP_DIR' not found!" | tee -a "$REPORT_FILE"
    exit 1
fi

# ==========================================
# Find outdated backups
# ==========================================
OUTDATED=$(find "$BACKUP_DIR" -type f -mtime +$THRESHOLD_DAYS)

# ==========================================
# Report results
# ==========================================
echo "===================================" >> "$REPORT_FILE"
echo "[$DATE] Backup Check Report" >> "$REPORT_FILE"
echo "Backup directory: $BACKUP_DIR" >> "$REPORT_FILE"
echo "Threshold: $THRESHOLD_DAYS days" >> "$REPORT_FILE"

if [ -n "$OUTDATED" ]; then
    echo "Outdated backups found:" >> "$REPORT_FILE"
    echo "$OUTDATED" >> "$REPORT_FILE"
else
    echo "✅ All backups are within the allowed threshold." >> "$REPORT_FILE"
fi

echo "" >> "$REPORT_FILE"

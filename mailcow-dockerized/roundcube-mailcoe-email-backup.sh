#!/bin/bash

BACKUP_ROOT="/home/ubuntu/mail-backup/humucarecleaning.co.uk"
LIVE_ROOT="/var/lib/docker/volumes/mailcowdockerized_vmail-vol-1/_data/humucarecleaning.co.uk"

MAIL_UID=5000
MAIL_GID=5000

MAILBOXES=(
  "Inbox:cur:Maildir/cur"
  "Sent:.Sent/cur:Maildir/.Sent/cur"
  "Drafts:.Drafts/cur:Maildir/.Drafts/cur"
  "Junk:.Junk/cur:Maildir/.Junk/cur"
  "Trash:.Trash/cur:Maildir/.Trash/cur"
  "Spam:.spam/cur:Maildir/.spam/cur"
)

echo "Starting full mailbox sync (Inbox, Sent, Drafts, Junk, Trash, Spam) for all users..."

for USERDIR in "$BACKUP_ROOT"/*; do
    USER=$(basename "$USERDIR")

    for MAILBOX in "${MAILBOXES[@]}"; do
        NAME="${MAILBOX%%:*}"
        B_REL="${MAILBOX#*:}"
        B_PATH="${B_REL%%:*}"
        L_PATH="${MAILBOX##*:}"

        BACKUP_PATH="$BACKUP_ROOT/$USER/$B_PATH"
        LIVE_PATH="$LIVE_ROOT/$USER/$L_PATH"

        if [ -d "$BACKUP_PATH" ]; then
            if [ ! -d "$LIVE_PATH" ]; then
                echo "Creating $NAME path for $USER..."
                mkdir -p "$LIVE_PATH"
            fi
            echo "Syncing $NAME for $USER..."
            rsync -av --delete "$BACKUP_PATH/" "$LIVE_PATH/"
            chown -R $MAIL_UID:$MAIL_GID "$LIVE_PATH"
        else
            echo "$NAME not found for $USER. Skipping $NAME sync..."
        fi
    done
done

echo "✅ All mailbox folders synced successfully for all users."

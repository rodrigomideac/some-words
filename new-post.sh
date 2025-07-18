#!/bin/bash

# Get current date in the required format
CURRENT_DATE=$(date +"%Y-%m-%d")
CURRENT_DATETIME=$(date +"%Y-%m-%d %H:%M:%S %z")

# Prompt for title
echo -n "Enter post title: "
read -r TITLE

# Prompt for categories (default: programming)
echo -n "Enter categories (default: programming): "
read -r CATEGORIES
CATEGORIES=${CATEGORIES:-programming}

# Prompt for post date (default: current date)
echo -n "Enter post date (YYYY-MM-DD, default: $CURRENT_DATE): "
read -r POST_DATE
POST_DATE=${POST_DATE:-$CURRENT_DATE}

# Generate filename from title
FILENAME=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g')
FILEPATH="_posts/${POST_DATE}-${FILENAME}.md"

# Create the post file
cat > "$FILEPATH" << EOF
---
layout: post
title:  "$TITLE"
date:   $POST_DATE 12:00:00 -0300
categories: $CATEGORIES
---

Write your post content here.
EOF

echo "Post created: $FILEPATH"
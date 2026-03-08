#!/bin/bash
set -euo pipefail

BRANCH="${1:-main}"
REMOTE_URL="$(git remote get-url origin)"

if [[ "$REMOTE_URL" =~ github.com[:/](.+)/(.+)(\.git)?$ ]]; then
  OWNER="${BASH_REMATCH[1]}"
  REPO="${BASH_REMATCH[2]%.git}"
else
  echo "Unable to parse GitHub owner/repo from origin URL: $REMOTE_URL"
  exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI (gh) is required."
  exit 1
fi

echo "Configuring branch protection for $OWNER/$REPO:$BRANCH"

gh api \
  --method PUT \
  -H "Accept: application/vnd.github+json" \
  "repos/$OWNER/$REPO/branches/$BRANCH/protection" \
  -F required_status_checks.strict=true \
  -F required_status_checks.contexts[]="Dex CI / quality" \
  -F enforce_admins=true \
  -F required_pull_request_reviews.dismiss_stale_reviews=true \
  -F required_pull_request_reviews.required_approving_review_count=1 \
  -F required_conversation_resolution=true \
  -F restrictions=

echo "Branch protection configured."

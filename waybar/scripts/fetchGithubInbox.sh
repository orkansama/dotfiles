#bin/bash

# GitHub CLI api
# https://cli.github.com/manual/gh_api
# https://docs.github.com/en/rest/activity/notifications?versionId=free-pro-team%40latest&productId=rest&apiVersion=2026-03-10
# List notifications for the authenticated user

notifications=$(gh api /notifications | jq length)
fakeJson="{\"percentage\": $notifications}"

echo "$fakeJson"

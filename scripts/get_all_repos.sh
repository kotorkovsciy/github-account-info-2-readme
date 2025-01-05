username="$1"
per_page=100
page=1
repos="[]"

while :; do
  response=$(gh api "users/$username/repos?per_page=$per_page&page=$page")

  if [[ $? -ne 0 ]]; then
    echo "Error: Failed to fetch data from GitHub API"
    exit 1
  fi

  if [[ $(echo "$response" | jq '. | length') -eq 0 ]]; then
    break
  fi

  repos=$(echo "$repos" "$response" | jq -s 'add')
  page=$((page + 1))
done

echo "$repos" | jq -S '. | sort_by(.stargazers_count) | reverse' > /tmp/repos.json

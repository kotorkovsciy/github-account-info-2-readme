username="$1"

latest_repo_name=$(gh api "/users/$username/events/public" --jq ".[0].repo.name")
latest_project="Latest Project: [$latest_repo_name](https://github.com/$latest_repo_name)"

echo $latest_project

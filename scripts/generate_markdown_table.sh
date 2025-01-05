repos_file="$1"

echo "| Name | Homepage | Stars | Last Commit |"
echo "|-----------------------|--------------------------|--------|-------------|"

repos=$(cat "$repos_file")

for repo in $(echo "$repos" | jq -r '.[] | @base64'); do
  _jq() {
    echo ${repo} | base64 --decode | jq -r ${1}
  }

  name=$(_jq '.name')
  homepage="[\`#Homepage\`]($(_jq '.html_url'))"
  stars=$(_jq '.stargazers_count')
  full_name=$(_jq '.full_name')
  last_commit="![$name last commit](https://img.shields.io/github/last-commit/$full_name?style=flat&label=last)"

  echo "| $name | $homepage | $stars | $last_commit |"
done

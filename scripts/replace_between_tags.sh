file="$1"
new_content="$2"
TAG="$3"

tmp_file=$(mktemp)

awk -v tag="$TAG" -v new_content="$new_content" '
  BEGIN { inside_tag = 0 }
  /<!--START_/ && $0 ~ "<!--START_" tag "-->" { inside_tag = 1; print; next }
  inside_tag {
    if ($0 ~ "<!--END_" tag "-->") {
      inside_tag = 0
    } else {
      print new_content
    }
  }
  !inside_tag { print }
' "$file" > "$tmp_file"

mv "$tmp_file" "$file"

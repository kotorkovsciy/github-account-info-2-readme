file="$1"
new_content="$2"
TAG="$3"

awk -v tag="$TAG" -v new_content="$new_content" '
  BEGIN { inside_tag = 0 }
  /<!--START_/ { inside_tag = 1 }
  inside_tag {
    print new_content
    inside_tag = 0
  }
  !inside_tag { print }
' "$file" > temp_file && mv temp_file "$file"

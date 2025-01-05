file="$1"
new_content="$2"
TAG="$3"

new_content=$(printf '%s' "$new_content" | sed 's/[&/\]/\\&/g')

sed -i "/<!--START_$TAG-->/, /<!--END_$TAG-->/ {
    /<!--START_$TAG-->/! { 
    /<!--END_$TAG-->/! s|.*|$new_content| 
  }
}" "$file"

file="$1"
new_content="$2"
TAG="$3"

escaped_new_content=$(echo "$new_content" | sed 's/[&/\]/\\&/g')

sed -i "/<!--START_$TAG-->/, /<!--END_$TAG-->/ {
    /<!--START_$TAG-->/! { 
    /<!--END_$TAG-->/! s|.*|$escaped_new_content| 
  }
}" "$file"

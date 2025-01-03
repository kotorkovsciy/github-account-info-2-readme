# GitHub Account Info to README

## Description
This GitHub Action retrieves information about a specified GitHub account, such as public data, repositories, and other relevant details, and inserts this information into a specified README file.

## Example Workflows

### Example Workflow with Personal GitHub Token

```yaml
name: Update README with GitHub Account Info

on:
  push:
    branches:
      - main

jobs:
  update-readme:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Insert GitHub Account Info into README
        uses: kotorkovsciy/github-account-info-2-readme@v0.0.1
        with:
          GH_TOKEN: ${{ secrets.PERSONAL_GITHUB_TOKEN }}  # Your personal GitHub token
          github_username: kotorkovsciy
          target_file: README.md
```

### Example Workflow with Repository Token
```yaml
name: Update README with GitHub Account Info

on:
  push:
    branches:
      - main

jobs:
  update-readme:
    runs-on: ubuntu-latest
    permissions:
      contents: write  # Grant permission to write to the repository contents
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Insert GitHub Account Info into README
        uses: kotorkovsciy/github-account-info-2-readme@v0.0.1
        with:
          GH_TOKEN: ${{ secrets.GITHUB_TOKEN }}  # Repository token
          github_username: kotorkovsciy
          target_file: README.md
```

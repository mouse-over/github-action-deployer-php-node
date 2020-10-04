# MouseOver PHP deployer

Use deployer script to deploy php app with composer, ssh, nodejs and yarn support
## Inputs

### `task`

**Required** Deployer task `"deploy"`.

### `hostOrStage`

Deployer host or stage default `""`.

## Example usage

```yaml
uses: mouse-over/github-action-deployer-php-node@master
with:
  task: 'deploy'
  hostOrStage: 'production'
```

## Example workflow
```yaml
name: Deploy

jobs:
  deploy:
    runs-on: ubuntu-latest
    name: Build and deploy
    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - name: Prepare SSH key
        env:
          PRIVATE_KEY: ${{ secrets.PRIVATE_KEY }}
        run: |
          echo -e "StrictHostKeyChecking no" >> .ssh/config
          echo "$PRIVATE_KEY" | tr -d '\r' > .ssh/id_rsa
          chmod 0600 .ssh/id_rsa
        working-directory: ./

      - name: Build and deploy
        uses: mouse-over/github-action-deployer-php-node@master 
        with:
          task: deploy
          hostOrStage: production
```
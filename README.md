# rg-gha-repository-dispatch

![Main](https://github.com/chenrui333/rg-gha-repository-dispatch/workflows/Main/badge.svg)

test repo used for testing the repository_dispatch event trigger and env setup.

## Test script

```
curl -X POST -u "meetcvs:<REPO_TOKEN>" \
-H "Accept: application/vnd.github.everest-preview+json"  \
-H "Content-Type: application/json" \
https://api.github.com/repos/meetup/rg-gha-repository-dispatch/dispatches \
--data '{"event_type": "blt-jenkins", "client_payload": { "image_tag": "switchboard-xx"}}'
```

```
on:
  push:
    branches-ignore: "release*"
  repository_dispatch:
    types: ["blt-jenkins"]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: echo-env
        env:
          RELEASE_TAG: ${{ github.event.client_payload.image_tag }}
```

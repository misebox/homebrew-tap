# homebrew-tap

Homebrew tap for misebox's tools.

## Install

```sh
brew tap misebox/tap
brew install misebox/tap/oadig
```

## Formulas

| Formula | Upstream |
|---|---|
| `oadig` | https://github.com/misebox/oadig |

## Updating a formula

When a new upstream release is published:

1. Fetch SHA256 hashes of the release assets:

   ```sh
   scripts/sha256.sh <name> <version>
   ```

2. Edit `Formula/<name>.rb`:
   - Update `version`
   - Update each `url` (tag in the URL)
   - Replace each `sha256` with the value printed by the script

3. Verify style:

   ```sh
   brew style Formula/<name>.rb
   ```

4. Commit and push. Users get the new version on `brew upgrade`.

## Adding a new formula

Create `Formula/<name>.rb` modeled after an existing one. One file per tool.

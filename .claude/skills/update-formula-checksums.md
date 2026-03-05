# update-formula-checksums

Update sha256 checksums and version for Homebrew Formula release binaries.

## Trigger

Use this skill when the user asks to:

- Update Formula checksums
- Update `<tool-name>` to a new version
- Sync Formula with a new GitHub release

## Target Formulas

`.rb` files under `Formula/` directory:

- `Formula/cql-lint.rb`
- `Formula/spl-lint.rb`
- `Formula/wazuh-cli.rb`

## Steps

### 1. Confirm target tool and version

Ask the user for:

- Tool name (cql-lint, spl-lint, wazuh-cli)
- Target version (e.g., v0.2.0)

### 2. List release assets from GitHub

```bash
gh release view v<VERSION> --repo hiboma/<TOOL_NAME> --json assets --jq '.assets[].name'
```

### 3. Download assets and compute sha256

```bash
cd /tmp
gh release download v<VERSION> --repo hiboma/<TOOL_NAME> --pattern '*.tar.gz'
shasum -a 256 *.tar.gz
```

### 4. Update the Formula file

Edit `Formula/<TOOL_NAME>.rb`:

- Update `version` field to the new version
- Update `sha256` for each platform (aarch64-apple-darwin, x86_64-apple-darwin, x86_64-unknown-linux-gnu, aarch64-unknown-linux-gnu)
- Verify the URL pattern matches existing conventions (URL patterns differ per tool, e.g., wazuh-cli does not include the version in the filename)

### 5. Update README.md

Update the version number in the Formulas table in `README.md`.

### 6. Cleanup

```bash
rm -f /tmp/<TOOL_NAME>-*.tar.gz
```

## Notes

- Each Formula supports different platforms. Only update platforms that have release assets.
- URL patterns vary per tool (e.g., wazuh-cli omits version from the filename). Always check the existing URL pattern before editing.
- Always compute checksums from actually downloaded files. Never guess or manually enter hash values.

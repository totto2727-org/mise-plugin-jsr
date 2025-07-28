# mise-plugin-jsr

mise plugin for installing jsr packages as tools.

## Installation

```bash
mise plugin install jsr https://github.com/totto2727-org/mise-plugin-jsr
```

## Usage

### Examples

```bash
# Install prettier
mise install --global jsr:@totto/template/cli

# Use prettier
mise x jsr:@totto/template/cli -- cli --help

# List available versions
mise ls-remote jsr:@totto2727/template/cli
```

## Requirements

- Deno must be installed on your system

## License

MIT 

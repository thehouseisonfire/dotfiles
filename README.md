# Dotfiles

Managed with [chezmoi](https://www.chezmoi.io/). Source state lives under `home/` (see `.chezmoiroot`) and maps to `$HOME` — mainly `home/dot_config/` → `~/.config/`.

## Install

```sh
chezmoi init --apply https://github.com/<you>/<repo>.git
```

Or from a local clone:

```sh
chezmoi init --apply /path/to/dotfiles
```

Requires [chezmoi](https://www.chezmoi.io/install/) on the machine.

## Day-to-day

```sh
chezmoi apply                 # write source → home
chezmoi diff                  # preview changes
chezmoi add ~/.config/foo     # pull a live file into source
chezmoi update                # pull remote + apply
```

Edit files under `home/dot_config/`, then `chezmoi apply`. Scripts use the `executable_` prefix so chezmoi installs them as executable.

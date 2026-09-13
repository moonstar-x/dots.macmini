# dots.macmini

Dotfiles and machine setup for my Mac mini.

Everything here is driven by two things: a `Brewfile` that declares the packages, casks and App Store apps to install, and a set of numbered scripts that install the rest, symlink the configs into place, and do the post-install wiring. Running the scripts in order takes a clean macOS install to a fully configured machine.

## Layout

```
Brewfile      # Homebrew packages, casks, taps and App Store apps
config/       # The actual dotfiles, one directory per program
scripts/      # Numbered bootstrap scripts, meant to be run in order
```

Configs live in `config/` and are **symlinked** into their expected locations rather than copied, so editing a file in this repo takes effect immediately and changes can be committed straight back.

## Requirements

- macOS on Apple Silicon (Homebrew is expected at `/opt/homebrew`)
- Command Line Tools for Xcode (`xcode-select --install`)
- Signed in to the App Store, so `mas` can install the App Store apps

## Bootstrap

Clone the repo and run the scripts from inside `scripts/` — they resolve paths relative to the current working directory:

```bash
git clone https://github.com/moonstar-x/dots.macmini.git ~/dots.macmini
cd ~/dots.macmini/scripts
```

Then, in order:

```bash
# 1. Homebrew, Oh My Zsh and the zsh plugins
./01-install-tools.sh

# 2. Everything declared in the Brewfile
brew bundle --file ../Brewfile

# 3. Symlink all configs into place
./02-config-symlinks.sh
```

Open a new shell at this point so the freshly linked `.zshrc` and `.zprofile` are loaded, then continue:

```bash
# 4. Install and pin the Node.js and Python versions
./03-configure-runtimes.sh

# 5. Install the programs that don't come from Homebrew
./04-install-other-programs.sh <program>

# 6. Install the VSCodium extensions
./05-install-vscodium-extensions.sh

# 7. Post-install steps that need the tools already configured
./06-apply-configs-post.sh
```

### Notes

- `04-install-other-programs.sh` takes the name of a single program to install and is run once per program — it covers the few things that are built from source or installed as a CLI extension. Run it with no valid name to be told the name is unknown; the available names are the functions defined at the top of the script.
- `02-config-symlinks.sh` replaces existing config files and theme directories at the destinations it manages. Back up anything you care about before running it on a machine that isn't fresh.
- The scripts are idempotent enough to re-run, with the exception of `01-install-tools.sh`, whose `git clone` steps fail if the plugins are already present.

## Updating

Since the configs are symlinked, changing a program's settings on the machine changes the file in this repo. Commit and push from here as usual:

```bash
cd ~/dots.macmini
git add -A && git commit -m "Updated configs." && git push
```

To capture newly installed software, regenerate the `Brewfile`:

```bash
brew bundle dump --force --file ~/dots.macmini/Brewfile
```

Note that the generated file is flat — the committed `Brewfile` is grouped into sections by hand, so it's usually easier to add the new entries to the right section manually.

## Theme

Just about everything here is themed with [Catppuccin Macchiato](https://github.com/catppuccin/catppuccin), with [Nerd Fonts](https://www.nerdfonts.com/) for the glyphs in the terminal.

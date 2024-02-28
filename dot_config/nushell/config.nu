# Nushell Config File
#
# version = "0.88.1"

# External completer example
# let carapace_completer = {|spans|
#     carapace $spans.0 nushell $spans | from json
# }

# Carapace completer
source ~/.cache/carapace/init.nu

# Theme
use ~/.config/nushell/nu_scripts/themes/nu-themes/catppuccin-mocha.nu

# The default config record. This is where much of your global configuration is setup.
$env.config = {
    edit_mode: vi,
    show_banner: false
    completions: {
        algorithm: "fuzzy"
    }
    use_kitty_protocol: true
    highlight_resolved_externals: true
    color_config: (catppuccin-mocha)
    hooks: {
        pre_prompt: [{ ||
            if (which direnv | is-empty) {
                return
            }

            direnv export json | from json | default {} | load-env
        }]
    }
}

# Prompt
source ~/.config/nushell/nu_scripts/modules/prompt/starship.nu

# Completions
use ~/.config/nushell/nu_scripts/custom-completions/gh/gh-completions.nu *
use ~/.config/nushell/nu_scripts/custom-completions/npm/npm-completions.nu *
use ~/.config/nushell/nu_scripts/custom-completions/man/man-completions.nu *
use ~/.config/nushell/nu_scripts/custom-completions/pnpm/pnpm-completions.nu *
use ~/.config/nushell/nu_scripts/custom-completions/pass/pass-completions.nu *

# Aliases
source ~/.config/nushell/nu_scripts/aliases/git/git-aliases.nu
alias g = git
alias k = kubectl
alias la = ls -a
alias lg = lazygit
alias v = nvim
alias y = paru -Ss
alias ys = paru -S
alias yy = paru -Syyu

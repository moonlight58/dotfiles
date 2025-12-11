if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Custom Color for custom-ls (might switch to rgb for accurate color representation)
COLOR_ARDUINO="0,151,156"
COLOR_ASM="255,75,66"
COLOR_CMAKE="1,104,199"
COLOR_CRYSTAL="255,255,255"
COLOR_CSS="0,95,175"
COLOR_C_FILE="95,175,215"
COLOR_C_HEADER="175,95,255"
COLOR_CPP="162,121,221"
COLOR_DEFAULT="255,255,255"
COLOR_DIR="0,95,215"
COLOR_DOCKER="29,100,236"
COLOR_DOTNET="190,190,190"
COLOR_EXECUTABLE="0,255,0"
COLOR_GIT="215,95,0"
COLOR_GO="95,215,255"
COLOR_GODOT="175,255,255"
COLOR_GRADLE="45,183,198"
COLOR_HTML="228,77,37"
COLOR_JAVA="255,95,0"
COLOR_JAVASCRIPT="255,255,0"
COLOR_JSON="193,174,28"
COLOR_KOTLIN="151,67,184"
COLOR_LICENSE="145,152,161"
COLOR_LUA="183,183,229"
COLOR_MAKEFILE="95,255,0"
COLOR_MARKDOWN="255,255,255"
COLOR_NEOVIM="118,175,65"
COLOR_NIM="226,226,226"
COLOR_NPM="160,160,160"
COLOR_PHP="138,147,189"
COLOR_PYTHON="255,188,3"
COLOR_QT="190,190,190"
COLOR_R="57,57,57"
COLOR_RESET="\e[0m"
COLOR_RUBY="196,196,196"
COLOR_RUST="214,100,0"
COLOR_SHELL="18,189,13"
COLOR_TOML="255,255,255"
COLOR_TYPESCRIPT="69,69,69"
COLOR_VUE="29,29,29"
COLOR_YAML="161,161,161"
COLOR_ZIP="236,165,23"


custom-ls() {
    # If arguments are passed, use normal ls
    if [ $# -ge 1 ]; then
        command ls "$@"
        return 0
    fi

    # Collect all items in an array
    local items=()
    local colored_items=()

    for item in * .[^.]* ..?*; do
        # Check if the item actually exists
        [ -e "$item" ] || [ -L "$item" ] || continue

        items+=("$item")

        # Determine the color based on file type
        local colored_item=""
        if [ -d "$item" ]; then
            # Directory
            colored_item="$(COLOR_RGB "$COLOR_DIR")󰉋 ${COLOR_RESET}${item}/"
        elif [ -x "$item" ]; then
            # Executable file
            colored_item="$(COLOR_RGB "$COLOR_EXECUTABLE") ${COLOR_RESET}${item}"
        else
            case "$item" in
                *.asm|*.s)
                    colored_item="$(COLOR_RGB "$COLOR_ASM") ${COLOR_RESET}${item}"
                    ;;
                *.c)
                    colored_item="$(COLOR_RGB "$COLOR_C_FILE") ${COLOR_RESET}${item}"
                    ;;
                *.cmake)
                    colored_item="$(COLOR_RGB "$COLOR_CMAKE") ${COLOR_RESET}${item}"
                    ;;
                *.cpp)
                    colored_item="$(COLOR_RGB "$COLOR_CPP") ${COLOR_RESET}${item}"
                    ;;
                *.cr)
                    colored_item="$(COLOR_RGB "$COLOR_CRYSTAL") ${COLOR_RESET}${item}"
                    ;;
                *.css|*.scss)
                    colored_item="$(COLOR_RGB "$COLOR_CSS") ${COLOR_RESET}${item}"
                    ;;
                *.git|.gitignore)
                    colored_item="$(COLOR_RGB "$COLOR_GIT")󰊢 ${COLOR_RESET}${item}"
                    ;;
                *.go)
                    colored_item="$(COLOR_RGB "$COLOR_GO") ${COLOR_RESET}${item}"
                    ;;
                *.godot)
                    colored_item="$(COLOR_RGB "$COLOR_GODOT") ${COLOR_RESET}${item}"
                    ;;
                *.gradle)
                    colored_item="$(COLOR_RGB "$COLOR_GRADLE") ${COLOR_RESET}${item}"
                    ;;
                *.h)
                    colored_item="$(COLOR_RGB "$COLOR_C_HEADER") ${COLOR_RESET}${item}"
                    ;;
                *.html|*.htm)
                    colored_item="$(COLOR_RGB "$COLOR_HTML") ${COLOR_RESET}${item}"
                    ;;
                *.ino)
                    colored_item="$(COLOR_RGB "$COLOR_ARDUINO") ${COLOR_RESET}${item}"
                    ;;
                *.java)
                    colored_item="$(COLOR_RGB "$COLOR_JAVA") ${COLOR_RESET}${item}"
                    ;;
                *.json)
                    colored_item="$(COLOR_RGB "$COLOR_JSON") ${COLOR_RESET}${item}"
                    ;;
                *.js|*.jsx)
                    colored_item="$(COLOR_RGB "$COLOR_JAVASCRIPT") ${COLOR_RESET}${item}"
                    ;;
                *.kt)
                    colored_item="$(COLOR_RGB "$COLOR_KOTLIN") ${COLOR_RESET}${item}"
                    ;;
                *.lua)
                    colored_item="$(COLOR_RGB "$COLOR_LUA")󰢱 ${COLOR_RESET}${item}"
                    ;;
                *.md)
                    colored_item="$(COLOR_RGB "$COLOR_MARKDOWN") ${COLOR_RESET}${item}"
                    ;;
                *.net)
                    colored_item="$(COLOR_RGB "$COLOR_DOTNET")󰪮 ${COLOR_RESET}${item}"
                    ;;
                *.nim)
                    colored_item="$(COLOR_RGB "$COLOR_NIM") ${COLOR_RESET}${item}"
                    ;;
                *.npm)
                    colored_item="$(COLOR_RGB "$COLOR_NPM") ${COLOR_RESET}${item}"
                    ;;
                *.php)
                    colored_item="$(COLOR_RGB "$COLOR_PHP") ${COLOR_RESET}${item}"
                    ;;
                *.py)
                    colored_item="$(COLOR_RGB "$COLOR_PYTHON") ${COLOR_RESET}${item}"
                    ;;
                *.qt)
                    colored_item="$(COLOR_RGB "$COLOR_QT") ${COLOR_RESET}${item}"
                    ;;
                *.r)
                    colored_item="$(COLOR_RGB "$COLOR_R") ${COLOR_RESET}${item}"
                    ;;
                *.rb)
                    colored_item="$(COLOR_RGB "$COLOR_RUBY") ${COLOR_RESET}${item}"
                    ;;
                *.rs)
                    colored_item="$(COLOR_RGB "$COLOR_RUST") ${COLOR_RESET}${item}"
                    ;;
                *.sh|*.bash|*.zsh)
                    colored_item="$(COLOR_RGB "$COLOR_SHELL") ${COLOR_RESET}${item}"
                    ;;
                *.toml)
                    colored_item="$(COLOR_RGB "$COLOR_TOML") ${COLOR_RESET}${item}"
                    ;;
                *.ts|*.tsx)
                    colored_item="$(COLOR_RGB "$COLOR_TYPESCRIPT") ${COLOR_RESET}${item}"
                    ;;
                *.vim)
                    colored_item="$(COLOR_RGB "$COLOR_NEOVIM") ${COLOR_RESET}${item}"
                    ;;
                *.vue)
                    colored_item="$(COLOR_RGB "$COLOR_VUE") ${COLOR_RESET}${item}"
                    ;;
                *.yaml)
                    colored_item="$(COLOR_RGB "$COLOR_YAML") ${COLOR_RESET}${item}"
                    ;;
                *.zip|*.tgz)
                    colored_item="$(COLOR_RGB "$COLOR_ZIP") ${COLOR_RESET}${item}"
                    ;;
                Makefile|makefile|*.mk)
                    colored_item="$(COLOR_RGB "$COLOR_MAKEFILE") ${COLOR_RESET}${item}"
                    ;;
                LICENSE)
                    colored_item="$(COLOR_RGB "$COLOR_LICENSE")󰗑 ${COLOR_RESET}${item}"
                    ;;
                Dockerfile)
                    colored_item="$(COLOR_RGB "$COLOR_DOCKER") ${COLOR_RESET}${item}"
                    ;;
                *)
                    colored_item="$(COLOR_RGB "$COLOR_DEFAULT") ${COLOR_RESET}${item}"
                    ;;
            esac
        fi

        colored_items+=("$colored_item")
        visible_lengths+=("$visible_len")
    done

    # If no files, return
    if [ ${#items[@]} -eq 0 ]; then
        return 0
    fi

    # Calculate terminal width
    local term_width=$(tput cols)

    # Find the maximum length of file names (accounting for the "/" on directories)
    local max_len=0
    for i in "${!items[@]}"; do
        local item="${items[$i]}"
        local len=${#item}
            # Add 1 for the "/" if it's a directory
            if [ -d "$item" ]; then
                len=$((len + 1))
            fi
            if [ $len -gt $max_len ]; then
                max_len=$len
            fi
        done

        # Account for icon (3 chars: icon + space) and add 2 space padding between columns
        local col_width=$((max_len + 3 + 2))

        # Calculate the number of columns
        local cols=$((term_width / col_width))
        if [ $cols -lt 1 ]; then
            cols=1
        fi

        # Display in columns
        local col=0
        for i in "${!colored_items[@]}"; do
            # Display the colored item
            printf "%b" "${colored_items[$i]}"

            # Calculate padding: actual filename length + icon (3 chars) + "/" if directory
            local visible_len=$((${#items[$i]} + 3))
                if [ -d "${items[$i]}" ]; then
                    visible_len=$((visible_len + 1))
                fi
                local padding=$((col_width - visible_len))

                # Add padding spaces
                printf "%*s" "$padding" ""

                col=$((col + 1))

                if [ $col -ge $cols ]; then
                    printf "\n"
                    col=0
                fi
            done

            # Final newline only if we're not at the start of a line
            if [ $col -ne 0 ]; then
                printf "\n"
            fi
        }

    COLOR_RGB() {
        local arg="$1"
        IFS=',' read -r r g b <<< "$(echo "$arg" | tr -d 'rgb()')"
        echo -ne "\e[38;2;${r};${g};${b}m"
    }

# Function to print a gradient between two RGB colors
print_gradient_color() {
    local text="$1"
    local start_rgb="$2"
    local end_rgb="$3"

    IFS=',' read -r start_r start_g start_b <<< "$(echo "$start_rgb" | tr -d 'rgb()')"
    IFS=',' read -r end_r end_g end_b <<< "$(echo "$end_rgb" | tr -d 'rgb()')"

    local length=${#text}
        local result=""

        for ((i=0; i<length; i++)); do
            local ratio=$((i * 100 / (length - 1)))
            local r=$((start_r + (end_r - start_r) * ratio / 100))
            local g=$((start_g + (end_g - start_g) * ratio / 100))
            local b=$((start_b + (end_b - start_b) * ratio / 100))
            result+="$(COLOR_RGB "$r,$g,$b")${text:$i:1}"
        done

        echo -ne "${result}${COLOR_RESET}"
    }

# Custom cd Aliases
alias cdspot="cd $HOME/Documents/github/spotCLI/"
alias cdsae="cd $HOME/Documents/SAE-SAPUE/"

# Custom Basic Aliases
alias cls='clear'
alias c='clear'
alias quit='exit'
alias q='exit'
alias ls='custom-ls'

# Custom Git Aliases
alias gst='git status'
alias gpl='git pull'
alias gpu='git push'
alias gco='git checkout'
alias gcm='git commit -m'
alias gaa='git add .'

# NPM Aliases
alias nrs='npm run serve'
alias nrd='npm run dev'

# Python Aliases
alias py='python'

# Vim Aliases
alias vim='nvim'

# System Management Aliases
alias pls="sudo"
alias installquick="sudo apt install -y"
alias removequick="sudo apt remove -y"
alias updatequick="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y"

alias source-python="source venv/bin/activate"

# Rust/Cargo environment setup to PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Crous related stuff
crous-menu() {
    node ~/Documents/github/Crous-Menu-Displayer/crous_menu.js "$1"
}

# Custom functions like git-push, vencord-discord, find-unsure, git-clone
vencord-discord() {
    # check argument
    if [ $# -ne 1 ]; then
        echo -e "\e[33mUsage:\e[0m \e[34mvencord-discord install\e[0m/\e[34mupdate\e[0m"
        return 1
    fi

    local type_install="$1"

    echo "=== $type_install Discord client ==="

    echo "=== Downloading the latest stable version of Discord ==="
    curl -o discord.tar.gz -J --location-trusted --max-redirs 10 "https://discord.com/api/download/stable?platform=linux&format=tar.gz"

    echo "=== Extracting Discord archive ==="
    tar -xzf discord.tar.gz

    echo "=== Installing/Updating Discord files to /opt/discord/ ==="
    sudo mkdir -p /opt/discord
    sudo cp -r Discord/* /opt/discord/

    echo "=== Modifying the desktop file for custom folder ==="
    sudo sed -i 's|Exec=/usr/share/discord/Discord|Exec=/usr/bin/discord|' /opt/discord/discord.desktop
    sudo sed -i 's|Icon=discord|Icon=/opt/discord/discord.png|' /opt/discord/discord.desktop

    echo "=== Installing Discord ==="
    if [ "$1" == "install" ]; then
        # set symlink
        sudo ln -sf /opt/discord/Discord /usr/bin/discord

        echo ""
    fi

    echo "=== Set ownership and add execute permission ==="
    sudo chown root:root -R /opt/discord/
    sudo chmod -R +x /opt/discord/

    echo "=== Delete temp files ==="
    rm -rf discord.tar.gz Discord

    echo "Launching Vencord Installer/Updater..."
    sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"

    echo -e "\e[32m✓ Operation completed successfully!\e[0m"
}

# Fonction git-push
git-push() {
    # Validate first argument (commit message)
    if [ $# -lt 1 ]; then
        echo -e "\e[33mUsage: git-push \"commit message\" [branch]\e[0m"
        return 1
    fi

    local commit_message="$1"
    local branch="$2"

    # If branch not provided, use current branch
    if [ -z "$branch" ]; then
        branch=$(git branch --show-current)
        if [ -z "$branch" ]; then
            echo -e "\e[31m✗ Error: Unable to determine current branch. Please specify a branch.\e[0m"
            return 1
        fi
        echo -e "\e[33m Using current branch: $branch\e[0m"
    fi

    # If there is no commit yet
    if ! git rev-parse HEAD >/dev/null 2>&1; then
        echo -e "\e[31m✗ No commits yet. Creating initial commit...\e[0m"
        git add .
        if ! git commit -m "$commit_message"; then
            echo -e "\e[31m✗ Error while creating the initial commit.\e[0m"
            return 1
        fi
        echo "Pushing to branch: $branch"
        if ! git push origin "$branch"; then
            echo -e "\e[31m✗ Error during push.\e[0m"
            return 1
        fi
        echo -e "\e[32m✓ Initial commit and push succeeded!\e[0m"
        return 0
    fi

    echo -e "\e[32m=== Synchronizing with remote ===\e[0m"

    # Fetch latest changes
    echo "Fetching latest changes from remote..."
    if ! git fetch origin; then
        echo -e "\e[31m✗ Error during fetch. Aborting.\e[0m"
        return 1
    fi

    # Ensure we're on the correct branch
    current_branch=$(git branch --show-current)
    if [ "$current_branch" != "$branch" ]; then
        echo "Switching to branch: $branch"
        if ! git checkout "$branch"; then
            echo -e "\e[31m✗ Error switching branch. Aborting.\e[0m"
            return 1
        fi
    fi

    # Check for remote changes
    local_commit=$(git rev-parse HEAD)
    remote_commit=$(git rev-parse "origin/$branch" 2>/dev/null)

    if [ "$local_commit" != "$remote_commit" ]; then
        echo "Remote changes detected. Updating local..."
        if ! git pull origin "$branch"; then
            echo -e "\e[31m✗ Error during pull. Please resolve conflicts manually.\e[0m"
            return 1
        fi
        echo "✓ Synchronization completed successfully."
    else
        echo "✓ Local repository is already up to date."
    fi

    echo -e "\e[32m=== Creating and pushing commit ===\e[0m"

    # If there are no changes to commit
    if git diff --quiet && git diff --cached --quiet; then
        echo -e "\e[35mNo changes to commit.\e[0m"
        return 0
    fi

    # Stage changes
    echo "Staging modified files..."
    git add .

    # Commit
    echo "Creating commit with message: '$commit_message'"
    if ! git commit -m "$commit_message"; then
        echo -e "\e[31m✗ Error while creating the commit.\e[0m"
        return 1
    fi

    # Push
    echo "Pushing to branch: $branch"
    if ! git push origin "$branch"; then
        echo -e "\e[31m✗ Error during push.\e[0m"
        return 1
    fi

    echo -e "\e[32m✓ Operation completed successfully!\e[0m"
}

# Fonction find files if unsure about name
find-unsure() {
    if [ $# -ne 1 ]; then
        echo -e "\e[33mUsage:\e[0m \e[34mfind-unsure\e[0m \e[33m<name file>\e[0m"
        return 1
    fi

    local file_name="$1"

    command find ~ -iname "*$file_name*"
}

git-clone() {
    # Validate arguments
    if [ $# -ne 1 ]; then
        echo -e "\e[33mUsage: git-clone <repo url>\e[0m"
        return 1
    fi

    local repo_url="$1"

    # Vérifier si le fichier ~/.git_identities existe
    if [ ! -f "$HOME/.git_identities" ]; then
        echo -e "\e[31m✗ The file ~/.git_identities does not exist. Please create git profiles first.\e[0m"
        return 1
    fi

    echo "Select a git profile:"
    mapfile -t profiles < <(
        grep -E '^\[user\]$' -A 2 "$HOME/.git_identities" \
            | grep -E 'name = |email = ' \
            | sed 's/^[[:space:]]*//' \
            | paste - - \
            | sed 's/ name = /, /' \
            | sed 's/ email = /, /'
        )

        # Afficher les profils disponibles
        select profile in "${profiles[@]}"; do
            if [ -n "$profile" ]; then
                git_name=$(echo "$profile" | cut -d',' -f1 | sed 's/name = //')
                git_email=$(echo "$profile" | cut -d',' -f2 | sed 's/email = //')
                break
            else
                echo -e "\e[31m✗ Invalid selection. Please try again.\e[0m"
            fi
        done

        # Cloner le dépôt
        echo "Cloning repo: $repo_url"
        if ! git clone "$repo_url"; then
            echo -e "\e[31m✗ Error cloning the repo.\e[0m"
            return 1
        fi

        # Accéder au répertoire cloné
        repo_dir=$(basename "$repo_url" .git)
        cd "$repo_dir" || { echo -e "\e[31m✗ Error: Unable to enter the cloned repo directory.\e[0m"; return 1; }

        # Configurer le profil Git
        echo "Using profile: $git_name <$git_email>"
        git config user.name "$git_name"
        git config user.email "$git_email"

        echo -e "\e[32m✓ Repo cloned successfully!\e[0m"
    }

git-create-repo() {
    # Validate arguments
    if [ $# -ne 2 ]; then
        echo -e "\e[33mUsage: git-create-repo <repo name> <public|private>\e[0m"
        return 1
    fi

    local repo_name="$1"
    local visibility="$2"

    if [[ "$visibility" != "public" && "$visibility" != "private" ]]; then
        echo -e "\e[31m✗ Error: Visibility must be 'public' or 'private'.\e[0m"
        return 1
    fi

    # Load git profiles
    if [ ! -f "$HOME/.git_identities" ]; then
        echo -e "\e[31m✗ The file ~/.git_identities does not exist.\e[0m"
        return 1
    fi

    echo "Select a git profile:"
    local -a profiles names emails gh_users
    local in_user_section=0
    local current_name="" current_email="" current_gh_user=""

    while IFS= read -r line; do
        if [[ "$line" =~ ^\[user\]$ ]]; then
            in_user_section=1
            current_name=""
            current_email=""
            current_gh_user=""
        elif [[ $in_user_section -eq 1 ]]; then
            if [[ "$line" =~ ^[[:space:]]*name[[:space:]]*=[[:space:]]*(.+)$ ]]; then
                current_name="${BASH_REMATCH[1]}"
            elif [[ "$line" =~ ^[[:space:]]*email[[:space:]]*=[[:space:]]*(.+)$ ]]; then
                current_email="${BASH_REMATCH[1]}"
            elif [[ "$line" =~ ^[[:space:]]*github[[:space:]]*=[[:space:]]*(.+)$ ]]; then
                current_gh_user="${BASH_REMATCH[1]}"
            fi

            # When we have all three, add to arrays
            if [[ -n "$current_name" && -n "$current_email" && -n "$current_gh_user" ]]; then
                profiles+=("$current_name <$current_email> [@$current_gh_user]")
                names+=("$current_name")
                emails+=("$current_email")
                gh_users+=("$current_gh_user")
                in_user_section=0
            fi
        elif [[ "$line" =~ ^\[.*\]$ ]]; then
            in_user_section=0
        fi
    done < "$HOME/.git_identities"

    if [ ${#profiles[@]} -eq 0 ]; then
        echo -e "\e[31m✗ No complete profile found in ~/.git_identities\e[0m"
        echo -e "\e[33mMake sure each [user] section has: name, email, and github\e[0m"
        return 1
    fi

    select profile in "${profiles[@]}"; do
        if [ -n "$profile" ]; then
            local idx=$((REPLY - 1))
            git_name="${names[$idx]}"
            git_email="${emails[$idx]}"
            gh_user="${gh_users[$idx]}"
            break
        else
            echo -e "\e[31m✗ Invalid selection. Please try again.\e[0m"
        fi
    done

    echo -e "Selected profile: $git_name <$git_email> [@$gh_user]\n"

    # Switch GitHub CLI account
    echo -e "\e[33mSwitching to GitHub account: $gh_user\e[0m"
    if ! gh auth switch --user "$gh_user" 2>/dev/null; then
        echo -e "\e[31m✗ Could not switch to GitHub user '$gh_user'\e[0m"
        echo -e "\e[33mYou may need to authenticate this account first with: gh auth login\e[0m"
        return 1
    fi
    echo -e "\e[32m✓ Switched to @$gh_user\e[0m\n"

    # Ask if repo already exists locally
    echo "Does the repo already exist locally? (y/n)"
    read -r response

    if [[ "$response" =~ ^[Yy]$ ]]; then
        # CASE 1: Existing repo - find and link
        echo -e "\nSearching for repo '$repo_name' on the system..."

        mapfile -t local_repos < <(\find ~ -type d -name "$repo_name" 2>/dev/null | while read -r dir; do
        [[ -d "$dir/.git" ]] && echo "$dir"
    done)

    local target_dir=""
    if [ ${#local_repos[@]} -gt 1 ]; then
        echo "Multiple local directories found:"
        select sel in "${local_repos[@]}"; do
            if [ -n "$sel" ]; then
                target_dir="$sel"
                break
            else
                echo -e "\e[31m✗ Invalid selection.\e[0m"
            fi
        done
    elif [ ${#local_repos[@]} -eq 1 ]; then
        target_dir="${local_repos[0]}"
        echo "Directory found: $target_dir"
    else
        echo -e "\e[31m✗ Error: No git repo named '$repo_name' found.\e[0m"
        return 1
    fi

    cd "$target_dir" || { echo -e "\e[31m✗ Error: Unable to access the directory.\e[0m"; return 1; }

    # Configure profile
    git config user.name "$git_name"
    git config user.email "$git_email"

    # Check for existing remote
    if git remote get-url origin &>/dev/null; then
        echo -e "\e[33mWarning: An 'origin' remote already exists:\e[0m"
        git remote get-url origin
        echo "Do you want to replace it? (y/n)"
        read -r replace
        if [[ ! "$replace" =~ ^[Yy]$ ]]; then
            echo -e "\e[32mOperation cancelled.\e[0m"
            return 0
        fi
        git remote remove origin
    fi

    # Check for commits
    if ! git rev-parse HEAD &>/dev/null; then
        echo -e "\e[33mThe repo has no commits. Creating an initial commit...\e[0m"
        if [ ! -f "README.md" ]; then
            echo "# $repo_name" > README.md
            git add README.md
        else
            git add -A
        fi
        git commit -m "Initial commit" || {
            echo -e "\e[31m✗ Error creating the initial commit.\e[0m"
                    return 1
                }
    fi

    echo -e "\n\e[32mCreating remote repo and pushing...\e[0m"
    if ! gh repo create "$repo_name" --"$visibility" --source=. --remote=origin --push; then
        echo -e "\e[31m✗ Error creating the remote repo.\e[0m"
        return 1
    fi

    echo -e "\e[32m✓ Remote repo created and linked successfully!\e[0m"
    echo -e "Repository: $(git remote get-url origin)"
    return 0
    fi

    # CASE 2: New repo - full creation
    if [ -d "$repo_name" ]; then
        echo -e "\e[31m✗ Error: The directory '$repo_name' already exists in $(pwd)\e[0m"
        return 1
    fi

    echo -e "\nCreating local directory: $repo_name"
    mkdir -p "$repo_name"
    cd "$repo_name" || { echo -e "\e[31m✗ Error: Unable to access the directory.\e[0m"; return 1; }

    # Git init
    git init
    git branch -M main
    git config user.name "$git_name"
    git config user.email "$git_email"

    # Initial commit
    echo "# $repo_name" > README.md
    git add README.md
    git commit -m "Initial commit"

    # Create remote repo
    echo -e "\nCreating remote repo on GitHub..."
    if ! gh repo create "$repo_name" --"$visibility" --source=. --remote=origin --push; then
        echo -e "\e[31m✗ Error creating the remote repo.\e[0m"
        return 1
    fi

    echo -e "\e[32m✓ Local and remote repos created successfully!\e[0m"
    echo -e "Repository: $(git remote get-url origin)"
    echo -e "Local path: $(pwd)"
}

# Delete a remote and/or local repo (Github CLI)
git-delete-repo() {
    # Validate arguments
    if [ $# -ne 2 ]; then
        echo -e "\e[33mUsage: git-delete-repo <repo name> <local|remote|both>\e[0m"
        return 1
    fi

    local repo_name="$1"
    local delete_type="$2"

    if [[ "$delete_type" != "local" && "$delete_type" != "remote" && "$delete_type" != "both" ]]; then
        echo -e "\e[31m✗ Error: delete type must be 'local', 'remote' or 'both'.\e[0m"
        return 1
    fi

    echo -e "\e[33m=== Warning: This operation is irreversible! ===\e[0m"
    echo -e "\e[33mYou are about to delete the repo '$repo_name' with mode '$delete_type'.\e[0m"
    echo -e "\e[33mDo you confirm this action? (y/n)\e[0m"
    read -r confirmation

    if [[ ! "$confirmation" =~ ^[Yy]$ ]]; then
        echo -e "\e[32mOperation cancelled by user.\e[0m"
        return 0
    fi

    # Determine full remote name
    local remote_full="$repo_name"
    if [[ "$repo_name" != */* ]]; then
        local gh_user
        gh_user=$(gh api user --jq .login 2>/dev/null) || gh_user=""
        if [ -n "$gh_user" ]; then
            remote_full="$gh_user/$repo_name"
        fi
    fi

    # Delete remote repo
    if [[ "$delete_type" == "remote" || "$delete_type" == "both" ]]; then
        echo -e "\nDeleting remote repo: $remote_full"
        if ! gh repo delete "$remote_full" --yes; then
            echo -e "\e[31m✗ Error deleting the remote repo.\e[0m"
            echo -e "\e[33mIf the error is permission-related, refresh scopes:\e[0m"
            echo -e "\e[34m> gh auth refresh -h github.com -s delete_repo\e[0m"
            echo -e "\e[34m  or verify whether the remote repo exists and you have rights to delete it.\e[0m"
            # Do not exit here if local deletion is still requested
            if [[ "$delete_type" == "remote" ]]; then
                return 1
            fi
        else
            echo -e "\e[32m✓ Remote repo deleted successfully!\e[0m"
        fi
    fi

    # Delete local repo if requested
    if [[ "$delete_type" == "local" || "$delete_type" == "both" ]]; then
        echo -e "\nSearching for local repos named '$repo_name'..."
        mapfile -t matches < <(\find ~ -type d -iname "$repo_name" -exec test -d "{}/.git" \; -print 2>/dev/null)

        local selected_dir=""
        if [ ${#matches[@]} -gt 1 ]; then
            echo "Multiple local repos found:"
            select sel in "${matches[@]}"; do
                if [ -n "$sel" ]; then
                    selected_dir="$sel"
                    break
                else
                    echo -e "\e[31m✗ Invalid selection.\e[0m"
                fi
            done
        elif [ ${#matches[@]} -eq 1 ]; then
            selected_dir="${matches[0]}"
            echo "Repo found: $selected_dir"
        else
            echo -e "\e[33mNo local repo found via search.\e[0m"
            # Fallback: check current working directory
            if [ -d "$repo_name/.git" ]; then
                selected_dir="$repo_name"
                echo "✓ Repo found in current directory: $selected_dir"
            fi
        fi

        if [ -n "$selected_dir" ]; then
            echo "Deleting local directory: $selected_dir"
            rm -rf -- "$selected_dir"
            echo -e "\e[32m✓ Local directory deleted successfully!\e[0m"
        else
            echo -e "\e[31m✗ Error: No local repo '$repo_name' found.\e[0m"
            return 1
        fi
    fi

    echo -e "\n\e[32m✓ Operation completed successfully!\e[0m"
}

# Starship prompt initialization
eval "$(starship init bash)"

# === End of Bashrc Configurator additions ===

export PATH=/home/userdepinfo/.nimble/bin:$PATH

PATH="$HOME/.local/bin:$PATH"

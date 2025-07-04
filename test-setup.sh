#!/bin/bash

# Laptop Setup Validation Script
# Tests if dotfiles and development environment are configured correctly

# Don't exit on error, we want to continue testing
# set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test counters
TESTS_PASSED=0
TESTS_FAILED=0
TESTS_TOTAL=0

# Helper functions
print_header() {
    echo -e "\n${BLUE}=== $1 ===${NC}"
}

print_test() {
    echo -e "${YELLOW}Testing:${NC} $1"
    ((TESTS_TOTAL++))
}

print_pass() {
    echo -e "${GREEN}✓ PASS:${NC} $1"
    ((TESTS_PASSED++))
}

print_fail() {
    echo -e "${RED}✗ FAIL:${NC} $1"
    ((TESTS_FAILED++))
}

print_info() {
    echo -e "${BLUE}ℹ INFO:${NC} $1"
}

test_command() {
    local cmd="$1"
    local description="$2"
    
    print_test "$description"
    if command -v "$cmd" >/dev/null 2>&1; then
        local version=$(eval "$cmd --version 2>/dev/null | head -n1" || echo "Version unknown")
        print_pass "$cmd is installed ($version)"
    else
        print_fail "$cmd is not installed"
    fi
}

test_symlink() {
    local link_path="$1"
    local target_path="$2"
    local description="$3"
    
    print_test "$description"
    if [ -L "$link_path" ]; then
        local actual_target=$(readlink "$link_path")
        if [[ "$actual_target" == *"$target_path"* ]]; then
            print_pass "Symlink $link_path → $actual_target"
        else
            print_fail "Symlink $link_path points to wrong target: $actual_target (expected: *$target_path*)"
        fi
    else
        print_fail "Symlink $link_path does not exist"
    fi
}

test_file_exists() {
    local file_path="$1"
    local description="$2"
    
    print_test "$description"
    if [ -f "$file_path" ]; then
        print_pass "File exists: $file_path"
    else
        print_fail "File does not exist: $file_path"
    fi
}

test_directory_exists() {
    local dir_path="$1"
    local description="$2"
    
    print_test "$description"
    if [ -d "$dir_path" ]; then
        print_pass "Directory exists: $dir_path"
    else
        print_fail "Directory does not exist: $dir_path"
    fi
}

test_shell_default() {
    print_test "Default shell is zsh"
    if [[ "$SHELL" == *"zsh"* ]]; then
        print_pass "Default shell is zsh ($SHELL)"
    else
        print_fail "Default shell is not zsh ($SHELL)"
    fi
}

test_oh_my_zsh() {
    print_test "Oh My Zsh installation"
    if [ -d "$HOME/.oh-my-zsh" ]; then
        print_pass "Oh My Zsh is installed"
        
        # Test plugins
        local plugins_dir="$HOME/.oh-my-zsh/custom/plugins"
        test_directory_exists "$plugins_dir/zsh-autosuggestions" "zsh-autosuggestions plugin"
        test_directory_exists "$plugins_dir/zsh-syntax-highlighting" "zsh-syntax-highlighting plugin"
    else
        print_fail "Oh My Zsh is not installed"
    fi
}

test_git_config() {
    print_test "Git configuration"
    local git_name=$(git config --global user.name 2>/dev/null || echo "")
    local git_email=$(git config --global user.email 2>/dev/null || echo "")
    
    if [ -n "$git_name" ] && [ -n "$git_email" ]; then
        print_pass "Git configured: $git_name <$git_email>"
    else
        print_fail "Git not fully configured (missing name or email)"
    fi
}

test_ssh_key() {
    print_test "SSH key configuration"
    
    # Look for any private SSH key files in ~/.ssh
    local ssh_keys_found=false
    local key_files=""
    
    if [ -d "$HOME/.ssh" ]; then
        # Check for common SSH private key patterns with wildcards
        for key_pattern in id_rsa id_ed25519 id_ecdsa id_dsa; do
            for file in "$HOME/.ssh"/*"$key_pattern"; do
                if [ -f "$file" ] && [[ ! "$file" == *.pub ]]; then
                    ssh_keys_found=true
                    local basename_file=$(basename "$file")
                    if [[ ! "$key_files" == *"$basename_file"* ]]; then
                        key_files="$key_files $basename_file"
                    fi
                fi
            done
        done
        
        # Also check for any other files that might be SSH keys (without .pub extension)
        for file in "$HOME/.ssh"/*; do
            if [ -f "$file" ] && [[ ! "$file" == *.pub ]] && [[ ! "$file" == *config* ]] && [[ ! "$file" == *known_hosts* ]] && [[ ! "$file" == *authorized_keys* ]]; then
                # Check if it looks like a private key
                if head -n1 "$file" 2>/dev/null | grep -q "BEGIN.*PRIVATE KEY"; then
                    ssh_keys_found=true
                    local basename_file=$(basename "$file")
                    if [[ ! "$key_files" == *"$basename_file"* ]]; then
                        key_files="$key_files $basename_file"
                    fi
                fi
            fi
        done
    fi
    
    if [ "$ssh_keys_found" = true ]; then
        print_pass "SSH key(s) found:$key_files"
        
        # Test if any key is loaded in ssh-agent
        if ssh-add -l >/dev/null 2>&1; then
            print_pass "SSH key is loaded in ssh-agent"
        else
            print_fail "SSH key is not loaded in ssh-agent"
        fi
    else
        print_fail "No SSH key found in ~/.ssh"
    fi
}

test_python_environment() {
    print_test "Python environment (pyenv)"
    if command -v pyenv >/dev/null 2>&1; then
        local pyenv_version=$(pyenv version 2>/dev/null | cut -d' ' -f1)
        print_pass "pyenv is installed, current version: $pyenv_version"
        
        # Test if pipx is installed
        if command -v pipx >/dev/null 2>&1; then
            print_pass "pipx is installed"
        else
            print_fail "pipx is not installed"
        fi
    else
        print_fail "pyenv is not installed"
    fi
}

test_docker() {
    print_test "Docker installation"
    if command -v docker >/dev/null 2>&1; then
        local docker_version=$(docker --version 2>/dev/null)
        print_pass "Docker is installed ($docker_version)"
        
        # Test if user can run docker without sudo
        # Try with system socket if default doesn't work
        if docker ps >/dev/null 2>&1; then
            print_pass "Docker can run without sudo"
        elif DOCKER_HOST=unix:///var/run/docker.sock docker ps >/dev/null 2>&1; then
            print_pass "Docker can run without sudo"
        else
            print_fail "Docker requires sudo (user not in docker group?)"
        fi
    else
        print_fail "Docker is not installed"
    fi
}

test_kubernetes() {
    print_test "Kubernetes tools"
    test_command "kubectl" "kubectl command"
    
    if [ -d "$HOME/.krew" ]; then
        print_pass "kubectl krew is installed"
    else
        print_fail "kubectl krew is not installed"
    fi
}

test_terraform() {
    print_test "Terraform tools"
    test_command "terraform" "terraform command"
    
    if [ -d "$HOME/.tfenv" ]; then
        print_pass "tfenv is installed"
    else
        print_fail "tfenv is not installed"
    fi
}

test_google_cloud() {
    print_test "Google Cloud SDK"
    if [ -d "$HOME/Downloads/google-cloud-sdk" ] || [ -d "$HOME/google-cloud-sdk" ]; then
        print_pass "Google Cloud SDK directory exists"
        
        if command -v gcloud >/dev/null 2>&1; then
            print_pass "gcloud command is available"
        else
            print_fail "gcloud command is not in PATH"
        fi
    else
        print_fail "Google Cloud SDK is not installed"
    fi
}

test_vim_config() {
    print_test "Vim configuration"
    test_symlink "$HOME/.vimrc" "dotfiles/vim/.vimrc" ".vimrc symlink"
    test_symlink "$HOME/.vim" "dotfiles/vim/.vim" ".vim directory symlink"
}

test_zsh_config() {
    print_test "Zsh configuration files"
    test_symlink "$HOME/.zshrc" "dotfiles/zsh/.zshrc" ".zshrc symlink"
    test_symlink "$HOME/.zprofile" "dotfiles/zsh/.zprofile" ".zprofile symlink"
}

test_homebrew() {
    if [[ "$(uname -s)" == "Darwin" ]]; then
        print_test "Homebrew (macOS)"
        if command -v brew >/dev/null 2>&1; then
            print_pass "Homebrew is installed"
        else
            print_fail "Homebrew is not installed"
        fi
    else
        print_info "Skipping Homebrew test (not on macOS)"
    fi
}

test_nodejs() {
    print_test "Node.js environment"
    if command -v node >/dev/null 2>&1; then
        local node_version=$(node --version 2>/dev/null)
        print_pass "Node.js is installed ($node_version)"
        
        if command -v npm >/dev/null 2>&1; then
            print_pass "npm is available"
        else
            print_fail "npm is not available"
        fi
    else
        print_fail "Node.js is not installed"
    fi
}

test_ruby() {
    print_test "Ruby environment"
    if command -v ruby >/dev/null 2>&1; then
        local ruby_version=$(ruby --version 2>/dev/null)
        print_pass "Ruby is installed ($ruby_version)"
        
        if command -v rbenv >/dev/null 2>&1; then
            print_pass "rbenv is installed"
        else
            print_fail "rbenv is not installed"
        fi
    else
        print_fail "Ruby is not installed"
    fi
}

test_go() {
    print_test "Go environment"
    if command -v go >/dev/null 2>&1; then
        local go_version=$(go version 2>/dev/null)
        print_pass "Go is installed ($go_version)"
        
        if [ -n "$GOPATH" ]; then
            print_pass "GOPATH is set: $GOPATH"
        else
            print_fail "GOPATH is not set"
        fi
    else
        print_fail "Go is not installed"
    fi
}

# Main test execution
main() {
    echo -e "${BLUE}🔍 Laptop Setup Validation Script${NC}"
    echo -e "${BLUE}===================================${NC}"
    
    print_header "Shell and Terminal Configuration"
    test_shell_default
    test_oh_my_zsh
    test_zsh_config
    
    print_header "Dotfiles Configuration"
    test_vim_config
    
    print_header "Core Development Tools"
    test_command "git" "Git version control"
    test_git_config
    test_command "vim" "Vim editor"
    test_command "curl" "curl command"
    test_command "wget" "wget command"
    
    print_header "Security and SSH"
    test_ssh_key
    
    print_header "Programming Languages"
    test_python_environment
    test_nodejs
    test_ruby
    test_go
    
    print_header "Container and Orchestration"
    test_docker
    test_kubernetes
    
    print_header "Infrastructure Tools"
    test_terraform
    test_google_cloud
    
    print_header "Platform-Specific Tools"
    test_homebrew
    
    # Summary
    echo -e "\n${BLUE}=== Test Summary ===${NC}"
    echo -e "Tests run: $TESTS_TOTAL"
    echo -e "${GREEN}Passed: $TESTS_PASSED${NC}"
    echo -e "${RED}Failed: $TESTS_FAILED${NC}"
    
    if [ $TESTS_FAILED -eq 0 ]; then
        echo -e "\n${GREEN}🎉 All tests passed! Your laptop setup looks great!${NC}"
        exit 0
    else
        echo -e "\n${YELLOW}⚠️  Some tests failed. Consider running setup scripts or installing missing tools.${NC}"
        exit 1
    fi
}

# Run the main function
main "$@"

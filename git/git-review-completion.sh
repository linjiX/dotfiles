# shellcheck shell=bash
# `cur`, `cword` and `__git_cmd_idx` are set by Git's completion script before
# it calls `_git_review`.
# shellcheck disable=SC2154

# Completion for the custom `git review` command (bin/git-review).
# Shared by bash and zsh: both use Git's bash completion, which calls
# `_git_<subcommand>` for custom commands.

_git_review() {
    # Only the first argument after `review` is completed.
    ((cword - __git_cmd_idx > 1)) && return

    case "$cur" in
    -*)
        # Options come from `git review --git-completion-helper`.
        __gitcomp_builtin review
        ;;
    *)
        __gitcomp_nl "$(__git for-each-ref --format='%(refname:strip=3)' refs/remotes/origin |
            grep -vx HEAD)"
        ;;
    esac
}

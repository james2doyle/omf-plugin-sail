complete -c sail -s h -l help             -d 'Display this help message' -f
complete -c sail -s f -l file             -d 'Project name' -f
complete -c sail -s p -l project-name     -d 'Compose configuration files' -f
complete -c sail -l profile               -d 'Specify a profile to enable' -f
complete -c sail -l project-directory     -d 'Specify an alternate working directory' -f
complete -c sail -l env-file              -d 'Specify an alternate environment file' -f
complete -c sail -l ansi                  -d 'Control when to print ANSI control characters ("never"|"always"|"auto")' -f

function __sail_entries
    if test -e "./vendor/bin/sail"
        bash ./vendor/bin/sail --help | grep -A25 -o "Commands:.*" | string match -i -r '\s+.+?\s+' | string trim
    else
        set COLOR_Y "\033[0;33m"    # yellow
        set COLOR_RESET "\033[0m"
        set MESSAGE "Sail: missing sail command: composer require laravel/sail --dev"
        printf "%b" "$COLOR_Y\e0$MESSAGE$COLOR_RESET"
    end
end

complete -f -c sail -a '(__sail_entries)'

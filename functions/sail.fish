function sail -d "Laravel sail"
    if test -e "./vendor/bin/sail"
        bash ./vendor/bin/sail $argv
    else
        set COLOR_Y "\033[0;33m"    # yellow
        set COLOR_RESET "\033[0m"
        set MESSAGE "Sail: missing sail command: composer require laravel/sail --dev"
        printf "%b" "$COLOR_Y\e0$MESSAGE$COLOR_RESET"
    end
end

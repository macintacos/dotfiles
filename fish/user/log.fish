function log --description "Log something"
    set level $argv[1]
    set log_string (set_color normal)$argv[2]

    set levels info ok warn error

    if not contains $argv[1] $levels
        echo "You need to set a log level before you can do anything"
        return 1
    end

    if not string length -q $log_string
        echo "You need to provide a string to log"
        return 1
    end

    switch $level
        case info
            set -p log_string (set_color cyan)"[ INFO ]  "
        case ok
            set -p log_string (set_color green)"[ OK ]    "
        case warn
            set -p log_string (set_color yellow)"[ WARN ]  "
        case error
            set -p log_string (set_color red)"[ ERROR ] "
    end

    echo $log_string
end
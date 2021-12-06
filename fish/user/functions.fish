function mcd --description "Make the directory and then 'cd' into it."
    mkdir -p $argv[1] && cd $argv[1]
end
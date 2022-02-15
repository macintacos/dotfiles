function mcd --description "Make the directory and then 'cd' into it."
    mkdir -p $argv[1] && cd $argv[1]
end

function ch --description "Pipe cht.sh output to 'bat'"
    cht.sh "$argv" | bat --style=numbers,grid
end
# git-related functions
function cdg --description "'cd' to the top level of a git project"
    cd (git --rev-parse --show-top-level)
end

# git-related functions
function cdg --description "'cd' to the top level of a git project"
    cd (git --rev-parse --show-top-level)
end

function gst --description "Start Lazygit (and conditionally init branchless)"
    if not git sl &>/dev/null
        echo "Initializing git branchless before starting lazygit..."
        git branchless init
    end

    lazygit
end

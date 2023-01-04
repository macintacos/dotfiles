function kget
    if test (count $argv) -ne 2
        echo "USAGE: kget \"<deployments | pods>\" \"<glob>\""
        return 1
    end

    set -l resource "$argv[1]"
    set -l glob "$argv[2]"

    kubectl get $resource -o json | \
        jq -r ".items | map(select(.metadata.name | test(\"$glob\"))) | {kind: \"List\", items: .}" | \
        kubectl get -f -
end

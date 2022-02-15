# Handy scripts for mms

# The manifest_url is the URL you get from github when you've gone to
# - /server/src/webapp-mms/static/version_manifest
# and look at the raw JSON
function parse_manifest
    if test (count $argv) -ne 2
        echo "USAGE: parse_manifest \"<link>\" \"<version>\""
        return 1
    end
    set -l manifest_url ""$argv[1]""
    set -l mongodb_version ""$argv[2]""

    set -l manifest_version $mongodb_version"-ent"
    set -l url_version "/linux/mongodb-linux-x86_64-enterprise-rhel70-$mongodb_version.tgz"
    set -l manifest (curl "$manifest_url")

    set -l docs (echo $manifest | \
        jq '.versions[] | select(.name == "'(echo $manifest_version)'")' | \
        gron | rg -ziN "$url_version" | awk -F'.' '{print $2}' | uniq)

    set -l docs_we_care_about (echo $docs | string replace "[" "\[" | string replace "]" "\]")

    set -l filtered_docs (echo $manifest | \
        jq '.versions[] | select(.name == "'(echo $manifest_version)'")' | \
        gron | rg -ziN "$docs_we_care_about" | \
        gron --ungron | \
        jq '. | nonulls')

    echo $filtered_docs | jq
end
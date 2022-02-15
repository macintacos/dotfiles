function jira-open --description "Open Jira, using the current branch name as a parameter for the link to open"
    open "https://jira.mongodb.com/browse/"(git branch --show-current)
end

set jiraURL to "jira.mongodb.org"
tell application "Google Chrome"
	set currentURL to get URL of active tab of first window
end tell

if jiraURL is in currentURL then 
    set passed to currentURL
else
    set passed to ""
end if

return passed

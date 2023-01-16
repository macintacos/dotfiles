#!/usr/bin/env python3

# <xbar.title>Jira Tickets to Review</xbar.title>
# <xbar.desc>List + link to tickets that match the JQL specified in the configuration.</xbar.desc>
# <xbar.version>1.0.1</xbar.version>
# <xbar.author>Julian Torres</xbar.author>
# <xbar.author.github>macintacos</xbar.author.github>
# <xbar.dependencies>python</xbar.dependencies>
# <xbar.abouturl>https://jmt.dev</xbar.abouturl>

# PREFERENCES
# <xbar.var>string(VAR_JIRA_TOKEN=""): Jira OAuth Token.</xbar.var>
# <xbar.var>string(VAR_JIRA_TOKEN_SECRET=""): Jira OAuth Token Secret.</xbar.var>
# <xbar.var>string(VAR_JIRA_CONSUMER_KEY=""): Jira OAuth Consumer Key.</xbar.var>
# <xbar.var>string(VAR_JIRA_CERT_PATH=""): Path to Jira cert on disk.</xbar.var>
# <xbar.var>string(VAR_JIRA_SEARCH_QUERY=""): The JQL to use for returning results.</xbar.var>
# <xbar.var>string(VAR_XBAR_PLUGIN_PATH=""): The path to the xbar plugins.</xbar.var>

from __future__ import annotations

import os
import subprocess
import sys
from inspect import cleandoc

# Retry logic for installing jira into the current environment.
for attempt in range(3):
    try:
        from jira import JIRA
        from jira.resources import Issue, Project
    except ModuleNotFoundError:
        # Install dependencies if not found, then try again.
        subprocess.check_call(
            [sys.executable, "-m", "pip", "install", "--upgrade", "pip"],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.STDOUT,
        )
        subprocess.check_call(
            [sys.executable, "-m", "pip", "install", "jira", "pyjwt", "cryptography"],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.STDOUT,
        )
        continue

with open(os.getenv("VAR_JIRA_CERT_PATH", ""), "r") as cert_file:
    cert_data = cert_file.read()

jira = JIRA(  # type: ignore
    options={"server": "https://jira.mongodb.org"},
    oauth={
        "access_token": os.getenv("VAR_JIRA_TOKEN"),
        "access_token_secret": os.getenv("VAR_JIRA_TOKEN_SECRET"),
        "consumer_key": os.getenv("VAR_JIRA_CONSUMER_KEY"),
        "key_cert": cert_data,
    },
)

issues_to_review = jira.search_issues(os.getenv("VAR_JIRA_SEARCH_QUERY", ""))

print(
    cleandoc(
        f"""
        :book: {len(issues_to_review)} | font=MonoLisa-Regular
        ---
        Number of documents to review: {len(issues_to_review)} | font=MonoLisa-Regular | size=16 | href=https://jira.mongodb.org/issues/?filter=37814
        ---
        """
    )
)

links: list[str] = [
    f"param{idx + 1}=https://jira.mongodb.org/browse/{issue.key}"  # type: ignore
    for idx, issue in enumerate(issues_to_review)
]

print(
    f"Click here to open all review links in their own tabs! | shell={os.getenv('VAR_XBAR_PLUGIN_PATH', '')}/_open-jira-links.sh | {' '.join(links)}"
)
print("---")

compiled_issue_string: str = ""
seen_jira_projects: list[Project] = []
for issue in issues_to_review:
    if isinstance(issue, Issue):
        if issue.fields.project not in seen_jira_projects:
            seen_jira_projects.append(issue.fields.project)
            print(issue.fields.project)

    print(
        f":link: {issue.key} {issue.fields.summary} | length=50 | font=MonoLisa-Regular | href=https://jira.mongodb.org/browse/{issue.key}"  # type: ignore
    )

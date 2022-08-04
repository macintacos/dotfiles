#!/usr/bin/env python
"""Gets the list of PRs that are open for you."""
# -*- coding: utf-8 -*-

import os
from datetime import datetime
from logging import Logger

# <xbar.title>Github review requests</xbar.title>
# <xbar.desc>Shows a list of PRs that need to be reviewed</xbar.desc>
# <xbar.version>v0.1</xbar.version>
# <xbar.author>Julian Torres</xbar.author>
# <xbar.author.github>macintacos</xbar.author.github>
# <xbar.image></xbar.image>
# <xbar.dependencies>python</xbar.dependencies>
from multiprocessing.sharedctypes import Value
from pathlib import Path

from sh import Command

import _log

log: Logger = _log.logging.getLogger(__name__)

ACCESS_TOKEN: str | None = os.getenv("GITHUB_TOKEN")
GITHUB_LOGIN = "macintacos"
TIMESTAMP_FILENAME = "./gh-review-check-timestamp.txt"

gh = Command("gh")


def update_list_of_repos(org: str) -> None:
    # NOTE: A bunch of this should probably be stripped out into their own methods
    # TODO: Check the timestamp
    # TODO: Check for existence of the gh-list.json file
    # TODO: json.load the json file after it is parsed (if it doesn't exist, just assume you have to update)
    # TODO: iterate over the json data to figure out what repositories we have to check
    # TODO: Iterate over those repos and check for what PRs exist there (use `gh` to filter out only things that you are assigned to)
    # TODO: Once we have that, make sure we know the status of the PR - if it's a draft, it should be formatted differently
    # TODO: Format the output string that is sent to the terminal. It should look something like: './assets/CleanShot Terminal 2022-02-14 at 17.37.00.png'
    pass


def timestamp_check() -> bool:
    time_to_update = False

    new_timestamp: int = int(datetime.utcnow().timestamp())
    old_timestamp: int = get_timestamp_of_last_check()
    day_in_secs = 86_400

    if new_timestamp - old_timestamp >= day_in_secs:
        # Update the timestamp file with the new time, we gotta do a check!
        time_to_update = True
        with open(TIMESTAMP_FILENAME, "w") as ts_file:
            ts_file.write(str(new_timestamp))

    return time_to_update


def get_timestamp_of_last_check() -> int:
    timestamp_file = Path(TIMESTAMP_FILENAME)
    timestamp_file.touch(exist_ok=True)
    old_timestamp: int = 0

    with open(TIMESTAMP_FILENAME, "r") as ts_file:
        try:
            old_timestamp = int(ts_file.readline())
        except ValueError:
            old_timestamp = 0

    return old_timestamp


def main() -> None:
    orgs_to_check: list[str] = ["10gen", "xgen-cloud"]
    for org in orgs_to_check:
        update_list_of_repos(org)
    pass


if __name__ == "__main__":
    main()

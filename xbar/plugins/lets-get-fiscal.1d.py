#!/usr/bin/env python3

# NOTE: This gets run with the Python from XCode, NOT with pyenv. I don't believe
#       there's a way to change this. As such, this plugin will install a module
#       automatically to compensate for having an unreliable environment.

# <xbar.title>Fiscal Year Generator</xbar.title>
# <xbar.desc>Gets the current MongoDB fiscal year and presents it to the user.</xbar.desc>
# <xbar.version>v0.1</xbar.version>
# <xbar.author>Julian Torres</xbar.author>
# <xbar.author.github>macintacos</xbar.author.github>
# <xbar.dependencies>python</xbar.dependencies>
# <xbar.abouturl>https://jmt.dev</xbar.abouturl>

# PREFERENCES
# <xbar.var>string(VAR_CURRENT_PLAN_LINK="https://docs.google.com/spreadsheets/u/0/?tgif=c&q=Cloud%20Team%20Quarterly%20Plan"): Link to the current quarterly plan.</xbar.var>

from __future__ import annotations

import os
import subprocess
import sys
from datetime import date
from inspect import cleandoc
from typing import Literal, Optional

# Retry logic for installing dateutil into the current environment.
for attempt in range(3):
    try:
        from dateutil.relativedelta import relativedelta
    except ModuleNotFoundError:
        # Install python-dateutil if not found, then try again.
        subprocess.call(
            [sys.executable, "-m", "pip", "install", "python-dateutil"],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.STDOUT,
        )
        continue

ValidQuarters = Optional[Literal["Q1", "Q2", "Q3", "Q4"]]


def get_fiscal_quarter(target: date) -> ValidQuarters:
    current_month: int = target.month

    if current_month in [2, 3, 4]:
        return "Q1"
    elif current_month in [5, 6, 7]:
        return "Q2"
    elif current_month in [8, 9, 10]:
        return "Q3"
    elif current_month in [11, 12, 1]:
        return "Q4"
    else:
        return


def get_fiscal_year(target: date) -> str:
    current_year: int = target.year

    fiscal_quarter: ValidQuarters
    if fiscal_quarter := get_fiscal_quarter(target):
        # We have a valid fiscal quarter
        if fiscal_quarter == "Q4":
            current_month = target.month
            if current_month == 1:  # It's January, keep the year.
                pass
            else:  # It's Nov/Dec, add the year
                current_year += 1

        else:  # This handles all other quarters
            current_year += 1

    return f"FY{current_year}"


def get_fiscal_year_and_quarter(target: date) -> str:
    return f"{get_fiscal_year(target)}{get_fiscal_quarter(target)}"


def get_date_range_for_fiscal_quarter(fiscal_year_quarter: str) -> Optional[str]:
    # Some light validation for the string passed in.
    if not fiscal_year_quarter.startswith("FY"):
        return None

    # fmt: off
    (fy_string, year, quarter) = (
        fiscal_year_quarter[:2],       # FY
        int(fiscal_year_quarter[2:6]),  # 20XX
        fiscal_year_quarter[6:],      # QX
    )
    # fmt: on

    if quarter == "Q4":  # Special case, since the year is "split"
        begin = f"{year - 1}-11-01"
        end = f"{year}-01-31"

    # The other quarters are straightforward.
    elif quarter == "Q3":
        begin = f"{year - 1}-08-01"
        end = f"{year - 1}-10-31"
    elif quarter == "Q2":
        begin = f"{year - 1}-05-01"
        end = f"{year - 1}-07-31"
    else:
        begin = f"{year - 1}-02-01"
        end = f"{year - 1}-04-31"

    return f"{begin} to {end}"


def get_next_quarters(num_quarters: int) -> list[str]:
    """Get the next quarters, starting from the one we are currently in.

    The list returned is already ordered.
    """
    fiscal_list: list[str] = []
    target_date: date = date.today()  # Start with today.
    fyXXXX_qX: str = get_fiscal_year_and_quarter(target_date)

    for _ in range(num_quarters):
        fiscal_list.append(fyXXXX_qX)
        target_date += relativedelta(months=3)  # Jumps to next quarter.
        fyXXXX_qX = get_fiscal_year_and_quarter(target_date)

    return fiscal_list


def main():
    next_five_quarters: list[str] = get_next_quarters(5)
    q1, q2, q3, q4, q5 = next_five_quarters

    # Generate the final menu
    print(
        cleandoc(
            f"""
            {q1} | font=MonoLisa-Regular
            ---
            :link: Current Plan ({q1}) | font=MonoLisa-Regular | href={os.getenv("VAR_CURRENT_PLAN_LINK")}
            ---
            Next 4 FYQs | font=MonoLisa-Bold | size=16
            ---
            {q2} -> ({get_date_range_for_fiscal_quarter(q2)}) | font=MonoLisa-Regular | size=14 | color=red
            {q3} -> ({get_date_range_for_fiscal_quarter(q3)}) | font=MonoLisa-Regular | size=14 | color=yellow
            {q4} -> ({get_date_range_for_fiscal_quarter(q4)}) | font=MonoLisa-Regular | size=14 | color=green
            {q5} -> ({get_date_range_for_fiscal_quarter(q5)}) | font=MonoLisa-Regular | size=14 | color=green
            """
        )
    )


if __name__ == "__main__":
    main()

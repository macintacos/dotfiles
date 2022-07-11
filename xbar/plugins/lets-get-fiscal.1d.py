#!/usr/bin/env python3

# <xbar.title>Fiscal Year Generator</xbar.title>
# <xbar.desc>Gets the current fiscal year/quarter and presents it to the user, as well as other goodies.</xbar.desc>
# <xbar.version>v1.0</xbar.version>
# <xbar.author>Julian Torres</xbar.author>
# <xbar.author.github>macintacos</xbar.author.github>
# <xbar.dependencies>python</xbar.dependencies>
# <xbar.abouturl>https://jmt.dev</xbar.abouturl>

# PREFERENCES
# <xbar.var>string(VAR_CURRENT_PLAN_LINK="https://docs.google.com/spreadsheets/u/0/?tgif=c&q=Cloud%20Team%20Quarterly%20Plan"): Link to the current quarterly plan.</xbar.var>
# <xbar.var>string(VAR_Q1_MONTHS="2,3,4"): Months that are in Q1 (valid values are numbers, comma-separated, where January = 1 and December = 12)</xbar.var>
# <xbar.var>string(VAR_Q2_MONTHS="5,6,7"): Months that are in Q2 (valid values are numbers, comma-separated, where January = 1 and December = 12)</xbar.var>
# <xbar.var>string(VAR_Q3_MONTHS="8,9,10"): Months that are in Q3 (valid values are numbers, comma-separated, where January = 1 and December = 12)</xbar.var>
# <xbar.var>string(VAR_Q4_MONTHS="11,12,1"): Months that are in Q4 (valid values are numbers, comma-separated, where January = 1 and December = 12)</xbar.var>

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

# Environment Variables from xBar (defined above)
# fmt: off
Q1_MONTHS: list[int] = [int(q.strip()) for q in os.getenv("VAR_Q1_MONTHS", "2,3,4").split(",")]
Q2_MONTHS: list[int] = [int(q.strip()) for q in os.getenv("VAR_Q2_MONTHS", "5,6,7").split(",")]
Q3_MONTHS: list[int] = [int(q.strip()) for q in os.getenv("VAR_Q3_MONTHS", "8,9,10").split(",")]
Q4_MONTHS: list[int] = [int(q.strip()) for q in os.getenv("VAR_Q4_MONTHS", "11,12,1").split(",")]
# fmt: on

# If there aren't 12 entries _or_ there are duplicates, reject early.
if (
    len(Q1_MONTHS + Q2_MONTHS + Q3_MONTHS + Q4_MONTHS)
    != len(set(Q1_MONTHS + Q2_MONTHS + Q3_MONTHS + Q4_MONTHS))
    or len(Q1_MONTHS + Q2_MONTHS + Q3_MONTHS + Q4_MONTHS) != 12
):
    raise Exception(
        "Issue initializing fiscal plugin. Review quarterly month preferences."
    )


def get_fiscal_quarter(target: date) -> ValidQuarters:
    """Gets the fiscal quester for the given date."""
    current_month: int = target.month

    if current_month in Q1_MONTHS:
        return "Q1"
    elif current_month in Q2_MONTHS:
        return "Q2"
    elif current_month in Q3_MONTHS:
        return "Q3"
    elif current_month in Q4_MONTHS:
        return "Q4"
    else:
        return


def get_fiscal_year(target: date) -> str:
    """Gets the fiscal year for the given date."""
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
    """Generates the fiscal year string, in the form of 'FY<year>Q<quarter>'."""
    return f"{get_fiscal_year(target)}{get_fiscal_quarter(target)}"


def get_date_range_for_fiscal_quarter(
    fiscal_year_quarter: str,
) -> tuple[str, str]:
    """Gets the date range as a tuple for the given fiscal year string.

    Args:
        fiscal_year_quarter (str): An FY string, i.e. 'FY2022Q3'

    Returns:
        tuple[str, str]: A tuple containing the beginning end end dates for the given FY
            string passed in.
    """
    # Some light validation for the string passed in.
    if not fiscal_year_quarter.startswith("FY"):
        raise Exception("String provided did not start with 'FY', somehow.")

    # fmt: off
    (year, quarter) = (
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
    else:  # Q1
        begin = f"{year - 1}-02-01"
        end = f"{year - 1}-04-31"

    return (begin, end)


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


def get_weeks_to_next_quarter(quarter_beginning_iso_string: str) -> int:
    """For the given ISO string, it tells you how many weeks away you are from that quarter beginning."""
    today: date = date.today()
    (year, month, day) = quarter_beginning_iso_string.split("-")
    next_quarter_beginning = date(int(year), int(month), int(day))

    return (next_quarter_beginning - today).days // 7


def main():
    next_five_quarters: list[str] = get_next_quarters(5)
    q1, q2, q3, q4, q5 = next_five_quarters

    # Get the quarter range messages
    q2_msg: str = " to ".join(get_date_range_for_fiscal_quarter(q2))
    q3_msg: str = " to ".join(get_date_range_for_fiscal_quarter(q3))
    q4_msg: str = " to ".join(get_date_range_for_fiscal_quarter(q4))
    q5_msg: str = " to ".join(get_date_range_for_fiscal_quarter(q5))

    # Getting the weeks until the next quarter for presentation later.
    next_quarter_begin, _ = get_date_range_for_fiscal_quarter(q2)
    weeks_until_quarter: int = get_weeks_to_next_quarter(next_quarter_begin)
    weeks_until_quarter_msg: str = (
        f"In {weeks_until_quarter} weeks" if weeks_until_quarter != 0 else "Next week!"
    )

    # Generate the final menu
    print(
        cleandoc(
            f"""
            {q1} | font=MonoLisa-Regular
            ---
            :link: Current Plan ({q1}) | size=14 | font=MonoLisa-Regular | href={os.getenv("VAR_CURRENT_PLAN_LINK")}
            ---
            Next 4 Fiscal Quarters | font=MonoLisa-Bold | size=16 | href=https://jira.mongodb.org/issues/?jql=labels%20in%20({q2},{q3},{q4},{q5})%20ORDER%20BY%20updated%20DESC
            ---
            :link: {q2} -> ({q2_msg}) [{weeks_until_quarter_msg}] | font=MonoLisa-Regular | color={"red" if weeks_until_quarter <= 6 else "green"} | href=https://jira.mongodb.org/issues/?jql=labels%20in%20({q2})%20ORDER%20BY%20updated%20DESC
            :link: {q3} -> ({q3_msg}) [In {weeks_until_quarter + 12} weeks] | font=MonoLisa-Regular | href=https://jira.mongodb.org/issues/?jql=labels%20in%20({q3})%20ORDER%20BY%20updated%20DESC
            :link: {q4} -> ({q4_msg}) [In {weeks_until_quarter + 24} weeks] | font=MonoLisa-Regular | href=https://jira.mongodb.org/issues/?jql=labels%20in%20({q4})%20ORDER%20BY%20updated%20DESC
            :link: {q5} -> ({q5_msg}) [In {weeks_until_quarter + 36} weeks] | font=MonoLisa-Regular | href=https://jira.mongodb.org/issues/?jql=labels%20in%20({q5})%20ORDER%20BY%20updated%20DESC
            """
        )
    )


if __name__ == "__main__":
    main()

"""The command line of the spending tracker."""

import argparse

from rich.console import Console

from .report import category_table, report_lines
from .storage import read_ledger


def main():
    parser = argparse.ArgumentParser(description="Report on the purchases in a CSV file.")
    parser.add_argument("filename", help="the CSV file that holds the purchases")
    parser.add_argument("--month", help="report on one month only, for example 2026-02")
    parser.add_argument("--category", help="report on one category only, for example food")
    parser.add_argument("--table", action="store_true", help="show the totals for each category as a table")
    args = parser.parse_args()

    ledger = read_ledger(args.filename).select(month=args.month, category=args.category)
    Console().print(category_table(ledger))

"""Reading the purchases from a CSV file."""

import csv
from decimal import Decimal

from .models import Ledger, Purchase


def read_ledger(filename: str) -> Ledger:
    ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            purchase = Purchase(
                row["date"], row["description"], Decimal(row["amount"]), row["category"]
            )
            ledger.add(purchase)
    return ledger

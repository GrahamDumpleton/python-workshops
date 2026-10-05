"""The spending tracker: purchases, a ledger that holds them, and a file reader."""

import argparse
import csv
from dataclasses import dataclass
from decimal import Decimal


@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        return self.date[:7]


class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = Decimal("0")
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, Decimal("0")) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), Decimal("0")) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def select(self, month=None, category=None):
        result = Ledger()
        for purchase in self.purchases:
            if category is None or purchase.category == category:
                result.add(purchase)
        return result


def read_ledger(filename):
    ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            purchase = Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"])
            ledger.add(purchase)
    return ledger


def report_lines(ledger):
    lines = [f"Purchases: {len(ledger.purchases)}"]
    if not ledger.purchases:
        return lines
    lines.append(f"Total: {ledger.total():.2f}")
    lines.append("")
    lines.append("Total for each category:")
    for category, amount in ledger.total_by_category().items():
        lines.append(f"  {category}: {amount:.2f}")
    lines.append("")
    lines.append("Total for each month:")
    for month, amount in ledger.total_by_month().items():
        lines.append(f"  {month}: {amount:.2f}")
    lines.append("")
    largest = ledger.largest()
    lines.append(f"Largest purchase: {largest.date} {largest.description} {largest.amount:.2f}")
    return lines


def main():
    parser = argparse.ArgumentParser(description="Report on the purchases in a CSV file.")
    parser.add_argument("filename", help="the CSV file that holds the purchases")
    args = parser.parse_args()

    ledger = read_ledger(args.filename)
    for line in report_lines(ledger):
        print(line)


if __name__ == "__main__":
    main()

"""The purchases of the spending tracker, and the ledger that holds them."""

from dataclasses import dataclass
from decimal import Decimal


@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        return self.date[:4]


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
            month_fits = month is None or purchase.month() == month
            category_fits = category is None or purchase.category == category
            if month_fits and category_fits:
                result.add(purchase)
        return result

from decimal import Decimal

from spending.models import Ledger, Purchase


def make_ledger():
    ledger = Ledger()
    ledger.add(Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food"))
    ledger.add(Purchase("2026-01-05", "Bus ticket", Decimal("2.80"), "transport"))
    ledger.add(Purchase("2026-02-02", "Vegetables", Decimal("9.10"), "food"))
    return ledger


def test_month_is_the_first_seven_characters_of_the_date():
    purchase = Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
    assert purchase.month() == "2026-01"


def test_total_adds_up_every_amount():
    assert make_ledger().total() == Decimal("18.30")


def test_total_of_an_empty_ledger_is_zero():
    assert Ledger().total() == Decimal("0")

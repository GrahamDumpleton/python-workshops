from decimal import Decimal

from spending.models import Purchase


def test_month_is_the_first_seven_characters_of_the_date():
    purchase = Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
    assert purchase.month() == "2026-01"

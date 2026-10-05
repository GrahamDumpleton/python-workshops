from decimal import Decimal

from spending.models import Purchase

purchase = Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
assert purchase.month() == "2026-01"
print("The test passed.")

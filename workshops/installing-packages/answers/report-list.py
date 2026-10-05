"""The spending report, as lines of text and as a table."""

from rich.table import Table


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


def category_table(ledger):
    lines = []
    for category, amount in ledger.total_by_category().items():
        lines.append(f"{category} {amount:.2f}")
    lines.append(f"All {ledger.total():.2f}")
    return lines

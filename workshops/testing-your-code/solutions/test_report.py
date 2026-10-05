from spending.models import Ledger
from spending.report import report_lines


def test_report_of_an_empty_ledger_has_one_line():
    assert report_lines(Ledger()) == ["Purchases: 0"]

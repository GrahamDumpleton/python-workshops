from tabulate import tabulate

prices = [["tea", 3], ["soup", 4], ["bread", 2]]
print(tabulate(prices, headers=["item", "price"]))

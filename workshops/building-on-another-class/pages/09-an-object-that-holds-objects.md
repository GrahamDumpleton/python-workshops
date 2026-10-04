---
title: An object that holds objects
requires: [verify:receipt-made, verify:receipt-total]
---

# An object that holds objects

Inheritance is one way to build on a class that you have. There is a
second way, and it is used more often. **Composition** means that an
object holds other objects as its attributes.

You already know that an attribute can be a string or a number. An
attribute can be any value. So it can also be an object of another
class, or a list of such objects.

## Why composition exists

On 2026-01-20, Mariam's file of spending has the line
`Fruit and eggs`, with the amount `9.85`. At the market, she got a
receipt: a paper that lists each product and its price. The receipt
has three products on it.

A receipt is not a kind of product, and a product is not a kind of
receipt. So inheritance does not describe them. The true sentence is:
a receipt has products. One thing holds other things.

Think of a shopping bag with three things in it. The bag is one
thing, and it holds other things. You can ask the bag what is in it,
and you can put one more thing in.

## The code

Click the action below. It adds a cell with two classes. A `Product`
has a name and a price. A `Receipt` has the name of a shop, and a
list of products.

```{attempt}
:id: receipt-not-made
:check: receipt-made
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-receipt
:title: Add a cell with the classes Product and Receipt, and run it
:path: {{ notebook }}
:tags: [receipt]
:run: true
class Product:
    def __init__(self, name, price):
        self.name = name
        self.price = price

class Receipt:
    def __init__(self, shop):
        self.shop = shop
        self.products = []

    def add(self, product):
        self.products.append(product)

receipt = Receipt("Green market")
receipt.add(Product("Apples", Decimal("3.20")))
receipt.add(Product("Bananas", Decimal("2.15")))
receipt.add(Product("Eggs", Decimal("4.50")))
print(receipt.shop)
print(len(receipt.products))
print(receipt.products[0].name)
print(receipt.products[0].price)
```

The output is:

```
Green market
3
Apples
3.20
```

```{verify}
:id: receipt-made
:label: The cell made a receipt that holds three products
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed receipt
if isinstance(globals().get("Product"), type) and isinstance(getattr(globals().get("receipt"), "products", None), list) and len(globals()["receipt"].products) == 3:
    print("The cell ran. The object receipt holds a list of three objects of the class Product.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("Product"), type) and isinstance(getattr(globals().get("receipt"), "products", None), list) and len(globals()["receipt"].products) == 3
```

## What happened

Neither class has a name in parentheses after its own name. Neither
class is a child class. They are two separate classes.

- The method `__init__` of `Receipt` makes two attributes. `shop` is
  the string that the call gives. `products` starts as an empty list,
  `[]`. Every new receipt gets a new empty list of its own.

- The method `add()` takes one product and appends it to the list of
  this receipt. `append()` is the method of a list that adds an item
  to its end.

- `Product("Apples", Decimal("3.20"))` makes a product. The cell
  makes three products, and gives each one to `receipt.add()`.

- `receipt.products` is the list. `receipt.products[0]` is the first
  item of the list, which is a `Product`. So
  `receipt.products[0].name` is the name of the first product. Read
  such a line from left to right, one dot at a time.

The receipt does not copy the code of `Product`, and it does not
become a product. It holds products, and it uses them.

## Your task

A receipt must be able to say what everything on it costs together.
Write a method of the class `Receipt` with the name `total`. It has
one parameter, `self`. It returns the prices of all the products of
the receipt, added together.

| The receipt holds | The call | The return value |
|-------------------|----------|------------------|
| products with the prices `3.20`, `2.15` and `4.50` | `market.total()` | `9.85` |
| no products | `empty.total()` | `0` |

Inside the method, start a name `result` at `Decimal("0")`. Use a
`for` loop over `self.products`. Each item of that list is a
`Product`, and its price is the attribute `price`. Add each price to
`result`.

The method must return the value. It must not print it.

Click the action below. It adds a cell that holds the class `Receipt`
as it is now, with a comment that marks the place for your method.
Under the class, the cell makes a receipt again, with the name
`market`. It makes a new object because the cell makes the class
again, and the object `receipt` from before still belongs to the old
class.

```{cell-insert}
:id: insert-receipt-total
:title: Add a cell with the class Receipt, for my method
:path: {{ notebook }}
:tags: [receipt-total]
:run: false
class Receipt:
    def __init__(self, shop):
        self.shop = shop
        self.products = []

    def add(self, product):
        self.products.append(product)

    # Write the method total below this line.


market = Receipt("Green market")
market.add(Product("Apples", Decimal("3.20")))
market.add(Product("Bananas", Decimal("2.15")))
market.add(Product("Eggs", Decimal("4.50")))
print(market.total())
```

Click on the empty line under the comment, and type your method. Its
`def` line begins with four spaces, and its body begins with eight
spaces. Then run the cell: hold `Shift` and press `Enter`.

When your method is correct, the output under the cell is:

```
9.85
```

That is the amount in Mariam's file.

````{hint}
:title: Hint: the shape of the method
The method has the same shape as a function that adds up a total. The
differences are the four spaces before `def`, the parameter `self`,
and the list, which is `self.products`:

```python
    def total(self):
        result = Decimal("0")
        for product in self.products:
            # The line that adds one price goes here.
        return result
```
````

````{hint}
:title: Hint: the line inside the loop
Inside the loop, the name `product` refers to one `Product`. Its
price is `product.price`. The line begins with twelve spaces:

```python
            result = result + product.price
```
````

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: receipt-total-not-started
:check: receipt-total
:expect: has no method total yet
```

````{attempt}
:id: receipt-total-outside
:check: receipt-total
:expect: is outside the class

```{cell-insert}
:path: {{ notebook }}
:run: true
class Receipt:
    def __init__(self, shop):
        self.shop = shop
        self.products = []

    def add(self, product):
        self.products.append(product)

def total(self):
    result = Decimal("0")
    for product in self.products:
        result = result + product.price
    return result
```
````

````{attempt}
:id: receipt-total-methods-removed
:check: receipt-total
:expect: The check could not make a receipt

```{cell-insert}
:path: {{ notebook }}
:run: true
class Receipt:
    def total(self):
        result = Decimal("0")
        for product in self.products:
            result = result + product.price
        return result
```
````

````{attempt}
:id: receipt-total-no-self
:check: receipt-total
:expect: has no parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
class Receipt:
    def __init__(self, shop):
        self.shop = shop
        self.products = []

    def add(self, product):
        self.products.append(product)

    def total():
        result = Decimal("0")
        for product in products:
            result = result + product.price
        return result
```
````

````{attempt}
:id: receipt-total-two-parameters
:check: receipt-total
:expect: must have one parameter only

```{cell-insert}
:path: {{ notebook }}
:run: true
class Receipt:
    def __init__(self, shop):
        self.shop = shop
        self.products = []

    def add(self, product):
        self.products.append(product)

    def total(self, products):
        result = Decimal("0")
        for product in products:
            result = result + product.price
        return result
```
````

````{attempt}
:id: receipt-total-stops
:check: receipt-total
:expect: stopped with a NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
class Receipt:
    def __init__(self, shop):
        self.shop = shop
        self.products = []

    def add(self, product):
        self.products.append(product)

    def total(self):
        result = Decimal("0")
        for product in products:
            result = result + product.price
        return result
```
````

````{attempt}
:id: receipt-total-prints
:check: receipt-total
:expect: shows the result with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
class Receipt:
    def __init__(self, shop):
        self.shop = shop
        self.products = []

    def add(self, product):
        self.products.append(product)

    def total(self):
        result = Decimal("0")
        for product in self.products:
            result = result + product.price
        print(result)
```
````

````{attempt}
:id: receipt-total-no-return
:check: receipt-total
:expect: gives nothing back

```{cell-insert}
:path: {{ notebook }}
:run: true
class Receipt:
    def __init__(self, shop):
        self.shop = shop
        self.products = []

    def add(self, product):
        self.products.append(product)

    def total(self):
        result = Decimal("0")
        for product in self.products:
            result = result + product.price
```
````

````{attempt}
:id: receipt-total-early-return
:check: receipt-total
:expect: That is the price of the first product only

```{cell-insert}
:path: {{ notebook }}
:run: true
class Receipt:
    def __init__(self, shop):
        self.shop = shop
        self.products = []

    def add(self, product):
        self.products.append(product)

    def total(self):
        result = Decimal("0")
        for product in self.products:
            result = result + product.price
            return result
```
````

````{attempt}
:id: receipt-total-last-only
:check: receipt-total
:expect: That is the price of the last product only

```{cell-insert}
:path: {{ notebook }}
:run: true
class Receipt:
    def __init__(self, shop):
        self.shop = shop
        self.products = []

    def add(self, product):
        self.products.append(product)

    def total(self):
        result = Decimal("0")
        for product in self.products:
            result = product.price
        return result
```
````

````{attempt}
:id: receipt-total-count
:check: receipt-total
:expect: but it must give 9.85

```{cell-insert}
:path: {{ notebook }}
:run: true
class Receipt:
    def __init__(self, shop):
        self.shop = shop
        self.products = []

    def add(self, product):
        self.products.append(product)

    def total(self):
        return len(self.products)
```
````

````{attempt}
:id: receipt-total-fixed
:check: receipt-total
:expect: The method must work for every receipt

```{cell-insert}
:path: {{ notebook }}
:run: true
class Receipt:
    def __init__(self, shop):
        self.shop = shop
        self.products = []

    def add(self, product):
        self.products.append(product)

    def total(self):
        return Decimal("9.85")
```
````

````{attempt}
:id: receipt-total-other-way
:check: receipt-total
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
class Receipt:
    def __init__(self, shop):
        self.shop = shop
        self.products = []

    def add(self, product):
        self.products.append(product)

    def total(self):
        result = 0
        for item in self.products:
            result += item.price
        return result
```
````

````{hint}
:title: Show me a solution
:unlock: "receipt-total" in failed_checks or "receipt-total" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds the
whole class with a working method, and the action runs it. Compare it
with your own cell.

```{cell-insert}
:id: insert-receipt-total-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [receipt-total-solution]
:run: true
class Receipt:
    def __init__(self, shop):
        self.shop = shop
        self.products = []

    def add(self, product):
        self.products.append(product)

    def total(self):
        result = Decimal("0")
        for product in self.products:
            result = result + product.price
        return result

market = Receipt("Green market")
market.add(Product("Apples", Decimal("3.20")))
market.add(Product("Bananas", Decimal("2.15")))
market.add(Product("Eggs", Decimal("4.50")))
print(market.total())
```
````

```{verify}
:id: receipt-total
:label: Your method total returns the prices of a receipt added together
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed receipt-total; cell-executed receipt-total-solution
def _workshop_check():
    import contextlib, decimal, inspect, io
    cls = globals().get("Receipt")
    item = globals().get("Product")
    prices = (("3.20", "2.15", "4.50"), (), ("5.00",))
    made = []
    try:
        with contextlib.redirect_stdout(io.StringIO()):
            for group in prices:
                inspect.signature(cls).bind("Corner shop")
                thing = cls("Corner shop")
                for price in group:
                    thing.add(item("Tea", decimal.Decimal(price)))
                if len(thing.products) != len(group):
                    raise ValueError("products")
                made.append(thing)
    except Exception:
        print("The check could not make a receipt and add products to it. Keep the methods __init__ and add of the class Receipt as they were given, and write your method under them. If the class Product does not exist, go to the top of this page and click the first action again. Then run your cell again.")
        return False
    method = getattr(cls, "total", None)
    if not callable(method):
        if callable(globals().get("total")):
            print("There is a function total, but it is outside the class, so it is not a method of Receipt. A method is inside the class: its def line begins with four spaces, and its body begins with eight spaces. Add the spaces, and run the cell again.")
        else:
            print("The class Receipt has no method total yet. Write the method under the comment in the new cell. Its first line is def total(self): with four spaces before it. Then hold Shift and press Enter to run the cell.")
        return False
    try:
        count = len(inspect.signature(method).parameters)
    except (TypeError, ValueError):
        count = 1
    if count == 0:
        print("The method total has no parameter. Every method needs self as its first parameter, because Python gives the object to the method as self. Write def total(self): and use self.products in the body. Then run the cell again.")
        return False
    if count > 1:
        print(f"The method total has {count} parameters, but it must have one parameter only, which is self. The list of products is not a parameter: the method reads it from the object, as self.products. Write def total(self): and run the cell again.")
        return False
    results = []
    printed = []
    for thing, group in zip(made, prices):
        output = io.StringIO()
        try:
            with contextlib.redirect_stdout(output):
                results.append(thing.total())
        except Exception as error:
            kind = type(error).__name__
            article = "an" if kind[0] in "AEIOU" else "a"
            found = "no products" if len(group) == 0 else f"{len(group)} products"
            print(f"The call total() on a receipt with {found} stopped with {article} {kind}. Read the last line of the error message under your cell. Inside the method, the list is self.products, and the price of one product is product.price. Start with result = Decimal(\"0\"), so that the method also works for a receipt with no products. Correct the body, and run the cell again.")
            return False
        printed.append(output.getvalue().strip())
    def value(result):
        if isinstance(result, (int, float, decimal.Decimal)) and not isinstance(result, bool):
            return round(float(result), 2)
        return None
    def show(result):
        return str(result) if value(result) is not None else repr(result)
    values = [value(result) for result in results]
    if values == [9.85, 0.0, 5.0]:
        print("Correct. For a receipt with the prices 3.20, 2.15 and 4.50, your method gives 9.85. For a receipt with no products it gives 0. The receipt uses the objects that it holds.")
        return True
    if results[0] is None and printed[0] in ("9.85",):
        print("The method total shows the result with print(), but it does not return it. The code that calls the method receives nothing. Replace the print() line in the body with return result. Then run the cell again.")
        return False
    if results[0] is None:
        print("The call total() gives nothing back. The method needs a line that begins with the word return, after the loop: return result. Then run the cell again.")
        return False
    if values[0] == 3.2:
        print("For a receipt with the prices 3.20, 2.15 and 4.50, your method gives 3.20. That is the price of the first product only. The return line must come after the loop, and not inside it: it begins with eight spaces. Then run the cell again.")
        return False
    if values[0] == 4.5:
        print("For a receipt with the prices 3.20, 2.15 and 4.50, your method gives 4.50. That is the price of the last product only. Inside the loop, add each price to the result: result = result + product.price. Then run the cell again.")
        return False
    if values[0] == 9.85:
        other = f"for a receipt with no products it gives {show(results[1])} and it must give 0" if values[1] != 0.0 else f"for a receipt with one product of 5.00 it gives {show(results[2])} and it must give 5.00"
        print(f"For a receipt with the prices 3.20, 2.15 and 4.50, your method gives 9.85, which is correct. But {other}. The method must work for every receipt: use a loop over self.products. Then run the cell again.")
        return False
    print(f"For a receipt with the prices 3.20, 2.15 and 4.50, your method gives {show(results[0])} but it must give 9.85. Start with result = Decimal(\"0\"), and inside a loop over self.products add product.price to result. Then run the cell again.")
    return False
globals().pop("_workshop_check")()
```

Your class `Receipt` has no parent class, and it still builds on
another class. It holds objects of the class `Product`, and its
method `total()` uses the attribute `price` of each one.

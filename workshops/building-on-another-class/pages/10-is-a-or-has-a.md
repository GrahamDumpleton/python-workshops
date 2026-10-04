---
title: Is a, or has a?
requires: [quiz:choose-playlist, quiz:choose-bicycle, quiz:choose-shop]
---

# Is a, or has a?

You now know two ways to build a class from classes that you have.
This page gives you a rule for choosing between them. This page has
no code to run.

## The rule

Say the two names in a sentence, in two ways.

- "A subscription **is a** purchase." When the sentence with "is a"
  is true, inheritance fits. The new class is a special kind of the
  other class. You write `class Subscription(Purchase):`.

- "A receipt **has** products." When the sentence with "has a" or
  "has" is true, composition fits. The new class holds objects of the
  other class in an attribute. You write
  `self.products = []` in the method `__init__`.

For inheritance, there is a second test. Everything that the parent
class can do must also make sense for the child class. A subscription
has a date, an amount and a month, as every purchase has. So the test
passes.

When you are not sure, choose composition. A class that holds an
object uses only the parts of it that it needs. A child class gets
everything that its parent class has, also the parts that do not fit.

## Where inheritance is the wrong choice

A receipt has a total, and a product has a price. Both are amounts of
money. Someone could think: "A receipt needs a name and a price too,
so I make it a child class of `Product` and I get those attributes
without writing them." The class would begin like this:

```python
class Receipt(Product):
```

Python accepts this line, and it is still a mistake. Say the
sentence: "A receipt is a product." It is not true. And the mistake
has results:

- Every receipt would need a `name` and a `price` when it is made,
  because the method `__init__` of `Product` asks for them. A receipt
  has no single price.

- `isinstance(receipt, Product)` would be `True`. Code that counts
  the products in a shop would count the receipts as well.

- A receipt still needs a list of products. So the receipt would be a
  product and also hold products, which is confusing.

Inheritance is not a way to get attributes without writing them. It
is a way to say that one thing is a special kind of another thing.

## Three questions

For each question, say the sentence with "is a" and the sentence with
"has", and decide which one is true.

```{quiz}
:id: choose-playlist
:title: A playlist and its songs
question: "A music program has a class `Song`. It needs a class `Playlist`: a list of songs with a name, chosen by one person. Which way fits?"
options:
  - { text: "Inheritance, `class Playlist(Song):`, because a playlist is a song", explanation: "Say the sentence: \"A playlist is a song.\" It is not true. A song has one title and one length. A playlist holds many songs." }
  - { text: "Composition, an attribute such as `self.songs = []`, because a playlist has songs", correct: true }
explanation: "\"A playlist has songs\" is the true sentence, so composition fits. The class `Playlist` holds a list of `Song` objects in an attribute, in the same way as a `Receipt` holds a list of `Product` objects."
```

```{quiz}
:id: choose-bicycle
:title: A bicycle with a motor
question: "A program for a shop has a class `Bicycle`, with a price, a colour and a method `describe()`. It needs a class `ElectricBicycle`, which has all of that and also the size of its battery. Which way fits?"
options:
  - { text: "Inheritance, `class ElectricBicycle(Bicycle):`, because an electric bicycle is a bicycle", correct: true }
  - { text: "Composition, an attribute such as `self.bicycles = []`, because an electric bicycle has bicycles", explanation: "Say the sentence: \"An electric bicycle has bicycles.\" It is not true. An electric bicycle is one bicycle, of a special kind." }
explanation: "\"An electric bicycle is a bicycle\" is the true sentence, and everything that a bicycle can do makes sense for an electric bicycle. So inheritance fits. The child class has a method `__init__` of its own, which calls `super().__init__(...)` and then keeps the size of the battery."
```

```{quiz}
:id: choose-shop
:title: A purchase and its shop
question: "You have a class `Shop`, with the attributes `name` and `city`. You want every purchase to know the shop that it came from. Which way fits?"
options:
  - { text: "Composition: a purchase has a shop, so the class `Purchase` gets an attribute `shop` that holds a `Shop` object", correct: true }
  - { text: "Inheritance, `class Purchase(Shop):`, because a purchase then gets the attributes `name` and `city`", explanation: "A purchase would get the two attributes, but say the sentence: \"A purchase is a shop.\" It is not true. Inheritance is not a way to get attributes without writing them." }
explanation: "\"A purchase has a shop\" is the true sentence, so composition fits. The method `__init__` of `Purchase` would keep the shop in an attribute, `self.shop = shop`, and the code would read the city as `purchase.shop.city`."
```

In a real program you often use both. The spending tracker can have
child classes of `Purchase`, and also one object that holds all the
purchases. You build that object in the next workshop.

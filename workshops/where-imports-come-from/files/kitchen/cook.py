import sys

import recipe

print("The first place is", sys.path[0])
print(recipe.title, "needs", recipe.flour_in_grams, "grams of flour")

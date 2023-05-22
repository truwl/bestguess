import random

foo = random.sample(range(1, 100), k=4)
maxProd=0
for x in range(0,len(foo)):
    for y in foo:
        if x != y:
            if x*y > maxProd:
                maxProd = x*y

print(f"{foo} maxProd: {maxProd}")
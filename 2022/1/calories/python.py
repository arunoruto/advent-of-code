import requests

with open('input.txt', 'r') as f:
    data = f.read()

items = [[int(y) for y in x.split('\n')] for x in data.split('\n\n')]
sums = sorted([sum(x) for x in items], reverse=True)
print('Largest backpack:   ', sums[0])
print('Top three:          ', sums[:3])
print('Total of top three: ', sum(sums[:3]))
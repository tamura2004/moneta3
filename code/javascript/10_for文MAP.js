const animals = new Map([['dog', 1], ['cat', 2]]);

console.log(animals);

for (let [key, value] of animals) {
  console.log(`${key}: ${value}`);
}
animals.set('dog', 3);
console.log(animals.get('dog'))
const animals = [
  'dog',
  'cat',
  'rat',
  'rabbit',
  'camel',
  'donkey',
];

const index = animals.reduce((a,animal) => {
  const initial = animal[0];
  const group = a.get(initial) || [];
  group.push(animal);
  return a.set(initial, group);
}, new Map());

console.log(index);

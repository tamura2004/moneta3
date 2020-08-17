const addprimes = [
  (n) => n + 2,
  (n) => n + 3,
  (n) => n + 5,
  (n) => n + 7,
];

const x = addprimes[2](10);
console.log(x);
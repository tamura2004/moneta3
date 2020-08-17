const a = ['a', 'b', 'c'];

console.log("# index")

for (let i = 0; i < a.length; i++) {
  console.log(`${i}: ${a[i]}`)
}

console.log("# of")

for (const x of a) {
  console.log(x);
}

console.log("# with index")

for (const [i,x] of a.entries()) {
  console.log(`${i}: ${x}`)
}
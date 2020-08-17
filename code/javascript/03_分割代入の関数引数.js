function partial([a, b, ...rest]) {
  console.log(`a:${a}`);
  console.log(`b:${b}`);
  console.log(`rest:${rest}`);
}

partial([1,2,3,4,5]);

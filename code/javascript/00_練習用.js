const { stdout } = process;
const { log } = console;

for (let i = 1; i <= 10; i++) {
  stdout.write(`${i} little `);
  if (i % 3 === 0) log("indians.");
}

log("indian boys.");

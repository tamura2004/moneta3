const timeout = async (sec, fn) =>
  resolve =>
    setTimeout(()=> {
      fn();
      resolve();
    }, sec * 1000);


const main = async () => {
  // xをゼロにする
  let x = 0;

  // 3秒待つ
  await timeout(3, x += 10);

  // xを表示する
  console.log(x);
}

main();
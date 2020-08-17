const sleep = (s, fn) => setTimeout(fn, s * 1000);

const main = () => {
  // xをゼロにする
  let x = 0;

  // 3秒待って、xに10を加える
  sleep(3, () => x += 10);

  // xを表示する
  console.log(x);
}
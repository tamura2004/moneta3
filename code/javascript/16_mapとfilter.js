const { log } = console;

const dic = new Map([
  [1, 'ハート'],
  [2, 'ダイヤ'],
  [3, 'スペード'],
  [4, 'クラブ'],
]);

const data = [1, 3, 3, 4, 2, 5, 2];

const mark = data.map((n) => dic.get(n));

log('map');
log(mark);

const red = mark.filter((m) => m === 'ハート' || m === 'ダイヤ');

log('filter');
log(red);
log(red.length);
const { log } = console;

const a = [];

a.push(1); //末尾から追加
a.push(2);

log('push');
log(a);

a.unshift(3); //先頭から追加
a.unshift(4);

log('unshift');
log(a);

let b = a.pop(); //末尾から取り出し

log('pop');
log(a);
log(b);

b = a.shift(); //先頭から取り出し

log('shift');
log(a);
log(b);
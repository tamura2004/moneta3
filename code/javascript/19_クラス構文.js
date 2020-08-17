class Bank {
  constructor(name, num) {
    this.name = name;
    this.num = num;
  }

  get label() {
    return ('0000' + this.num).slice(-4) + ' ' + this.name + '銀行';
  }

  add(other) {
    return new Bank(this.name + other.name, this.num + other.num);
  }
}

const meguro = new Bank('目黒', 1);
const gotanda = new Bank('五反田', 2);

const newbank = meguro.add(gotanda);

console.log(meguro.label);
console.log(gotanda.label);
console.log(newbank.label);
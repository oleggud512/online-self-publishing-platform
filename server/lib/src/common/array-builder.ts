declare global {
  interface Array<T> {
    add(...items: T[]): Array<T>
    addAll(...items: T[]): Array<T>
  }
}

Array.prototype.add = function<T>(item: T): Array<T> {
  this.push(item)
  return this
};

Array.prototype.addAll = function<T>(...items: T[]): Array<T> {
  for (const item of items) {
    this.push(item)
  }
  return this;
};

export {}
declare global {
  interface Array<T> {
    add(...items: T[]): Array<T>
    addIf(cond: boolean, ...items: T[]) : Array<T>
  }
}

// Array.prototype.add = function<T>(item: T): Array<T> {
//   this.push(item)
//   return this
// };

Array.prototype.add = function<T>(...items: T[]): Array<T> {
  for (const item of items) {
    this.push(item)
  }
  return this
};

Array.prototype.addIf = function<T>(cond: boolean, ...items: T[]) : Array<T> {
  if (cond) return this.add(items)
  return this
}

export {}
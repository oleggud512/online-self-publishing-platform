declare global {
  interface Date {
    add(milliseconds: number): Date;
    subtract(milliseconds: number): Date;
    addYears(years: number): Date;
    subtractYears(years: number): Date;
    addMonths(months: number): Date;
    subtractMonths(months: number): Date;
    addDays(days: number): Date;
    subtractDays(days: number): Date;
    addHours(hours: number): Date;
    subtractHours(hours: number): Date;
    addMinutes(minutes: number): Date;
    subtractMinutes(minutes: number): Date;
    addSeconds(seconds: number): Date;
    subtractSeconds(seconds: number): Date;
  }
}

Date.prototype.add = function (milliseconds: number): Date {
  const newDate = new Date(this.getTime() + milliseconds);
  this.setTime(newDate.getTime());
  return this;
};

Date.prototype.subtract = function (milliseconds: number): Date {
  const newDate = new Date(this.getTime() - milliseconds);
  this.setTime(newDate.getTime());
  return this;
};

Date.prototype.addYears = function (years: number): Date {
  const newYear = this.getFullYear() + years;
  this.setFullYear(newYear);
  return this;
};

Date.prototype.subtractYears = function (years: number): Date {
  return this.addYears(-years);
};

Date.prototype.addMonths = function (months: number): Date {
  const newMonth = this.getMonth() + months;
  const yearsToAdd = Math.floor(newMonth / 12);
  const newYear = this.getFullYear() + yearsToAdd;
  const newMonthInYear = newMonth % 12;
  this.setFullYear(newYear);
  this.setMonth(newMonthInYear);
  return this;
};

Date.prototype.subtractMonths = function (months: number): Date {
  return this.addMonths(-months);
};

Date.prototype.addDays = function (days: number): Date {
  const newDate = new Date(this.getTime() + days * 24 * 60 * 60 * 1000);
  this.setTime(newDate.getTime());
  return this;
};

Date.prototype.subtractDays = function (days: number): Date {
  return this.addDays(-days);
};

Date.prototype.addHours = function (hours: number): Date {
  const newDate = new Date(this.getTime() + hours * 60 * 60 * 1000);
  this.setTime(newDate.getTime());
  return this;
};

Date.prototype.subtractHours = function (hours: number): Date {
  return this.addHours(-hours);
};

Date.prototype.addMinutes = function (minutes: number): Date {
  const newDate = new Date(this.getTime() + minutes * 60 * 1000);
  this.setTime(newDate.getTime());
  return this;
};

Date.prototype.subtractMinutes = function (minutes: number): Date {
  return this.addMinutes(-minutes);
};

Date.prototype.addSeconds = function (seconds: number): Date {
  const newDate = new Date(this.getTime() + seconds * 1000);
  this.setTime(newDate.getTime());
  return this;
};

Date.prototype.subtractSeconds = function (seconds: number): Date {
  return this.addSeconds(-seconds);
};

export {}
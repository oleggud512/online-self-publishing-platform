export function parseBool(b: string) {
  switch (b) {
    case 'true': return true;
    case 'false': return false;
  }
  throw `${b} is incorrect`
}
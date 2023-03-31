export function parseBool(b: string) {
  switch (b) {
    case 'true': return true;
    case 'false': return false;
  }
  throw `${b} is incorrect`
}

export function tryParseBool(b: string | undefined) : boolean | undefined {
  try {
    return parseBool(b!)
  } catch (e) {
    return undefined
  }
}
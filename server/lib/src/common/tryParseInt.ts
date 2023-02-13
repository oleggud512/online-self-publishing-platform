export function tryParseInt(i: string | undefined) : number | undefined {
  if (!i) return;
  return parseInt(i)
}
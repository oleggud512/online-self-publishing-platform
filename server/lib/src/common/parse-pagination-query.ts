import { tryParseInt } from "./tryParseInt"

export function parsePaginationQuery(obj: any) : { from: number, pageSize: number } {
  console.log(`parsePaginationQuery from=${obj.from} pageSize=${obj.pageSize}`);
  const from = tryParseInt(obj.from as string | undefined) ?? 0
  const pageSize = tryParseInt(obj.pageSize as string | undefined) ?? 20
  console.log({ from, pageSize })
  return { from, pageSize }
}
type Result<T> = [T | null, any]

export async function promise<T>(
  promise: Promise<T>
) : Promise<Result<T>> {
  try {
    return [await promise, null]
  } catch (error) {
    return [null, error]
  }
}

export async function promiseBuilder<T>(builder: () => Promise<T>) : Promise<Result<T>> {
  try {
    const result = await builder()
    return [result, null]
  } catch (error) {
    return [null, error]
  }
}

export function sync<In extends any[], Out>(
  func: (...args: In) => Out,
  ...params: In
) : Result<Out> {
  try {
    return [func(...params), null]
  } catch (error) {
    return [null, error]
  }
}


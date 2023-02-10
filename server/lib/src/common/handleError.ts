import { ErrorRequestHandler, NextFunction, Request, Response } from "express"

export async function guard(res: Response, func: () => void) : Promise<void> {
  try {
    console.log('trying')
    await func()
    console.log('trying - ok')
  } catch (err) {
    console.log('trying - fail')
    handleError(res, err)
  }
}

export function handleError(res: Response, err: any) {
  console.log('handling error')
  const response = {error: true, message: `${err.code} - ${err.message}`}
  res.status(500).json(response)
  console.log(`error handled - response sent - ${JSON.stringify(response)}`)
  console.log(`print the error:`)
  console.log(err)
  // throw err
}

export async function guardianMiddleware(req: Request, res: Response, next: NextFunction) {
  await guard(res, next);
}


export function handleErrorMiddleware(
  error: Error, 
  req: Request, 
  res: Response, 
  next: NextFunction
) {
  console.error(error)
  res.status(500).json({error: error})
  next(error)
}
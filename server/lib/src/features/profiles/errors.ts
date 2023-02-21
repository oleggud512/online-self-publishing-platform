import { AppError } from "../../common/app-error";

export class CannotSubscribeYourself extends AppError {
  constructor() {
    super('cannotSubscribeYourself')
  }
}
import * as cron from "node-cron"
import * as notificationService from "./src/features/notifications/service"
import * as restrictionService from "./src/features/restrictions/service"
import * as bookService from "./src/features/books/service"

export function scheduleTasks() {
  const exp = "0 0 10 12 * *" // каждого двенадцатого числа месяца, в 10:00
  cron.schedule(exp, (now) => {
    console.log(`execute scheduled`)
    notificationService.deleteDeadFCMTokens()
  })

  cron.schedule('0 0 9 * * 1', (now) => { // каждый понедельник в 9:00
    restrictionService.deleteOutdatedRestrictions()
  })

  cron.schedule('0 0 12 * * *', (now) => {
    bookService.syncScore()
  })
}

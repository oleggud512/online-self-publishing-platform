import * as cron from "node-cron"
import * as notificationService from "./src/features/notifications/service"
import * as restrictionsService from "./src/features/restrictions/service"

export function scheduleTasks() {
  const exp = "0 0 10 12 * *" // каждого двенадцатого числа месяца, в 10:00
  cron.schedule(exp, (now) => {
    console.log(`execute scheduled`)
    notificationService.deleteDeadFCMTokens()
  })

  cron.schedule('0 0 9 * * 1', (now) => { // каждый понедельник в 9:00
    restrictionsService.deleteOutdatedRestrictions()
  })

}
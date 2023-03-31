export enum NotificationType {
  newChapter = 'newChapter',
  bookUnpublished = 'bookUnpublished',
  reportRejected = 'reportRejected',
  subscribed = 'subscribed',
  commentAnswer = 'commentAnswer'
}

export type NotificationData = {
  notificationType: NotificationType
  book?: string
  chapter?: string
}

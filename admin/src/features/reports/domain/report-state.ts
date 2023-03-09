export class ReportState {
  static pending = "pending"
  static inProgress = "inProgress"
  static closed = "closed"

  static get values() {
    return [ReportState.pending, ReportState.inProgress, ReportState.closed]
  }
}

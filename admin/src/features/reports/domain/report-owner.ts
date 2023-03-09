export class ReportOwner {
  static my = 'my'
  static all = 'all'

  static get values() {
    return [ReportOwner.my, ReportOwner.all]
  }
}
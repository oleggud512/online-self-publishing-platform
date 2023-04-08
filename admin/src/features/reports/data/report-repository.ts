import { HttpClient } from "aurelia-fetch-client";
import qs from 'querystring'
import { Action, MessageAction, Report } from "../domain/report";
import { ReportFilters } from "../domain/report-filters";

class CantAddMessage extends Error { }

export class ReportRepository {
  constructor(private client: HttpClient) { }


  async getReports(filters: ReportFilters, from: number = 0, pageSize: number = 20) {
    const q = qs.stringify(filters)
    const page = qs.stringify({from, pageSize})

    console.log(q)
    const resp = await this.client.fetch(`reports?${q}&${page}`, {
      method: 'GET',
    })
    const json = await resp.json()
    console.log(json)

    const reports = (json.data as any[]).map((r) => new Report(r))
    console.log(reports)
    return reports
  }


  async getReport(reportId: string) {
    const resp = await this.client.fetch(`reports/${reportId}`, {
      method: 'GET'
    })
    const json = await resp.json()
    console.log({getReport: json})
    return new Report(json.data)
  }


  async takeReport(reportId: string) {
    const resp = await this.client.patch(`reports/${reportId}/take`)
    const json = await resp.json()
    return new Report(json.data)
  }


  async closeReport(reportId: string) {
    const resp = await this.client.patch(`reports/${reportId}/close`)

    const json = await resp.json()
    return new Report(json.data)
  }

  async rejectReport(reportId: string) {
    const resp = await this.client.patch(`reports/${reportId}/reject`)

    const json = await resp.json()
    return new Report(json.data)
  }

  async openReport(reportId: string) {
    const resp = await this.client.patch(`reports/${reportId}/open`)
    
    const json = await resp.json()
    return new Report(json.data)
  }

  async sendMessage(content: string, reportId: string) {
    try {
      const resp = await this.client.fetch(`reports/${reportId}/messages`, {
        method: 'POST',
        body: JSON.stringify({content})
      })
      const json = await resp.json()
      console.log()
      return new MessageAction(json.data)
    } catch (e) {
      console.error(e)
    }
  }
}

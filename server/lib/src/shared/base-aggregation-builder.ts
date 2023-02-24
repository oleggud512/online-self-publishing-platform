import { Aggregate, Model, PipelineStage } from "mongoose"
import { Profile } from '../features/profiles/Profile'
import * as baseUtils from "./base-aggregation-utils"

export class BaseAggregationBuilder {
  protected aggregation: Aggregate<any[]>


  constructor(model: Model<any>) {
    this.aggregation = model.aggregate()
  }

  page(from: number, pageSize: number = 20) { 
    this.aggregation.append(
      ...baseUtils.page(from, pageSize)
    )
    return this
  }

  sort(obj: PipelineStage.Sort["$sort"]) {
    this.aggregation.sort(obj)
    return this
  }

  build() {
    return this.aggregation
  }
}
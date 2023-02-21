import { Aggregate, Model, PipelineStage } from "mongoose"
import { Profile } from '../features/profiles/Profile'

export class BaseAggregationBuilder {
  protected aggregation: Aggregate<any[]>


  constructor(model: Model<any>) {
    this.aggregation = model.aggregate()
  }

  page(from: number, pageSize: number = 20) { 
    this.aggregation
      .skip(from)
      .limit(pageSize)
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
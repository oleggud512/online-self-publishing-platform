import { PipelineStage } from "mongoose";

export type LookupPipeline = 
  Exclude<PipelineStage.Lookup["$lookup"]["pipeline"], undefined>
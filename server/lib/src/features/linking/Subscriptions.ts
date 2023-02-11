import { Schema, model, Types } from "mongoose";

export interface ISubscriptions {
	profile: string;
	subscribedTo: string;
}

const SubscriptionsSchema = new Schema({
	profile: { type: String, ref: "Profile", required: true },
	subscribedTo: { type: String, ref: "Profile", required: true }
}, {
	timestamps: true
});

export const Subscriptions = model<ISubscriptions>("Subscriptions", SubscriptionsSchema);
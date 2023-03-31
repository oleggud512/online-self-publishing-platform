import { BehaviorSubject, Subscription } from "rxjs";
import { EventEmitter } from "stream";

export class PubSubEvent { }

export class PubSub {
  private subject = new BehaviorSubject<PubSubEvent>(new PubSubEvent())

  on<T extends PubSubEvent>(on: new (...args: any[]) => T, callback: (event: T) => void) : Subscription {
    return this.subject.subscribe((event) => {
      if (event instanceof on) {
        callback(event as T)
      }
    })
  }

  emit<T extends PubSubEvent>(value: T) {
    this.subject.next(value)
  }
}
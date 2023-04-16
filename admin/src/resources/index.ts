import {FrameworkConfiguration, PLATFORM} from 'aurelia-framework'
import { HttpClient, Interceptor } from 'aurelia-fetch-client'
import * as firebase from "firebase/app"
import { ReportRepository } from 'features/reports/data/report-repository';
import { AuthInterceptor } from 'features/authentication/data/auth-interceptor';
import en from '../locales/en/translation.json'
import uk from '../locales/uk/translation.json'
import i18next from 'i18next';
import { BookRepository } from 'features/books/data/book-repository';
import { ProfileRepository } from 'features/profiles/data/profile-repository';
import { CommentRepository } from 'features/comments/data/comment-repository';
import { PubSub } from 'shared/pub-sub';
import { ChapterRepository } from 'features/chapters/data/chapter-repository';
import firebaseConfig from './firebase-config'


type Loc = {
  pending: string
  inProgress: string
  closed: string
}


export function configure(config: FrameworkConfiguration): void {
  //config.globalResources([]);
  // config.globalResources([SanitizeHTMLValueConverter]);
  config.globalResources([PLATFORM.moduleName('./elements/loading-indicator')])

  firebase.initializeApp(firebaseConfig)

  const curLocale = localStorage.getItem('curLocale')
  i18next.init<Loc>({
    lng: curLocale,
    resources: {
      en: { translation: en },
      uk: { translation: uk },
    },
  })

  config.container.registerSingleton(HttpClient, () => {
    return new HttpClient().configure(conf => {
      conf.baseUrl = "http://127.0.0.1:3000/api/v1/"
      conf.withInterceptor(new AuthInterceptor())
    })
  })
  config.container.registerSingleton(ReportRepository, () => {
    return new ReportRepository(config.container.get(HttpClient))
  })
  config.container.registerSingleton(BookRepository, () => {
    return new BookRepository(config.container.get(HttpClient))
  })
  config.container.registerSingleton(ProfileRepository, () => {
    return new ProfileRepository(config.container.get(HttpClient))
  })
  config.container.registerSingleton(CommentRepository, () => {
    return new CommentRepository(config.container.get(HttpClient))
  })
  config.container.registerSingleton(ChapterRepository, () => {
    return new ChapterRepository(config.container.get(HttpClient))
  })
  config.container.registerSingleton(PubSub, () => new PubSub())
  console.log('init')
}


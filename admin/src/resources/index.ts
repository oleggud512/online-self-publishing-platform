import {FrameworkConfiguration} from 'aurelia-framework'
import { HttpClient, Interceptor } from 'aurelia-fetch-client'
import * as firebase from "firebase/app"
import { ReportRepository } from 'features/reports/data/report-repository';
import { AuthInterceptor } from 'features/authentication/data/auth-interceptor';
import en from '../locales/en/translation.json'
import uk from '../locales/uk/translation.json'
import i18next from 'i18next';


type Loc = {
  pending: string
  inProgress: string
  closed: string
}

export function configure(config: FrameworkConfiguration): void {
  //config.globalResources([]);
  const firebaseConfig = {
    apiKey: "AIzaSyBQx-7ZGkxi08pNR4exenZEcn-zjBCtUco",
    authDomain: "books-course-work-1.firebaseapp.com",
    projectId: "books-course-work-1",
    storageBucket: "books-course-work-1.appspot.com",
    messagingSenderId: "626801727731",
    appId: "1:626801727731:web:78e469f28cd128b3f03f86",
    measurementId: "G-16HR47WC9Z"
  };
  
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
  console.log('init')
}

/*
// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyBQx-7ZGkxi08pNR4exenZEcn-zjBCtUco",
  authDomain: "books-course-work-1.firebaseapp.com",
  projectId: "books-course-work-1",
  storageBucket: "books-course-work-1.appspot.com",
  messagingSenderId: "626801727731",
  appId: "1:626801727731:web:78e469f28cd128b3f03f86",
  measurementId: "G-16HR47WC9Z"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
*/
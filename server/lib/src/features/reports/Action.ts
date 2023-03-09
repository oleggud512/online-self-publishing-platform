import { Document, Schema, model, Types } from "mongoose";

/*
// тут мне не нужно делать to, потому что я буду различать админа и пользователя 
// по report. 
message: 
  _id: 
  report:
  author:
  content:
  createdAt: 


add-book:
  _id: 
  report:
  author:
  content: 
  createdAt:

  book: 

edit-book:
  _id: 
  report:
  author:
  content: 
  createdAt:

  book:

update-book: 
  _id: 
  report:
  author:
  content: // может указывать на то что глава была обновлена + какая именно.  
  createdAt:

  book:

update-chapter:
  _id: 
  report:
  author:
  content: 
  createdAt:

  chapter:

actionType = updateBook
1. обновление описания / имени / обложки книги
2. добавление главы
3. изменение главы
4. удаление главы
5. публикация главы
6. сокрытие главы

actionType = updateProfile

1. обновление описания / имени / пола / возраста / аватари профиля

2. добавление книги
4. удаление книги
5. публикация книги
6. сокрытие книги
1. обновление описания книги

  2. добавление главы
  3. изменение главы
  4. удаление главы
  5. публикация главы
  6. сокрытие главы

теперь мы видим, что если приходит жалоба на профиль то мы отслеживаем
ВСЕ action
также мы видим, что если пришла жалоба на книгу то мы отслеживаем только 
updateBook actions (без updateProfile)

нихуя мы не отслеживаем если это коммент. 

Поскольку если коммент плохой, мы не можем его временно скрыть и попросить 
пользователя его изменить. Мы можем только удалить его здесь и сейчас. 
Пользователь будет уведомлен. 

так, всего получается 13 типов, которые можно, наверно, как-то объединить в подтипы


- - - - - ВСЕ ACTIONS - - - - - 

updateProfile - обновление контента профиля

addBook - добавление книги
updateBook - обновление контента книги
deleteBook - удаление книги
publishBook - публикация книги
unpublishBook - сокрытие книги

addChapter - добавление главы в книгу 
updateChapter - изменения в контенте / имени главы конкретной книги
deleteChapter - удаление конкретной главы конкретной книги
publishChapter - публикация главы
unpublishChapter - сокрытие главы

ага, всего 11. 

каждый из них легко встраивается в метод сервиса



в жалобе книги нужно отслеживать:
updateBook - обновление контента книги
deleteBook - удаление книги - когда книга удаляется, жалоба закрывается. 
publishBook - публикация книги
unpublishBook - сокрытие книги - когда удаляется с публикации пользователем, то жалоба удаляется через 3 дня... нет. так не годится. 

addChapter - добавление главы в книгу 
updateChapter - изменения в контенте / имени главы конкретной книги
deleteChapter - удаление конкретной главы конкретной книги
publishChapter - публикация главы
unpublishChapter - сокрытие главы

в жалобе профиля
отслеживаем все. 


короче, можно сделать так чтобы пользователь 10 подумал прежде чем 
самостоятельно убирать книгу из публикации

можно сделать так чтобы если книгу убирает админ то лайки не удаляются, 
но если после этого он не изменит книгу, то книгу удалят нахуй. 


теперь нужно подумать как хранить это. 

сначала нужно подумать что бы мне хотелось видеть, и на что хотелось бы нажимать.

updateProfile
- хочу видеть сам профиль (минимум) и хочу на него тыкнуть. Все.

поскольку у меня будет author в каждом action, то тыкнуть на него не составит труда. 
************************************************************
* профиль пользователя был обновлен.                       * 
*                                        28/01/2004, 13:54 *
************************************************************

addBook
- в принципе, могу видеть только название книги. Ничем не навредит отсутствие картинки. 
************************************************************
* Была добавлена [название книги] книга.                   * 
*                                        28/01/2004, 13:54 *
************************************************************
updateBook
- хочу видеть имя книги, тыкнуть на нее
deleteBook
- хочу видеть имя книги... и все. 
publishBook
- хочу видеть имя книги и тыкать на нее
unpublishBook
- хочу видеть имя книги. а могу ли? - ДА. Если эта книга была скрыта после того 
  как на нее была отправлена жалоба, то админ может ее видеть. 

************************************************************
* В книгу [название книги](ссылка на книгу) была добавлена * 
* глава [название главы](ссылка на главу)                  *
*                                        28/01/2004, 13:54 *
************************************************************
addChapter
- хочу тыкнуть на главу, хочу тыкнуть на книгу. 
  Хочу знать имя книги. Хочу знать имя главы.
updateChapter
- кликабельное название книги, кликабельное название главы. 
deleteChapter
- кликабельное название книги, НЕкликабельное название главы. 
publishChapter
- кликабельное название главы кликабельное название книги
unpublishChapter
- кликабельное название главыкликабельное название книги


создание модели данных actions
1. Для именения профиля (updateProfile) мне не нужно ничего дополнительного. Только автор. 
2. Для книги мне нужен bookId и bookName 
3. Для глав мне нужен bookId bookName chapterId chapterName
4. Для комментария мне не нужно ничего. Мы его не отслеживаем. 
  На него только пользователь жалуется а админ удаляет или не удаляет. Удаляется ветками. 
5. Для сообщения нужно сообщение. просто текст. 

обязательно нужен всем author. 
обязательно нужен всем report для того чтобы можно было искать actions. Иначе мне бы пришлось создавать миллионы actions на каждое из 11 действий каждого пользователя. Кто знает, сколько действий может совершить пользователь в день. 100? 1000? а если пользователей 1000000?
обязательно нужен id. 

_id: string
report: string
actionType: string
author: string
createdAt: Date
meta: 
  content: string // message
  ***
  book:           // updateBook
    _id: string
    name: string
  ***
  book:           // updateChapter
    _id: string
    name: string
  chapter: 
    _id: string
    name: string

с такой штукой мне просто нужно отнести часть actionType к message, 
часть к updateBook и часть к updateChapter. 

можно даже добавлять все сразу в документ. Не нужно делать lookup за книгой. 
Хотя это не так уж и сложно. 
Мне всего-то нужно добавить две строчки populate с двумя полями объекта. 
таааааак... мне может нужно просто сделать 3 большие группы - message updateBook updateChapter?

А как тогда мне разделять это "Книга добавлена" или "книга удалена"

Но если этого не сделать, то тогда будет сложно делать populate. 

или нет? Так. Если я определю 

report: { type: Types.ObjectId, required: true },
author: { type: String, required: true },
actionType: { type: String, required: true },
meta: {
  content: String,
  book: {
    _id: ObjectId,
    name: String
  },
  chapter: {
    _id: ObjectId,
    name: String
  }
}


а на фронтендике я сделаю так:

я объединю их в message / book / chapter и сделаю подтипы под них. Изи. z


*/


/*
- [ ] updateProfile - обновление контента профиля

- [ ] addBook - добавление книги
- [x] updateBook - обновление контента книги
- [ ] deleteBook - удаление книги
- [ ] publishBook - публикация книги
- [ ] unpublishBook - сокрытие книги

- [ ] addChapter - добавление главы в книгу 
- [ ] updateChapter - изменения в контенте / имени главы конкретной книги
- [ ] deleteChapter - удаление конкретной главы конкретной книги
- [ ] publishChapter - публикация главы
- [ ] unpublishChapter - сокрытие главы
*/

export type IAction = {
  _id: string
  report: string
  author: string
  actionType: string
  meta: {
    content?: string
    book?: {
      _id: string
      name: string
    }
    chapter?: {
      _id: string
      name: string
    }
  }
  
}

export class ActionType {
  static message = "message"

  static addBook = "addBook"
  static updateBook = "updateBook"
  static deleteBook = "deleteBook"
  static publishBook = "publishBook"
  static unpublishBook = "unpublishBook"

  static addChapter = "addChapter"
  static updateChapter = "updateChapter"
  static deleteChapter = "deleteChapter"
  static publishChapter = "publishChapter"
  static unpublishChapter = "unpublishChapter"

  static get values() {
    return [
      ActionType.message,

      ActionType.addBook,
      ActionType.updateBook,
      ActionType.deleteBook,
      ActionType.publishBook,
      ActionType.unpublishBook,

      ActionType.addChapter,
      ActionType.updateChapter,
      ActionType.deleteChapter,
      ActionType.publishChapter,
      ActionType.unpublishChapter,
    ]
  }
}

const ActionSchema = new Schema({
  actionType: { type: String, required: true },
  author: { type: String, ref: 'Profile', required: true },
  report: { type: Types.ObjectId, ref: 'Report', required: true },
  meta: {
    content: { type: String },
    book: { type: Types.ObjectId, ref: 'Book' },
    chapter: { type: Types.ObjectId, ref: 'Chapter' }
  }
}, { timestamps: true })

ActionSchema.virtual("actions", {
  ref: 'Action',
  localField: '_id',
  foreignField: 'report',
})


export const Action = model('Action', ActionSchema)
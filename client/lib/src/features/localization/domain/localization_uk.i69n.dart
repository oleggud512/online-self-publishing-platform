// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;
import 'localization.i69n.dart';

String get _languageCode => 'uk';
String get _localeName => 'uk';

String _plural(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.plural(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _ordinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.ordinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _cardinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.cardinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);

class Localization_uk extends Localization {
  const Localization_uk();
  ScreenTitleLocalization_uk get screenTitle =>
      ScreenTitleLocalization_uk(this);
  AuthLocalization_uk get auth => AuthLocalization_uk(this);
  String get saveChanges => "Зберегти зміни";
  String get google => "Google";
  String get cancel => "Відмінити";
  String get send => "Відправити";
  String get delete => "Видалити";
  String get query => "Запит";
  SettingsLocalization_uk get settings => SettingsLocalization_uk(this);
  ErrorsLocalization_uk get errors => ErrorsLocalization_uk(this);
  String get searchPlaceholder => "введіть запит...";
  String get description => "опис";
  String get name => "імʼя";
  String get displayName => "реальне імʼя";
  String get age => "вік";
  ProfileLocalization_uk get profile => ProfileLocalization_uk(this);
  String get edit => "Редагувати";
  String get subscribe => "Підписатися";
  String get unsubscribe => "Відписатися";
  String get seeAll => "Переглянути Всі";
  BookLocalization_uk get book => BookLocalization_uk(this);
  ChapterLocalization_uk get chapter => ChapterLocalization_uk(this);
  CommentsLocalization_uk get comments => CommentsLocalization_uk(this);
  String get loadMore => "Завантажити ще";
  String get save => "Зберегти";
  String get status => "статус";
  String get wantToHide => "Сховати цю книгу?";
  String get wantToPublish => "Опублікувати?";
  String get yes => "Yes";
  String get no => "No";
  NotificationsLocalization_uk get notifications =>
      NotificationsLocalization_uk(this);
  ReportLocalization_uk get report => ReportLocalization_uk(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'screenTitle':
        return screenTitle;
      case 'auth':
        return auth;
      case 'saveChanges':
        return saveChanges;
      case 'google':
        return google;
      case 'cancel':
        return cancel;
      case 'send':
        return send;
      case 'delete':
        return delete;
      case 'query':
        return query;
      case 'settings':
        return settings;
      case 'errors':
        return errors;
      case 'searchPlaceholder':
        return searchPlaceholder;
      case 'description':
        return description;
      case 'name':
        return name;
      case 'displayName':
        return displayName;
      case 'age':
        return age;
      case 'profile':
        return profile;
      case 'edit':
        return edit;
      case 'subscribe':
        return subscribe;
      case 'unsubscribe':
        return unsubscribe;
      case 'seeAll':
        return seeAll;
      case 'book':
        return book;
      case 'chapter':
        return chapter;
      case 'comments':
        return comments;
      case 'loadMore':
        return loadMore;
      case 'save':
        return save;
      case 'status':
        return status;
      case 'wantToHide':
        return wantToHide;
      case 'wantToPublish':
        return wantToPublish;
      case 'yes':
        return yes;
      case 'no':
        return no;
      case 'notifications':
        return notifications;
      case 'report':
        return report;
      default:
        return super[key];
    }
  }
}

class ScreenTitleLocalization_uk extends ScreenTitleLocalization {
  final Localization_uk _parent;
  const ScreenTitleLocalization_uk(this._parent) : super(_parent);
  String get home => "Головна";
  String get messages => "Повідомлення";
  String get books => "Книги";
  String get chapters => "Глави";
  String get authors => "Автори";
  String get profile => "Профіль";
  String get settings => "Налаштування";
  String get notifications => "Сповіщення";
  String get profileBooks => "Книги";
  String get filters => "Фільтри";
  String get bookmarks => "Закладки";
  String get authentication => "Вхід";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'home':
        return home;
      case 'messages':
        return messages;
      case 'books':
        return books;
      case 'chapters':
        return chapters;
      case 'authors':
        return authors;
      case 'profile':
        return profile;
      case 'settings':
        return settings;
      case 'notifications':
        return notifications;
      case 'profileBooks':
        return profileBooks;
      case 'filters':
        return filters;
      case 'bookmarks':
        return bookmarks;
      case 'authentication':
        return authentication;
      default:
        return super[key];
    }
  }
}

class AuthLocalization_uk extends AuthLocalization {
  final Localization_uk _parent;
  const AuthLocalization_uk(this._parent) : super(_parent);
  String get email => "Email";
  String get password => "Пароль";
  String get signIn => "Авторизуватися";
  String get signUp => "Зареєструватися";
  String get signOut => "Вийти";
  String get skip => "Пропустити";
  String switchTo(String to) => "Перемкнути на $to";
  String get blocked => "Аккаунт заблоковано";
  String get authenticate => "Ввійти в аккаунт";
  String get gender => "Гендер";
  GendersAuthLocalization_uk get genders => GendersAuthLocalization_uk(this);
  String get age => "Вік";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'email':
        return email;
      case 'password':
        return password;
      case 'signIn':
        return signIn;
      case 'signUp':
        return signUp;
      case 'signOut':
        return signOut;
      case 'skip':
        return skip;
      case 'switchTo':
        return switchTo;
      case 'blocked':
        return blocked;
      case 'authenticate':
        return authenticate;
      case 'gender':
        return gender;
      case 'genders':
        return genders;
      case 'age':
        return age;
      default:
        return super[key];
    }
  }
}

class GendersAuthLocalization_uk extends GendersAuthLocalization {
  final AuthLocalization_uk _parent;
  const GendersAuthLocalization_uk(this._parent) : super(_parent);
  String get preferNotToSay => "Бажаю не вказувати";
  String get other => "Небінарний";
  String get male => "Чоловік";
  String get female => "Жінка";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'preferNotToSay':
        return preferNotToSay;
      case 'other':
        return other;
      case 'male':
        return male;
      case 'female':
        return female;
      default:
        return super[key];
    }
  }
}

class SettingsLocalization_uk extends SettingsLocalization {
  final Localization_uk _parent;
  const SettingsLocalization_uk(this._parent) : super(_parent);
  String get changeLanguageLabel => "Змінтити мову";
  String onLangChangedLabel(String newLang) => "Мову змінено на $newLang!";
  String ukrainian([bool of = false]) => "${of ? 'Українську' : 'Українська'}";
  String english([bool of = false]) => "${of ? 'Англійську' : 'Англійська'}";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'changeLanguageLabel':
        return changeLanguageLabel;
      case 'onLangChangedLabel':
        return onLangChangedLabel;
      case 'ukrainian':
        return ukrainian;
      case 'english':
        return english;
      default:
        return super[key];
    }
  }
}

class ErrorsLocalization_uk extends ErrorsLocalization {
  final Localization_uk _parent;
  const ErrorsLocalization_uk(this._parent) : super(_parent);
  String get shortPassword => "Пароль повинен мати не менше 6 символів";
  String get cannotSubscribeYourself => "Ви не можете підписатися на себе.";
  String get cantPublish => "Ви не можете опублікувати цю книгу";
  String get cannotAddComment => "Вам не дозволено додавати коментарі.";
  String get notFound => "Не знайдено";
  String get unauthenticated => "Ви не ввыйшли в аккаунт";
  String get connectionError => "Помилка підключення";
  String get connectionErrorMessage => "Перевірте своє Інтернет зʼєднання";
  String get cannotSave => "Помилка: Дані не збережено";
  String get cannotDelete => "Помилка видалення";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'shortPassword':
        return shortPassword;
      case 'cannotSubscribeYourself':
        return cannotSubscribeYourself;
      case 'cantPublish':
        return cantPublish;
      case 'cannotAddComment':
        return cannotAddComment;
      case 'notFound':
        return notFound;
      case 'unauthenticated':
        return unauthenticated;
      case 'connectionError':
        return connectionError;
      case 'connectionErrorMessage':
        return connectionErrorMessage;
      case 'cannotSave':
        return cannotSave;
      case 'cannotDelete':
        return cannotDelete;
      default:
        return super[key];
    }
  }
}

class ProfileLocalization_uk extends ProfileLocalization {
  final Localization_uk _parent;
  const ProfileLocalization_uk(this._parent) : super(_parent);
  String get subscribers => "Підписники";
  String gotSubscribed(String toProfile) => "Підписка на ${toProfile}";
  String get subscriptions => "Підписки";
  String gotUnsubscribed(String fromProfile) =>
      "Ви відписалися від користувача ${fromProfile}";
  String get books => "Книги";
  String get noDescriptionPlaceholder => "Без опису...";
  String get popularAuthors => "Популярні автори";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'subscribers':
        return subscribers;
      case 'gotSubscribed':
        return gotSubscribed;
      case 'subscriptions':
        return subscriptions;
      case 'gotUnsubscribed':
        return gotUnsubscribed;
      case 'books':
        return books;
      case 'noDescriptionPlaceholder':
        return noDescriptionPlaceholder;
      case 'popularAuthors':
        return popularAuthors;
      default:
        return super[key];
    }
  }
}

class BookLocalization_uk extends BookLocalization {
  final Localization_uk _parent;
  const BookLocalization_uk(this._parent) : super(_parent);
  String get published => "опубліковано";
  String get unpublished => "чернетка";
  String get publish => "опублікувати";
  String get unpublish => "сховати";
  String get completed => "завершено";
  String get inProgress => "в процесі";
  String get abandoned => "кинуто";
  String get saveBook => "Зберегти книгу";
  String get popularBooks => "Популярні книги";
  String get cantLike => "Неавторизовані користувачі не можуть залишати лайки.";
  String get cantBookmark => "Неможливо додати книгу до закладок";
  String get genres => "Жанри";
  String get tags => "Піджанри";
  String get addNewBook => "Додати нову книгу";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'published':
        return published;
      case 'unpublished':
        return unpublished;
      case 'publish':
        return publish;
      case 'unpublish':
        return unpublish;
      case 'completed':
        return completed;
      case 'inProgress':
        return inProgress;
      case 'abandoned':
        return abandoned;
      case 'saveBook':
        return saveBook;
      case 'popularBooks':
        return popularBooks;
      case 'cantLike':
        return cantLike;
      case 'cantBookmark':
        return cantBookmark;
      case 'genres':
        return genres;
      case 'tags':
        return tags;
      case 'addNewBook':
        return addNewBook;
      default:
        return super[key];
    }
  }
}

class ChapterLocalization_uk extends ChapterLocalization {
  final Localization_uk _parent;
  const ChapterLocalization_uk(this._parent) : super(_parent);
  String get firstChapterWarning => "Це перша глава.";
  String get lastChapterWarning => "Це остання глава.";
  String get previous => "Попередня";
  String get next => "Наступна";
  String get deleteChapter => "Видалити Главу";
  String get editChapter => "Редагувати Главу";
  String get addChapter => "Додати Главу";
  String get name => "Назва";
  String get noChapters => "Глав немає";
  String stateChangeFailure(String state) => "Не вдалося ${state} главу";
  String stateChangeSuccess(String state) => "Глава була успішно ${state}";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'firstChapterWarning':
        return firstChapterWarning;
      case 'lastChapterWarning':
        return lastChapterWarning;
      case 'previous':
        return previous;
      case 'next':
        return next;
      case 'deleteChapter':
        return deleteChapter;
      case 'editChapter':
        return editChapter;
      case 'addChapter':
        return addChapter;
      case 'name':
        return name;
      case 'noChapters':
        return noChapters;
      case 'stateChangeFailure':
        return stateChangeFailure;
      case 'stateChangeSuccess':
        return stateChangeSuccess;
      default:
        return super[key];
    }
  }
}

class CommentsLocalization_uk extends CommentsLocalization {
  final Localization_uk _parent;
  const CommentsLocalization_uk(this._parent) : super(_parent);
  String get nnew => "Нові";
  String get old => "Старі";
  String get popular => "Популярні";
  String get answer => "Відповісти";
  String get hide => "Сховати";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'nnew':
        return nnew;
      case 'old':
        return old;
      case 'popular':
        return popular;
      case 'answer':
        return answer;
      case 'hide':
        return hide;
      default:
        return super[key];
    }
  }
}

class NotificationsLocalization_uk extends NotificationsLocalization {
  final Localization_uk _parent;
  const NotificationsLocalization_uk(this._parent) : super(_parent);
  NewChapterNotificationsLocalization_uk get newChapter =>
      NewChapterNotificationsLocalization_uk(this);
  BookUnpublishedNotificationsLocalization_uk get bookUnpublished =>
      BookUnpublishedNotificationsLocalization_uk(this);
  ReportRejectedNotificationsLocalization_uk get reportRejected =>
      ReportRejectedNotificationsLocalization_uk(this);
  SubscribedNotificationsLocalization_uk get subscribed =>
      SubscribedNotificationsLocalization_uk(this);
  CommentAnswerNotificationsLocalization_uk get commentAnswer =>
      CommentAnswerNotificationsLocalization_uk(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'newChapter':
        return newChapter;
      case 'bookUnpublished':
        return bookUnpublished;
      case 'reportRejected':
        return reportRejected;
      case 'subscribed':
        return subscribed;
      case 'commentAnswer':
        return commentAnswer;
      default:
        return super[key];
    }
  }
}

class NewChapterNotificationsLocalization_uk
    extends NewChapterNotificationsLocalization {
  final NotificationsLocalization_uk _parent;
  const NewChapterNotificationsLocalization_uk(this._parent) : super(_parent);
  String get title => "Нова глава";
  String body(Map<String, dynamic> data) =>
      "Глава \"${data["chapter"]}\" була додана до книги \"${data["chapter"]}\"";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'body':
        return body;
      default:
        return super[key];
    }
  }
}

class BookUnpublishedNotificationsLocalization_uk
    extends BookUnpublishedNotificationsLocalization {
  final NotificationsLocalization_uk _parent;
  const BookUnpublishedNotificationsLocalization_uk(this._parent)
      : super(_parent);
  String get title => "Ваша книга схована через порушення правил.";
  String body(Map<String, dynamic> data) =>
      "\"${data["book"]}\" схована. Звʼяжіться з адміністрацією через вкладку \"Повідомлення\"";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'body':
        return body;
      default:
        return super[key];
    }
  }
}

class ReportRejectedNotificationsLocalization_uk
    extends ReportRejectedNotificationsLocalization {
  final NotificationsLocalization_uk _parent;
  const ReportRejectedNotificationsLocalization_uk(this._parent)
      : super(_parent);
  String get title => "Вашу скаргу відхилено";
  String body(Map<String, dynamic> data) =>
      "Вашу скаргу на \"${data["subject"]}\" було відхилено. <a href=\"https://example.com\">Правила</a>.";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'body':
        return body;
      default:
        return super[key];
    }
  }
}

class SubscribedNotificationsLocalization_uk
    extends SubscribedNotificationsLocalization {
  final NotificationsLocalization_uk _parent;
  const SubscribedNotificationsLocalization_uk(this._parent) : super(_parent);
  String get title => "Новий підписник";
  String body(Map<String, dynamic> data) =>
      "Користувач ${data["profile"]} підписався на вас.";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'body':
        return body;
      default:
        return super[key];
    }
  }
}

class CommentAnswerNotificationsLocalization_uk
    extends CommentAnswerNotificationsLocalization {
  final NotificationsLocalization_uk _parent;
  const CommentAnswerNotificationsLocalization_uk(this._parent)
      : super(_parent);
  String get title => "Нова відповідь";
  String body(Map<String, dynamic> data) =>
      "Користувач ${data["profile"]} відповів на ваш коментар.";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'body':
        return body;
      default:
        return super[key];
    }
  }
}

class ReportLocalization_uk extends ReportLocalization {
  final Localization_uk _parent;
  const ReportLocalization_uk(this._parent) : super(_parent);
  String get reportDescriptionQuestion =>
      "Будь ласка, надайте детальний опис проблеми, з якою ви зіткнулися. Це допоможе нам ефективно вирішити проблему.";
  String get reportAddedMessage => "Скаргу додано";
  String get toReport => "Поскаржитись";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'reportDescriptionQuestion':
        return reportDescriptionQuestion;
      case 'reportAddedMessage':
        return reportAddedMessage;
      case 'toReport':
        return toReport;
      default:
        return super[key];
    }
  }
}

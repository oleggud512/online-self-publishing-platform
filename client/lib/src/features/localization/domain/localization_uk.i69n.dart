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
  String get status => "статус";
  String get wantToHide => "Сховати цю книгу?";
  String get wantToPublish => "Опублікувати?";
  String get yes => "Yes";
  String get no => "No";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'screenTitle':
        return screenTitle;
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
  String get authors => "Автори";
  String get profile => "Профіль";
  String get settings => "Налаштування";
  String get notifications => "Сповіщення";
  String get profileBooks => "Книги";
  String get filters => "Фільтри";
  String get bookmarks => "Закладки";
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
      default:
        return super[key];
    }
  }
}

class ProfileLocalization_uk extends ProfileLocalization {
  final Localization_uk _parent;
  const ProfileLocalization_uk(this._parent) : super(_parent);
  String get subscribers => "Підписники";
  String get subscriptions => "Підписки";
  String get books => "книги";
  String get noDescriptionPlaceholder => "Без опису...";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'subscribers':
        return subscribers;
      case 'subscriptions':
        return subscriptions;
      case 'books':
        return books;
      case 'noDescriptionPlaceholder':
        return noDescriptionPlaceholder;
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
      default:
        return super[key];
    }
  }
}

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
  ProfileLocalization_uk get profile => ProfileLocalization_uk(this);
  String get edit => "Редагувати";
  String get subscribe => "Підписатися";
  String get unsubscribe => "Відписатися";
  String get seeAll => "Переглянути Всі";
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
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'shortPassword':
        return shortPassword;
      default:
        return super[key];
    }
  }
}

class ProfileLocalization_uk extends ProfileLocalization {
  final Localization_uk _parent;
  const ProfileLocalization_uk(this._parent) : super(_parent);
  String get subscribers => "підписники";
  String get subscriptions => "підписки";
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

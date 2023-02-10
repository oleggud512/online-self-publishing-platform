// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;

String get _languageCode => 'en';
String get _localeName => 'en';

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

class Localization implements i69n.I69nMessageBundle {
  const Localization();
  ScreenTitleLocalization get screenTitle => ScreenTitleLocalization(this);
  SettingsLocalization get settings => SettingsLocalization(this);
  ErrorsLocalization get errors => ErrorsLocalization(this);
  String get searchPlaceholder => "type here...";
  ProfileLocalization get profile => ProfileLocalization(this);
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
      default:
        return key;
    }
  }
}

class ScreenTitleLocalization implements i69n.I69nMessageBundle {
  final Localization _parent;
  const ScreenTitleLocalization(this._parent);
  String get home => "Home";
  String get messages => "Messages";
  String get books => "Books";
  String get authors => "Authors";
  String get profile => "Profile";
  String get settings => "Settings";
  String get notifications => "Notifications";
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
        return key;
    }
  }
}

class SettingsLocalization implements i69n.I69nMessageBundle {
  final Localization _parent;
  const SettingsLocalization(this._parent);
  String get changeLanguageLabel => "Change Language";
  String onLangChangedLabel(String newLang) => "Language changed to $newLang!";
  String ukrainian([bool of = false]) => "Ukrainian";
  String english([bool of = false]) => "English";
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
        return key;
    }
  }
}

class ErrorsLocalization implements i69n.I69nMessageBundle {
  final Localization _parent;
  const ErrorsLocalization(this._parent);
  String get shortPassword => "Password must have more than 6 characters";
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
        return key;
    }
  }
}

class ProfileLocalization implements i69n.I69nMessageBundle {
  final Localization _parent;
  const ProfileLocalization(this._parent);
  String get subscribers => "subscribers";
  String get subscriptions => "subscriptions";
  String get books => "books";
  String get noDescriptionPlaceholder => "No description for this user...";
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
        return key;
    }
  }
}

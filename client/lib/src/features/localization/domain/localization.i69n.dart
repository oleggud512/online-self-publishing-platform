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
  String get description => "description";
  String get name => "name";
  String get displayName => "display name";
  String get age => "age";
  ProfileLocalization get profile => ProfileLocalization(this);
  String get edit => "Edit";
  String get subscribe => "Subscribe";
  String get unsubscribe => "Unsubscribe";
  String get seeAll => "See All";
  BookLocalization get book => BookLocalization(this);
  String get status => "status";
  String get wantToHide => "Want to hide the book?";
  String get wantToPublish => "Want to publish the book?";
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
  String get profileBooks => "Profile Books";
  String get filters => "Filters";
  String get bookmarks => "Bookmarks";
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
  String get cannotSubscribeYourself => "Can't subscribe yourself";
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
        return key;
    }
  }
}

class ProfileLocalization implements i69n.I69nMessageBundle {
  final Localization _parent;
  const ProfileLocalization(this._parent);
  String get subscribers => "Subscribers";
  String get subscriptions => "Subscriptions";
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

class BookLocalization implements i69n.I69nMessageBundle {
  final Localization _parent;
  const BookLocalization(this._parent);
  String get published => "published";
  String get unpublished => "unpublished";
  String get publish => "publish";
  String get unpublish => "unpublish";
  String get completed => "completed";
  String get inProgress => "in progress";
  String get abandoned => "abandoned";
  String get saveBook => "Save book";
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
        return key;
    }
  }
}

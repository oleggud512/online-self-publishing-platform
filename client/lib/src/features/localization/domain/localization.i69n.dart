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
  AuthLocalization get auth => AuthLocalization(this);
  String get google => "Google";
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
  ChapterLocalization get chapter => ChapterLocalization(this);
  String get status => "status";
  String get wantToHide => "Want to hide the book?";
  String get wantToPublish => "Want to publish the book?";
  String get yes => "Yes";
  String get no => "No";
  NotificationsLocalization get notifications =>
      NotificationsLocalization(this);
  ReportLocalization get report => ReportLocalization(this);
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
      case 'google':
        return google;
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
  String get authentication => "Authentication";
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
      case 'authentication':
        return authentication;
      default:
        return key;
    }
  }
}

class AuthLocalization implements i69n.I69nMessageBundle {
  final Localization _parent;
  const AuthLocalization(this._parent);
  String get email => "Email";
  String get password => "Password";
  String get signIn => "Sign In";
  String get signUp => "Sign Up";
  String get skip => "Skip";
  String switchTo(String to) => "Switch to $to";
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
      case 'skip':
        return skip;
      case 'switchTo':
        return switchTo;
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
  String get cantPublish => "You can't publish this book";
  String get cannotAddComment => "You are not permitted to add comments.";
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

class ChapterLocalization implements i69n.I69nMessageBundle {
  final Localization _parent;
  const ChapterLocalization(this._parent);
  String get firstChapterWarning => "This is the first chapter.";
  String get lastChapterWarning => "This is the last chapter.";
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
      default:
        return key;
    }
  }
}

class NotificationsLocalization implements i69n.I69nMessageBundle {
  final Localization _parent;
  const NotificationsLocalization(this._parent);
  NewChapterNotificationsLocalization get newChapter =>
      NewChapterNotificationsLocalization(this);
  BookUnpublishedNotificationsLocalization get bookUnpublished =>
      BookUnpublishedNotificationsLocalization(this);
  ReportRejectedNotificationsLocalization get reportRejected =>
      ReportRejectedNotificationsLocalization(this);
  SubscribedNotificationsLocalization get subscribed =>
      SubscribedNotificationsLocalization(this);
  CommentAnswerNotificationsLocalization get commentAnswer =>
      CommentAnswerNotificationsLocalization(this);
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
        return key;
    }
  }
}

class NewChapterNotificationsLocalization implements i69n.I69nMessageBundle {
  final NotificationsLocalization _parent;
  const NewChapterNotificationsLocalization(this._parent);
  String get title => "New Chapter";
  String body(Map<String, dynamic> data) =>
      "Chapter \"${data["chapter"]}\" has been added to the book \"${data["book"]}\"";
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
        return key;
    }
  }
}

class BookUnpublishedNotificationsLocalization
    implements i69n.I69nMessageBundle {
  final NotificationsLocalization _parent;
  const BookUnpublishedNotificationsLocalization(this._parent);
  String get title =>
      "Your book is unpublished due to violation of ... something";
  String body(Map<String, dynamic> data) =>
      "\"${data["book"]}\" has been unpublished. Contact administration through \"Messages\" tab";
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
        return key;
    }
  }
}

class ReportRejectedNotificationsLocalization
    implements i69n.I69nMessageBundle {
  final NotificationsLocalization _parent;
  const ReportRejectedNotificationsLocalization(this._parent);
  String get title => "Your report rejected";
  String body(Map<String, dynamic> data) =>
      "Your report on \"${data["subject"]}\" has been rejected. Rules.";
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
        return key;
    }
  }
}

class SubscribedNotificationsLocalization implements i69n.I69nMessageBundle {
  final NotificationsLocalization _parent;
  const SubscribedNotificationsLocalization(this._parent);
  String get title => "New subscriber";
  String body(Map<String, dynamic> data) =>
      "The user ${data["profile"]} has been subscribed on you.";
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
        return key;
    }
  }
}

class CommentAnswerNotificationsLocalization implements i69n.I69nMessageBundle {
  final NotificationsLocalization _parent;
  const CommentAnswerNotificationsLocalization(this._parent);
  String get title => "New answer";
  String body(Map<String, dynamic> data) =>
      "The user ${data["profile"]} has been answered your comment.";
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
        return key;
    }
  }
}

class ReportLocalization implements i69n.I69nMessageBundle {
  final Localization _parent;
  const ReportLocalization(this._parent);
  String get reportDescriptionQuestion =>
      "Please provide a detailed description of the issue you're experiencing. This will help us address the problem effectively.";
  String get reportAddedMessage => "Report added";
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
      default:
        return key;
    }
  }
}

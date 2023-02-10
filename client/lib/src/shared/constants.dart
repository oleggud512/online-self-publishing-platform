// const baseUrl = "http://127.0.0.1:3000/";
const baseUrl = "http://10.0.2.2:3000/";
const baseApiUrl = "${baseUrl}api/v1/";
const baseSocketUrl = baseUrl;

enum MyRoute {
  root,
  auth,

  home,
  chats,
  books,
  authors,
  myProfile,

  settings,
  notifications,
  chat,
  editBook,
  profile,
  editProfile,

  chapter,
  editChapter
}
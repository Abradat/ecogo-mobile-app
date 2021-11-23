class User {
  final String _username;
  final String _userCode;
  final String _location;
  final int _level;
  final String _image;

  User(
      this._username, this._userCode, this._location, this._level, this._image);

  String get image => _image;

  int get level => _level;

  String get location => _location;

  String get userCode => _userCode;

  String get username => _username;
}

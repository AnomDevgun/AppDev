class SqlUser {
  int _user_id;
  String _email;
  String _password;

  SqlUser(
    this._user_id,
    this._email,
    this._password,
  );

  SqlUser.fromMap(dynamic obj) {
    this._user_id = obj['user_id'];
    this._email = obj['email'];
    this._password = obj['password'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['user_id'] = _user_id;
    map['email'] = _email;
    map['password'] = _password;

    return map;
  }

  //getters
  int get userId => _user_id;
  String get email => _email;
  String get password => _password;
}

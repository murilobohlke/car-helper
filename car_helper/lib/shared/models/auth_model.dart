enum AuthMode {
  LOGIN,
  SIGNUP,
}

class AuthModel {
  String? name;
  String? email;
  String? password;
  AuthMode _mode = AuthMode.LOGIN;

  bool get isLogin {
    return _mode == AuthMode.LOGIN;
  }

  bool get isSignup {
    return _mode == AuthMode.SIGNUP;
  }

  void toggleMode() {
    _mode = _mode == AuthMode.LOGIN ? AuthMode.SIGNUP : AuthMode.LOGIN;
  }
}

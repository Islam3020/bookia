class AuthParams {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  int? verificationCode;

  AuthParams({this.name, this.email, this.password, this.passwordConfirmation});
  toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "verify_code": verificationCode
    };
  }
}

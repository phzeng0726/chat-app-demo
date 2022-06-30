// https://stackoverflow.com/questions/56253787/how-to-handle-textfield-validation-in-password-in-flutter
extension PasswordValidator on String {
  /*
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');

  (?=.*[A-Z])       // should contain at least one upper case
  (?=.*[a-z])       // should contain at least one lower case
  (?=.*?[0-9])      // should contain at least one digit
  (?=.*?[!@#\$&*~]) // should contain at least one Special character
  .{6,}             // Must be at least 6 characters in length  
   */
  String? isValidPassword() {
    RegExp regex = RegExp(r'^.{6,}$');
    if (isEmpty) {
      return '密碼不能為空';
    } else {
      if (!regex.hasMatch(this)) {
        return '密碼長度介於 6 - 20 之間';
      } else {
        return null;
      }
    }
  }
}

extension EmailValidator on String {
  String? isValidEmail() {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (isEmpty) {
      return '帳號不能為空';
    } else {
      if (!regex.hasMatch(this)) {
        return '帳號格式有誤';
      } else {
        return null;
      }
    }
  }
}

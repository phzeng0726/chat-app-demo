// https://stackoverflow.com/questions/56253787/how-to-handle-textfield-validation-in-password-in-flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

// FIXME: 無法繼承context
extension PasswordValidator on String {
  /*
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');

  (?=.*[A-Z])       // should contain at least one upper case
  (?=.*[a-z])       // should contain at least one lower case
  (?=.*?[0-9])      // should contain at least one digit
  (?=.*?[!@#\$&*~]) // should contain at least one Special character
  .{6,}             // Must be at least 6 characters in length  
   */
  String? isValidPassword(BuildContext context) {
    RegExp regex = RegExp(r'^.{6,}$');
    if (isEmpty) {
      return FlutterI18n.translate(context, "login.validator.passwordNotEmpty");
    } else {
      if (!regex.hasMatch(this)) {
        return FlutterI18n.translate(
            context, "login.validator.passwordLengthNotice");
      } else {
        return null;
      }
    }
  }
}

extension EmailValidator on String {
  String? isValidEmail(BuildContext context) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (isEmpty) {
      return FlutterI18n.translate(context, "login.validator.emailNotEmpty");
    } else {
      if (!regex.hasMatch(this)) {
        return FlutterI18n.translate(
            context, "login.validator.emailFormalError");
      } else {
        return null;
      }
    }
  }
}

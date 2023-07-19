

class RegExpression {
  //All RegExp
  static String emailId = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static String password = r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)";
  static String passportValidation= "[A-Z{1}0-9{7}]";
  static String? emptyText(String? val, context) {
    if (val == "") {
      "This Field is required";
    } else {
      return null;
    }}

  static String? checkEmail(String? val, context) {
    if (val == "") {
      return "Please enter email aadress";
    } else {
      final bool emailValid = RegExp(RegExpression.emailId).hasMatch(val!.trim());
      if (emailValid == true) {
        return null;
      } else {
        return "please enter valid email address";
      }
    }
  }

  static String? checkMobile(String? val, context) {
    if (val == "") {
      return "Please enter mobile number";
    } else {
      if (val?.length == 10) {
        return null;
      } else {
        return "please valid mobile number";
      }
    }
  }

  static String? checkPassword(String? password, context) {
    if (password == "") {
      return "please enter password";
    } else {
      final bool passValid =
      RegExp(RegExpression.password).hasMatch(password!.trim());
      if (passValid == true) {
        return null;
      } else {
        return "please correct password";
      }
    }
  }

  static String? checkOldPassword(String? oldpassword, context) {
    if (oldpassword == "") {
      return "please enter password";
    } else if (oldpassword!.length < 6) {
      return "minimum password is 6";
    } else if (oldpassword.length > 10) {
      return "maximum password is 10";
    } else {
      final bool oldPassValid =
      RegExp(RegExpression.password).hasMatch(oldpassword.trim());
      if (oldPassValid) {
        return null;
      } else {
        return  "Please enter old correct password";
      }
    }
  }

  static String? checkNewPassword(String? newpassword, String? oldpassword, context) {
    if (newpassword == "") {
      return "enter password";
    } else if (newpassword == oldpassword) {
      return "Previous Old Password Can Not Be Used As Current";
    } else {
      final bool newPassValid =
      RegExp(RegExpression.password).hasMatch(newpassword!.trim());
      if (newPassValid == true) {
        return null;
      } else {
        return "Your Password Must Include Special Character";
      }
    }
  }

  static String? checkConfirmPassword(String? confirmpassword, context) {
    if (confirmpassword == "") {
      return "Please enter password";
    } else {
      final bool confimPassValid =
      RegExp(RegExpression.password).hasMatch(confirmpassword!.trim());
      if (confimPassValid == true) {
        return null;
      } else {
        return "Your Password Must Include Special Character";
      }
    }
  }

  static String? emptyTextValidate(String? val, String msg, context) {
    if (val?.trim() == "") {
      return msg;
    } else {
      return null;
    }
  }

  static String? checkPasswordLength(String? val, String msg, context) {
    if (val?.trim() == "") {
      return msg;
    } else {
      return null;
    }
  }

}
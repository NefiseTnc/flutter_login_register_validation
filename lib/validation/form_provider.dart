import 'package:flutter/cupertino.dart';
import 'package:flutter_login_register/core/extensions/extensions.dart';
import 'package:flutter_login_register/validation/validation_model.dart';

class FormProvider extends ChangeNotifier {
  ValidationModel _email = ValidationModel(value: null, error: null);
  ValidationModel _password = ValidationModel(value: null, error: null);

  //getters
  ValidationModel get email => _email;
  ValidationModel get password => _password;

  //setters
  void validateEmail(String? val) {
    if (val != null && val.isValidEmail) {
      _email = ValidationModel(value: val, error: null);
    } else {
      _email =
          ValidationModel(value: null, error: 'Please Enter a Valid Email');
    }
    notifyListeners();
  }

  void validatePassword(String? val) {
    if (val != null && val.isValidPassword) {
      _password = ValidationModel(value: val, error: null);
    } else {
      _password = ValidationModel(
          value: null,
          error:
              'Password must contain an uppercase, lowercase, numeric digit and special character');
    }
    notifyListeners();
  }

  bool get validate {
    return _email.value != null && _password.value != null;
  }
}

import 'package:mobx/mobx.dart';
import '../helpers/extensions.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError {
    if (email == null || emailValid)
      return null;
    else if (email.isEmpty)
      return 'Campo obrigatório';
    else
      return 'E-mail inválido';
  }

  @observable
  String password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password.length >= 6;
  String get passwordError {
    if (password == null || passwordValid)
      return null;
    else if (password.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senha muito curto';
  }

  @observable
  bool loading = false;

  @observable
  String error;

  @computed
  bool get isFormValid => emailValid && passwordValid;

  @computed
  Function get loginPressed => isFormValid && !loading ? _login : null;

  @action
  Future<void> _login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 3));

    loading = false;
  }
}

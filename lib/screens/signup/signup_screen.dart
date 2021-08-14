import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../stores/signup_store.dart';
import '../login/login_screen.dart';
import 'components/field_title.dart';

class SignupScreen extends StatelessWidget {
  SignupStore signupStore = new SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FieldTitle(
                      title: 'Apelido',
                      subtitle: 'Como aparecerá em seus anúncios.',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'João S.',
                          isDense: true,
                          errorText: signupStore.nameError,
                        ),
                        onChanged: signupStore.setName,
                      );
                    }),
                    const SizedBox(height: 16),
                    FieldTitle(
                      title: 'E-mail',
                      subtitle: 'Enviaremos um e-mail de confirmação.',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'joao@email.com',
                          isDense: true,
                          errorText: signupStore.emailError,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        onChanged: signupStore.setEmail,
                      );
                    }),
                    const SizedBox(height: 16),
                    FieldTitle(
                      title: 'Celular',
                      subtitle: 'Proteja sua conta',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '(99) 99999-9999',
                          isDense: true,
                          errorText: signupStore.phoneError,
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter()
                        ],
                        onChanged: signupStore.setPhone,
                      );
                    }),
                    const SizedBox(height: 16),
                    FieldTitle(
                      title: 'Senha',
                      subtitle: 'Use letras, números e caracteres especiais',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: signupStore.pass1Error,
                          ),
                          obscureText: true,
                          onChanged: signupStore.setPass1);
                    }),
                    const SizedBox(height: 16),
                    FieldTitle(
                      title: 'Confirmar Senha',
                      subtitle: 'Repita a senha',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              errorText: signupStore.pass2Error),
                          obscureText: true,
                          onChanged: signupStore.setPass2);
                    }),
                    Observer(builder: (_) {
                      return Container(
                        height: 40,
                        margin: const EdgeInsets.only(top: 20, bottom: 12),
                        child: RaisedButton(
                          color: Colors.orange,
                          child: Text('CADASTRAR'),
                          textColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {},
                        ),
                      );
                    }),
                    Divider(color: Colors.black),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          const Text('Já tenho conta? ',
                              style: TextStyle(fontSize: 16)),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => LoginScreen()));
                            },
                            child: Text('Entrar',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 16,
                                  color: Colors.purple,
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

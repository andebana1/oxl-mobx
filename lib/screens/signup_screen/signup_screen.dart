import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/components/error_box/error_box.dart';
import 'package:flutter_app/stores/signup_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/field_title.dart';

class SignUpScreen extends StatelessWidget {

  final SignUpStore signUpStore = SignUpStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Observer(builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ErrorBox(message: signUpStore.error),
                    );
                  }),
                  FieldTitle(title: 'Apelido', subtitle: 'Como aparecerá em seus anúncios.',),
                  Observer(builder: (_) {
                    return TextField(
                      enabled: !signUpStore.loading,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Exemplo: João S.',
                          isDense: true,
                          errorText: signUpStore.nameError
                      ),
                      onChanged: (String value) {
                        return signUpStore.setName(value);
                      },
                    );
                  }),
                  const SizedBox(height: 16,),
                  FieldTitle(title: 'E-mail', subtitle: 'Enviaremos um e-mail de confirmação.',),
                  Observer(builder: (_) {
                    return TextField(
                      enabled: !signUpStore.loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Exemplo: email@email.com',
                        isDense: true,
                        errorText: signUpStore.emailError
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      onChanged: signUpStore.setEmail,
                    );
                  }),
                  const SizedBox(height: 16,),
                  FieldTitle(title: 'Celular', subtitle: 'Proteja sua conta.',),
                  Observer(builder: (_) {
                    return TextField(
                      enabled: !signUpStore.loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Exemplo: (99) 99999-9999',
                        isDense: true,
                        errorText: signUpStore.phoneError
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter()
                      ],
                      onChanged: signUpStore.setPhone,
                    );
                  }),
                  const SizedBox(height: 16,),
                  FieldTitle(title: 'Senha', subtitle: 'Usar letras, números e caracteres especiais.',),
                  Observer(builder: (_) {
                    return TextField(
                      enabled: !signUpStore.loading,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                        errorText: signUpStore.pass1Error
                      ),
                      obscureText: true,
                      onChanged: signUpStore.setPass1,
                    );
                  }),
                  const SizedBox(height: 16,),
                  FieldTitle(title: 'Confirmar senha', subtitle: 'Repita a senha.',),
                  Observer(builder: (_) {
                    return TextField(
                      enabled: !signUpStore.loading,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                        errorText: signUpStore.pass2Error
                      ),
                      obscureText: true,
                      onChanged: signUpStore.setPass2,
                    );
                  }),
                  Observer(builder: (_) {
                    return Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 12),
                        height: 40,
                        child: RaisedButton(
                          color: Colors.orange,
                          disabledColor: Colors.orange.withAlpha(120),
                          child: signUpStore.isLoading,
                          textColor: Colors.white,
                          elevation: 0,
                          onPressed: signUpStore.signUpPressed,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                      );
                  }),
                  Divider(color: Colors.black,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Wrap(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      alignment: WrapAlignment.center,
                      children: [
                        const Text(
                          'Já possui uma conta? ',
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple,
                              fontSize: 16
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

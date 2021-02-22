import 'package:flutter/material.dart';
import 'package:flutter_app/components/error_box/error_box.dart';
import 'package:flutter_app/screens/signup_screen/signup_screen.dart';
import 'package:flutter_app/stores/login_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final LoginStore loginStore = LoginStore();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
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
                  Text(
                    'Acessar com E-mail:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900]
                    ),
                  ),
                  Observer(builder: (_){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ErrorBox(
                        message: loginStore.error,
                      ),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                    child: Text(
                      'E-mail',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                        errorText: loginStore.emailError,
                        border: const OutlineInputBorder(),
                        isDense: true,
                      ),
                      enabled: !loginStore.loading,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: loginStore.setEmail,
                    );
                  }),
                  const SizedBox(height: 16,),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Senha',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            //TODO
                          },
                          child: Text(
                            'Esqueceu a sua senha?',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                        errorText: loginStore.passwordError,
                      ),
                      enabled: !loginStore.loading,
                      obscureText: true,
                      onChanged: loginStore.setPassword,
                    );
                  }),
                  Observer(builder: (_) {
                    return Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 12),
                      height: 40,
                      child: RaisedButton(
                        disabledColor: Colors.orange.withAlpha(120),
                        color: Colors.orange,
                        child: loginStore.isLoading,
                        textColor: Colors.white,
                        elevation: 0,
                        onPressed: loginStore.loginPressed,
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
                      alignment: WrapAlignment.center,
                      children: [
                        const Text(
                          'Não possui uma conta? ',
                          style: TextStyle(
                            fontSize: 16
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context)
                                ..push(MaterialPageRoute(builder: (_) => SignUpScreen()));
                          },
                          child: Text(
                            'Cadastre-se',
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

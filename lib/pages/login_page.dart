import 'package:carros/domain/login_service.dart';
import 'package:carros/utils/alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Carros"),
        ),
        body: Padding(padding: EdgeInsets.all(16),
        child: _body(context),)
    );

  }

  String _validadeLogin(String text){
    if(text.isEmpty){
      return "Informe o login";
    }
  }

  String _validadeSenha(String text){
    if(text.length < 3){
      return "Informe a Senha";
    }
  }
   _body(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: _tLogin,
              validator: _validadeLogin,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.blue, fontSize: 25),
              decoration: InputDecoration(
                labelText: "Login",
                labelStyle: TextStyle(color:Colors.black, fontSize: 25),
                hintText: "Digite o seu login",
                hintStyle: TextStyle(color: Colors.blue, fontSize: 18)
              ),
            ),
            TextFormField(
              controller: _tSenha,
              validator: _validadeSenha,
              obscureText: true,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.blue, fontSize: 25),
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color:Colors.black, fontSize: 25),
                  hintText: "Digite sua senha",
                  hintStyle: TextStyle(color: Colors.blue, fontSize: 18)
              ),
            ),
            Container(
                margin: EdgeInsets.only(top:20),
                child: RaisedButton(
                    color: Colors.blue,
                    child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 25)),
                    onPressed: () {_onClickLogin(context);})

            ),
            Container(
                margin: EdgeInsets.only(top:20),
                child: GoogleSignInButton(
                    onPressed: () {_onClickLoginGoogle(context);})

            )
          ],
        ),
      );
  }

    void _onClickLoginGoogle(BuildContext context) {
      print("GOOOOGLE!");
    }


    void _onClickLogin(BuildContext context) {
    final login = _tLogin.text;
    final senha = _tSenha.text;

    if( _formKey.currentState.validate()) return;

    print("Login: $login, senha: $senha");

    final ok = LoginService.login(login, senha);

    if(ok){
      print("Entrar na home.");
    }else{
      alert(context, "Erro", "Vacilao");
    }

//    if(login.isEmpty || login.isEmpty){
//      showDialog(context: context,
//        builder: (context){
//          return AlertDialog(
//            title: Text("Erro"),
//            content: Text("Informe corretamente o login e a senha!"),
//            actions: <Widget>[
//              FlatButton(
//                child: Text("Ok"),
//                onPressed: () {
//                  Navigator.pop(context);
//                },
//              )
//            ],
//          );
//        }
//      );
//    }
  }
}



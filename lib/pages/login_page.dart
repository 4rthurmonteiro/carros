import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Carros"),
        ),
        body: Padding(padding: EdgeInsets.all(16),
        child: _body(),)
    );

  }

   _body() {
    return Form(
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: _tLogin,
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
                  onPressed: _onClickLogin,
              )
              
            )
          ],
        ),
      );
  }

  void _onClickLogin() {
    final login = _tLogin.text;
    final senha = _tSenha.text;

    print("Login: $login, senha: $senha");
  }
}



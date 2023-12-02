import 'package:agroapp/screens/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/usuario.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final String logo =
      'https://media.istockphoto.com/id/1176133814/pt/vetorial/agro-farm-icon-design.jpg?s=170667a&w=0&k=20&c=9lO37IXMeo-r1gFdoYVwj5wjgjV-aF6xZbHjdtVHf0U=';
  final TextEditingController _controllerLogin =
      TextEditingController(text: '');
  final TextEditingController _controllerSenha =
      TextEditingController(text: '');

  void navigateMenu() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Menu() //Menu(),
          ),
    );
  }

  logarUsuario(Usuario usuario) async {
    try {
      final credencial = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usuario.email, password: usuario.senha);

      navigateMenu();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(logo),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          TextField(
            controller: _controllerLogin,
            decoration: const InputDecoration(
              hintText: 'Login',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: _controllerSenha,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Senha',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    logarUsuario(Usuario(
                        email: _controllerLogin.text,
                        senha: _controllerSenha.text));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 60),
                  ),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

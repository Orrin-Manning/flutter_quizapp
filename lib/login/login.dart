import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/services/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const FlutterLogo(
                size: 150,
              ),
              Flexible(
                child: LoginButton(
                  text: 'Sign in with Google',
                  icon: FontAwesomeIcons.google,
                  color: Colors.blue,
                  loginMethod: AuthService().googleLogin,
                ),
              ),
              Flexible(
                child: LoginButton(
                  text: 'Continue as Guest',
                  icon: FontAwesomeIcons.userNinja,
                  color: Colors.deepPurple,
                  loginMethod: AuthService().anonLogin,
                ),
              ),
            ],
          )),
      appBar: AppBar(
        title: const Text('Login'),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.loginMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        onPressed: () => loginMethod(),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(24),
          backgroundColor: color,
        ),
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        label: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

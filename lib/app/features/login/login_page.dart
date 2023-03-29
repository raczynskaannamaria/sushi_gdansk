import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2cc8f),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  isCreatingAccount == true
                      ? 'Create new account'
                      : 'Hello again!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xFF3d405b),
                  )),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFf4f1de),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: widget.emailController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'e-mail',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFf4f1de),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: widget.passwordController,
                  decoration: const InputDecoration(hintText: 'password'),
                  obscureText: true,
                ),
              ),
              Text(errorMessage),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  if (isCreatingAccount == true) {
                    try {
                      // rejestracja
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    }
                  } else {
                    // logowanie
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    }
                  }
                  ;
                },
                child: Text(isCreatingAccount == true ? 'Join now' : 'Sign in'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF81b29a)),
              ),
              const SizedBox(height: 20),
              if (isCreatingAccount == false) ...[
                TextButton(
                  onPressed: () async {
                    setState(() {
                      isCreatingAccount = true;
                    });
                  },
                  child: Text('Create new account'),
                  style: TextButton.styleFrom(
                    primary: Color(0xFF3d405b),
                  ),
                ),
              ],
              if (isCreatingAccount == true) ...[
                TextButton(
                  onPressed: () async {
                    setState(() {
                      isCreatingAccount = false;
                    });
                  },
                  child: Text('Already have an account?'),
                  style: TextButton.styleFrom(
                    primary: Color(0xFF3d405b),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

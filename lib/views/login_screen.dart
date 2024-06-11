import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.onLoginButton});
  final void Function() onLoginButton;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 94, 255),
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      filled: true,
                      hintText: 'Email',
                      hintStyle: const TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 233, 233, 233),
                            width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 0, 94, 255), width: 3),
                          borderRadius: BorderRadius.circular(12))),
                  style:
                      const TextStyle(color: Color.fromARGB(255, 0, 94, 255)),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      filled: true,
                      hintText: 'Pin',
                      hintStyle: const TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 233, 233, 233),
                            width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 0, 94, 255), width: 3),
                          borderRadius: BorderRadius.circular(12))),
                  style:
                      const TextStyle(color: Color.fromARGB(255, 0, 94, 255)),
                  obscureText: true,
                ),
                const SizedBox(height: 100),
                ElevatedButton(
                  onPressed: widget.onLoginButton,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 94, 255),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Loginkan',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

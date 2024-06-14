import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('result'),
        ElevatedButton(onPressed: (){}, child: Text('Login')),
      ],
    );
  }
}

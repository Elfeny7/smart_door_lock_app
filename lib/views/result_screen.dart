import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.onFinishButton});
  final void Function() onFinishButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('result'),
        ElevatedButton(onPressed: onFinishButton, child: Text('Login')),
      ],
    );
  }
}

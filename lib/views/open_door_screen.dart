import 'package:flutter/material.dart';

class OpenDoorScreen extends StatelessWidget {
  const OpenDoorScreen({super.key, required this.onOpenDoorButton});
  final void Function() onOpenDoorButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('open door'),
        ElevatedButton(onPressed: onOpenDoorButton, child: Text('Open this door')),
      ],
    );
  }
}

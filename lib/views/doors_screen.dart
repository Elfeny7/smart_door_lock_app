import 'package:flutter/material.dart';

class DoorsScreen extends StatelessWidget {
  const DoorsScreen({super.key, required this.onSelectDoorButton});
  final void Function() onSelectDoorButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('doors'),
        ElevatedButton(onPressed: onSelectDoorButton, child: Text('Open Doors')),
      ],
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_door_lock_app/services/door_service.dart';

class OpenDoorScreen extends StatefulWidget {
  const OpenDoorScreen({super.key, required this.door, required this.pin});
  final Map<String, dynamic> door;
  final String pin;

  @override
  State<OpenDoorScreen> createState() => _OpenDoorScreenState();
}

class _OpenDoorScreenState extends State<OpenDoorScreen> {
  void _handleOpenDoor() async {
    await DoorService.mobilePost(widget.pin, widget.door);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open ${widget.door['name']} Door'),
        backgroundColor: const Color.fromARGB(255, 0, 94, 255),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Text("Door Name: ${widget.door['name']}", style: const TextStyle(fontSize: 17),),
                  Text("Door class: ${widget.door['class_name']}", style: const TextStyle(fontSize: 17),),
                  Text("Door Location: ${widget.door['location']}", style: const TextStyle(fontSize: 17),),
                ],
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: _handleOpenDoor,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 94, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                ),
                child: const Text('Open this door'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

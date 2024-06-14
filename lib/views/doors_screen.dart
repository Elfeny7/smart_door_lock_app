import 'package:flutter/material.dart';
import 'package:smart_door_lock_app/route/route.dart';
import 'package:smart_door_lock_app/views/open_door_screen.dart';
import '../services/door_service.dart';

class DoorsScreen extends StatefulWidget {
  final String userId;
  final String pin;

  const DoorsScreen({super.key, required this.userId, required this.pin});

  @override
  State<DoorsScreen> createState() => _DoorsScreenState();
}

class _DoorsScreenState extends State<DoorsScreen> {
  List<Map<String, dynamic>> doors = [];

  @override
  void initState() {
    super.initState();
    _loadDoors();
  }

  Future<void> _loadDoors() async {
    if (widget.userId.isNotEmpty) {
      try {
        List<Map<String, dynamic>> userDoors =
            await DoorService.doorsByUser(widget.userId);
        setState(() {
          doors = userDoors;
        });
      } catch (e) {
        print('Failed to load doors: $e');
      }
    } else {
      print('User ID is empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 94, 255),
        title: const Text('Registered Doors'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: doors.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: doors.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> door = doors[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      tileColor: const Color.fromARGB(255, 234, 234, 234),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: Text(
                        door['name'] ?? 'Unnamed Door',
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 18),
                      ),
                      subtitle: Text(
                        '${door['class_name']}',
                        style: const TextStyle(fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OpenDoorScreen(
                                    door: door, pin: widget.pin)));
                      },
                    ),
                  );
                },
              ),
        ),
      ),
    );
  }
}

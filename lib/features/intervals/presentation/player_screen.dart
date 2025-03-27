import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  final String id;
  const PlayerScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Player')),
      body: Column(
        children: [ElevatedButton(child: const Text('Play'), onPressed: () {})],
      ),
    );
  }
}

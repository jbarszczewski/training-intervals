import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String id;

  const DetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interval details'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.amber,
              size: 24,
              semanticLabel: 'Settings',
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: const Text('Play'),
            onPressed:
                () => Navigator.pushNamed(context, "/intervals/{$id}/play"),
          ),
        ],
      ),
    );
  }
}

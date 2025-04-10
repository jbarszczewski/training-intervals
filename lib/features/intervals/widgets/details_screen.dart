import 'package:flutter/material.dart';

import '../../../config/service_locator.dart';
import '../managers/interval_manager.dart';

class DetailsScreen extends StatelessWidget {
  final String id;

  final IntervalManager _intervalManager = getIt<IntervalManager>();
  DetailsScreen({super.key, required this.id}) {
    // Load the interval
    _intervalManager.loadInterval(id);
  }

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
          Text(id),
          ListenableBuilder(
            listenable: _intervalManager,
            builder: (context, _) {
              final interval = _intervalManager.interval;
              return Column(
                children: [
                  Text(interval.title),
                  Text('Steps: ${interval.steps.length}'),
                  Text('Rest duration: ${interval.stepRestDuration}'),
                ],
              );
            },
          ),
          ElevatedButton(
            child: const Text('Play'),
            onPressed:
                () => Navigator.pushNamed(context, "/intervals/$id/play"),
          ),
        ],
      ),
    );
  }
}

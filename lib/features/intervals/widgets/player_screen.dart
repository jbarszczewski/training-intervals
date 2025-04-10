import 'dart:async';

import 'package:flutter/material.dart';

import '../../../config/service_locator.dart';
import '../managers/interval_manager.dart';

class PlayerScreen extends StatefulWidget {
  final String id;

  const PlayerScreen({super.key, required this.id});

  @override
  PlayerScreenState createState() => PlayerScreenState();
}

class PlayerScreenState extends State<PlayerScreen> {
  final IntervalManager _intervalManager = getIt<IntervalManager>();
  Timer? _timer;
  int? _remainingTime;
  bool _isPaused = true;

  @override
  Widget build(BuildContext context) {
    final interval = _intervalManager.interval;
    return Scaffold(
      appBar: AppBar(title: Text('Player')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Playing: ${interval.title}'),
          if (_remainingTime != null)
            Text('Remaining Time: $_remainingTime seconds'),
          ElevatedButton(
            onPressed:
                _isPaused
                    ? () => _startTimer(interval.restDuration)
                    : _pauseTimer,
            child: Text(_isPaused ? 'Play' : 'Pause'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _pauseTimer() {
    setState(() {
      _isPaused = true;
    });
    _timer?.cancel();
  }

  void _startTimer(int duration) {
    setState(() {
      _remainingTime ??= duration;
      _isPaused = false;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime == null || _remainingTime! <= 0) {
        timer.cancel();
      } else {
        setState(() {
          _remainingTime = _remainingTime! - 1;
        });
      }
    });
  }
}

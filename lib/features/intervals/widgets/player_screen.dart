import 'dart:async';

import 'package:flutter/material.dart';

import '../../../config/service_locator.dart';
import '../managers/interval_manager.dart';
import 'duration_progress_bar.dart';

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
  int _currentStepIndex = 0;
  int _currentSetIndex = 0;
  bool _isResting = false;
  bool _isSetResting = false;

  @override
  Widget build(BuildContext context) {
    final interval = _intervalManager.interval;
    return Scaffold(
      appBar: AppBar(
        title: Text(interval.title),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _resetTimer),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DurationProgressBar(
            currentDuration: _remainingTime ?? 0,
            totalDuration:
                _isSetResting
                    ? interval.setRestDuration
                    : _isResting
                    ? interval.stepRestDuration
                    : interval.steps[_currentStepIndex].duration,
          ),
          Text('Set ${_currentSetIndex + 1} of ${interval.numberOfSets}'),
          if (_isSetResting)
            Text('Set Rest Duration: ${interval.setRestDuration} seconds'),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  interval.steps.length * 2 -
                  1, // Steps + rest durations for the current set
              itemBuilder: (context, index) {
                final isRest = index % 2 == 1;
                final stepIndex = index ~/ 2;
                final isActive =
                    (isRest
                        ? _isResting && _currentStepIndex == stepIndex
                        : !_isResting && _currentStepIndex == stepIndex);

                return ListTile(
                  title: Text(
                    isRest
                        ? 'Rest (${interval.stepRestDuration} seconds)'
                        : '${interval.steps[stepIndex].title} (${interval.steps[stepIndex].duration} seconds)',
                  ),
                  tileColor: isActive ? Colors.blue.withAlpha(64) : null,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _isPaused ? () => _startTimer(interval) : _pauseTimer,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 100), // 2x bigger button
              ),
              child: Text(
                _isPaused ? 'Play' : 'Pause',
                style: const TextStyle(
                  fontSize: 24,
                ), // Adjust font size for larger button
              ),
            ),
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

  void _onStepComplete(dynamic interval) {
    if (_isSetResting) {
      if (_currentSetIndex < interval.numberOfSets - 1) {
        setState(() {
          _currentSetIndex++;
          _currentStepIndex = 0;
          _isSetResting = false;
          _isResting = false;
          _remainingTime = interval.steps[_currentStepIndex].duration;
        });
      } else {
        _timer?.cancel();
        setState(() {
          _remainingTime = null;
          _isPaused = true;
        });
      }
    } else if (_isResting) {
      if (_currentStepIndex < interval.steps.length - 1) {
        setState(() {
          _currentStepIndex++;
          _isResting = false;
          _remainingTime = interval.steps[_currentStepIndex].duration;
        });
      } else {
        // Skip the last step rest and go straight to set rest
        setState(() {
          _isResting = false;
          _isSetResting = true;
          _remainingTime = interval.setRestDuration;
        });
      }
    } else {
      if (_currentStepIndex == interval.steps.length - 1) {
        // If it's the last step, skip to set rest
        setState(() {
          _isSetResting = true;
          _remainingTime = interval.setRestDuration;
        });
      } else {
        setState(() {
          _isResting = true;
          _remainingTime = interval.stepRestDuration;
        });
      }
    }
  }

  void _pauseTimer() {
    setState(() {
      _isPaused = true;
    });
    _timer?.cancel();
  }

  void _resetTimer() {
    setState(() {
      _timer?.cancel();
      _remainingTime = null;
      _isPaused = true;
      _currentStepIndex = 0;
      _currentSetIndex = 0;
      _isResting = false;
      _isSetResting = false;
    });
  }

  void _startTimer(dynamic interval) {
    setState(() {
      _isPaused = false;
      _remainingTime ??=
          _isSetResting
              ? interval.setRestDuration
              : _isResting
              ? interval.restDuration
              : interval.steps[_currentStepIndex].duration;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime == null || _remainingTime! <= 0) {
        _onStepComplete(interval);
      } else {
        setState(() {
          _remainingTime = _remainingTime! - 1;
        });
      }
    });
  }
}

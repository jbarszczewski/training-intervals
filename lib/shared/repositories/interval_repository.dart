import 'package:uuid/uuid.dart';

import '../../features/intervals/models/interval.dart';

class IntervalRepository {
  // list of intervals
  List<Interval> intervals = [
    Interval(
      id: Uuid().v4(),
      title: 'short one',
      steps: [
        Step(id: Uuid().v4(), title: 'Step 1', duration: 5),
        Step(id: Uuid().v4(), title: 'Step 2', duration: 6),
        Step(id: Uuid().v4(), title: 'Step 3', duration: 3),
      ],
      numberOfSets: 2,
      stepRestDuration: 5,
      setRestDuration: 10,
    ),
    Interval(
      id: Uuid().v4(),
      title: 'long steps',
      steps: [
        Step(id: Uuid().v4(), title: 'Step 1', duration: 60),
        Step(id: Uuid().v4(), title: 'Step 2', duration: 160),
      ],
      numberOfSets: 3,
      setRestDuration: 100,
      stepRestDuration: 15,
    ),
    Interval(
      id: Uuid().v4(),
      title: 'lot of steps in 1 set',
      steps: [
        Step(id: Uuid().v4(), title: 'Step 3', duration: 5),
        Step(id: Uuid().v4(), title: 'Step 2', duration: 9),
        Step(id: Uuid().v4(), title: 'Step 1', duration: 3),
        Step(id: Uuid().v4(), title: 'Step 4', duration: 7),
        Step(id: Uuid().v4(), title: 'Step 5', duration: 2),
        Step(id: Uuid().v4(), title: 'Step 6', duration: 1),
        Step(id: Uuid().v4(), title: 'Step 7', duration: 4),
        Step(id: Uuid().v4(), title: 'Step 8', duration: 8),
        Step(id: Uuid().v4(), title: 'Step 9', duration: 6),
        Step(id: Uuid().v4(), title: 'Step 10', duration: 10),
        Step(id: Uuid().v4(), title: 'Step 11', duration: 12),
        Step(id: Uuid().v4(), title: 'Step 12', duration: 14),
        Step(id: Uuid().v4(), title: 'Step 13', duration: 16),
        Step(id: Uuid().v4(), title: 'Step 14', duration: 18),
        Step(id: Uuid().v4(), title: 'Step 15', duration: 20),
        Step(id: Uuid().v4(), title: 'Step 16', duration: 22),
      ],
      numberOfSets: 1,
      setRestDuration: 0,
      stepRestDuration: 2,
    ),
    Interval(
      id: Uuid().v4(),
      title: 'Interval 3',
      steps: [
        Step(id: Uuid().v4(), title: 'Step 4', duration: 60),
        Step(id: Uuid().v4(), title: 'Step 1', duration: 120),
      ],
      stepRestDuration: 30,
      numberOfSets: 4,
      setRestDuration: 15,
    ),
  ];

  Future<void> addInterval(Interval interval) async {
    return Future.delayed(const Duration(seconds: 1), () {
      intervals.add(interval);
    });
  }

  Future<void> deleteInterval(Interval interval) async {
    return Future.delayed(const Duration(seconds: 1), () {
      intervals.removeWhere((i) => i.id == interval.id);
    });
  }

  Interval getInterval(String id) {
    return intervals.firstWhere((interval) => interval.id == id);
  }

  Future<List<Interval>> getIntervals() async {
    return Future.delayed(const Duration(seconds: 1), () => intervals);
  }

  Future<void> updateInterval(Interval interval) async {
    return Future.delayed(const Duration(seconds: 1), () {
      final index = intervals.indexWhere((i) => i.id == interval.id);
      if (index != -1) {
        intervals[index] = interval;
      }
    });
  }
}

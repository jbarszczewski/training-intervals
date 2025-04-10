import 'package:uuid/uuid.dart';

import '../../features/intervals/models/interval.dart';

class IntervalRepository {
  // list of intervals
  List<Interval> intervals = [
    Interval(
      id: Uuid().v4(),
      title: 'Interval 1',
      steps: [
        Step(id: Uuid().v4(), title: 'Step 1', duration: 30),
        Step(id: Uuid().v4(), title: 'Step 2', duration: 60),
      ],
      restDuration: 15,
    ),
    Interval(
      id: Uuid().v4(),
      title: 'Interval 2',
      steps: [
        Step(id: Uuid().v4(), title: 'Step 3', duration: 45),
        Step(id: Uuid().v4(), title: 'Step 2', duration: 90),
      ],
      restDuration: 20,
    ),
    Interval(
      id: Uuid().v4(),
      title: 'Interval 3',
      steps: [
        Step(id: Uuid().v4(), title: 'Step 4', duration: 60),
        Step(id: Uuid().v4(), title: 'Step 1', duration: 120),
      ],
      restDuration: 30,
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

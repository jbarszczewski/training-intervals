import '../models/interval.dart';

abstract class IIntervalRepository {
  Future<void> addInterval(Interval interval);
  Future<void> deleteInterval(Interval interval);
  Future<List<Interval>> getIntervals();
  Future<void> updateInterval(Interval interval);
}

class IntervalRepository implements IIntervalRepository {
  @override
  Future<void> addInterval(Interval interval) async {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> deleteInterval(Interval interval) async {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<List<Interval>> getIntervals() async {
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        Interval(id: '1', title: 'Interval 1'),
        Interval(id: '2', title: 'Interval 2'),
        Interval(id: '3', title: 'Interval 3'),
      ],
    );
  }

  @override
  Future<void> updateInterval(Interval interval) async {
    return Future.delayed(const Duration(seconds: 1));
  }
}

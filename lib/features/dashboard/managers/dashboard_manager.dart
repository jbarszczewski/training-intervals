import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

import '../../../shared/repositories/interval_repository.dart';
import '/features/intervals/models/interval.dart';

class DashboardManager with ChangeNotifier {
  final _intervalRepository = GetIt.instance<IntervalRepository>();

  List<Interval> _intervals = [];

  DashboardManager() {
    _loadIntervals();
  }

  List<Interval> get intervals => _intervals;
  void addInterval(Interval interval) {
    interval = interval.copyWith(id: Uuid().v4());
    _intervalRepository.addInterval(interval);
    _intervals.add(interval);
    notifyListeners();
  }

  void removeInterval(Interval interval) {
    _intervalRepository.deleteInterval(interval);
    _intervals.remove(interval);
    notifyListeners();
  }

  Future<void> _loadIntervals() async {
    _intervals = await _intervalRepository.getIntervals();
    notifyListeners();
  }
}

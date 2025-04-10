import 'package:flutter/foundation.dart';

import '../../../config/service_locator.dart';
import '../../../shared/repositories/interval_repository.dart';
import '../models/interval.dart';

class IntervalManager with ChangeNotifier {
  final _intervalRepository = getIt<IntervalRepository>();
  Interval _interval = Interval(
    id: '',
    title: '',
    steps: [],
    stepRestDuration: 0,
    numberOfSets: 0,
    setRestDuration: 0,
  );
  Interval get interval => _interval;

  void loadInterval(String id) {
    _interval = _intervalRepository.getInterval(id);
    notifyListeners();
  }
}

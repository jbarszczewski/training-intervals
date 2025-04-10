import 'package:get_it/get_it.dart';

import '../features/dashboard/managers/dashboard_manager.dart';
import '../features/intervals/managers/interval_manager.dart';
import '../shared/repositories/interval_repository.dart';

final GetIt getIt = GetIt.instance;

void registerDependencies() {
  // Register repositories
  getIt.registerSingleton<IntervalRepository>(IntervalRepository());

  // Register managers
  getIt.registerSingleton<DashboardManager>(DashboardManager());
  getIt.registerSingleton<IntervalManager>(IntervalManager());
}

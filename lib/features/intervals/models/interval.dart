class Interval {
  final String id;
  final String title;
  final List<Step> steps;
  final int restDuration;

  Interval({
    required this.id,
    required this.title,
    required this.steps,
    required this.restDuration,
  });

  Interval copyWith({String? id, String? title}) {
    return Interval(
      id: id ?? this.id,
      title: title ?? this.title,
      steps: steps,
      restDuration: restDuration,
    );
  }
}

class Step {
  final String id;
  final String title;
  final int duration;

  Step({required this.id, required this.title, required this.duration});

  Step copyWith({String? id, String? title, int? duration}) {
    return Step(
      id: id ?? this.id,
      title: title ?? this.title,
      duration: duration ?? this.duration,
    );
  }
}

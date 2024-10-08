import 'package:meta/meta.dart';

class Exercise {
  final String exerciseId;
  final String? name;
  final String? url;
  final bool? status;
  final DateTime? deleteAt;

  Exercise({
    required this.exerciseId,
    this.name,
    this.url,
    this.status,
    this.deleteAt,
  });

  Exercise.empty(this.name, this.url, this.status, this.deleteAt) : exerciseId = '';

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      exerciseId: json['exercise_id'] as String,
      name: json['name'] as String?,
      url: json['url'] as String?,
      status: json['status'] != null ? json['status'] == 1 : null,
      deleteAt: json['delete_at'] != null
          ? DateTime.parse(json['delete_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exercise_id': exerciseId,
      'name': name,
      'url': url,
      'status': status != null ? (status! ? 1 : 0) : null,
      'delete_at': deleteAt?.toIso8601String(),
    };
  }

  Exercise copyWith({
    String? exerciseId,
    String? name,
    String? url,
    bool? status,
    DateTime? deleteAt,
  }) {
    return Exercise(
      exerciseId: exerciseId ?? this.exerciseId,
      name: name ?? this.name,
      url: url ?? this.url,
      status: status ?? this.status,
      deleteAt: deleteAt ?? this.deleteAt,
    );
  }

  @override
  String toString() {
    return 'Exercise(exerciseId: $exerciseId, name: $name, url: $url, status: $status, deleteAt: $deleteAt)';
  }
}

import 'dart:convert';

class Poll {
  final int id;
  String title;
  String description;
  bool voted;
  List<String> options;
  List<int> votes;

  Poll({
    required this.id,
    required this.title,
    required this.description,
    required this.voted,
    required this.options,
    required this.votes,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'voted': voted});
    result.addAll({'options': options});
    result.addAll({'votes': votes});

    return result;
  }

  factory Poll.fromMap(Map<String, dynamic> map) {
    return Poll(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      voted: map['voted'] ?? false,
      options: List<String>.from(map['options']),
      votes: List<int>.from(map['votes']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Poll.fromJson(String source) => Poll.fromMap(json.decode(source));

  Poll copyWith({
    int? id,
    String? title,
    String? description,
    bool? voted,
    List<String>? options,
    List<int>? votes,
  }) {
    return Poll(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      voted: voted ?? this.voted,
      options: options ?? this.options,
      votes: votes ?? this.votes,
    );
  }
}

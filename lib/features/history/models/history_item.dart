class HistoryItem {
  final String mode;
  final String time;
  final String result;
  final bool isAI;

  HistoryItem({
    required this.mode,
    required this.time,
    required this.result,
    required this.isAI,
  });

  Map<String, dynamic> toJson() => {
    'mode': mode,
    'time': time,
    'result': result,
    'isAI': isAI,
  };

  factory HistoryItem.fromJson(Map<String, dynamic> json) {
    return HistoryItem(
      mode: json['mode'],
      time: json['time'],
      result: json['result'],
      isAI: json['isAI'],
    );
  }
}
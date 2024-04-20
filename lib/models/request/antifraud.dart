class Antifraud {
  Antifraud({
    required this.sessionId,
    required this.location,
    required this.userAgent,
  });

  factory Antifraud.fromJson(Map<String, dynamic> json) => Antifraud(
        sessionId: json['session_id'] as String,
        location: json['location'] as String,
        userAgent: json['user_agent'] as String,
      );

  final String sessionId;
  final String location;
  final String userAgent;

  Map<String, dynamic> toJson() => {
        'session_id': sessionId,
        'location': location,
        'user_agent': userAgent,
      };
}

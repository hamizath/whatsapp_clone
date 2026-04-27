// lib/models/call.dart
// Représente un appel dans l'historique

class Call {
  final String id;
  final String contactName;      // nom du contact
  final String time;             // heure de l'appel
  final String date;             // date ex: "Hier", "22/02/2026"
  final CallType type;           // audio ou vidéo
  final CallDirection direction; // entrant ou sortant
  final bool isMissed;           // true si appel manqué

  const Call({
    required this.id,
    required this.contactName,
    required this.time,
    required this.date,
    required this.type,
    required this.direction,
    this.isMissed = false,
  });
}

enum CallType { audio, video }
enum CallDirection { incoming, outgoing }
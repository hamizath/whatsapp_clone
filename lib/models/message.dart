// lib/models/message.dart
// Représente un message dans une conversation

class Message {
  final String id;
  final String content;       // texte du message
  final bool isSent;          // true = envoyé par moi, false = reçu
  final String time;          // heure d'envoi ex: "14:35"
  final MessageType type;     // texte, audio, image
  final bool isRead;          // true si le destinataire a lu

  const Message({
    required this.id,
    required this.content,
    required this.isSent,
    required this.time,
    this.type = MessageType.text,
    this.isRead = false,
  });
}

enum MessageType { text, audio, image }
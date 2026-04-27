// lib/models/conversation.dart
// Représente une conversation dans la liste des discussions

class Conversation {
  final String id;
  final String name;            // nom du contact ou groupe
  final String lastMessage;     // dernier message affiché
  final String time;            // heure ou date du dernier message
  final int unreadCount;        // nombre de messages non lus
  final bool isGroup;           // true si c'est un groupe
  final String? avatarEmoji;    // emoji de l'avatar
  final String? avatarColor;    // couleur hex du fond de l'avatar
  final bool isMuted;           // conversation en silencieux
  final MessageStatus? status;  // état du dernier message envoyé

  const Conversation({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
    this.isGroup = false,
    this.avatarEmoji,
    this.avatarColor,
    this.isMuted = false,
    this.status,
  });
}

// État d'un message : envoyé, livré, lu
enum MessageStatus { sent, delivered, read }
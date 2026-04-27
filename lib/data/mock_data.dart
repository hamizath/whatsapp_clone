// lib/data/mock_data.dart
// Toutes les données statiques de l'application (pas de backend)
// Basées sur le screenshot WhatsApp fourni

import '../models/conversation.dart';
import '../models/message.dart';
import '../models/call.dart';

// ── Conversations ─────────────────────────────────────────────────────────────
final List<Conversation> mockConversations = [
  const Conversation(
    id: '1',
    name: 'Rechercher',
    lastMessage: 'Appel vocal',
    time: '17/03/2026',
    avatarEmoji: '👥',
    avatarColor: '#1565C0',
    status: MessageStatus.delivered,
  ),
  const Conversation(
    id: '2',
    name: 'Projet tuteuré',
    lastMessage: 'Jose: Moi je ne sais pas ce que je vais lui dire',
    time: '12/03/2026',
    isGroup: true,
    avatarEmoji: '👥',
    avatarColor: '#25D366',
  ),
  const Conversation(
    id: '3',
    name: '+229 61 02 07 13',
    lastMessage: 'Tranquille',
    time: '11/03/2026',
    avatarEmoji: '🧑',
    avatarColor: '#E53935',
    status: MessageStatus.read,
  ),
  const Conversation(
    id: '4',
    name: 'Imdad',
    lastMessage: 'Ça va? Je suis o boulot actuellement et toi',
    time: '11/03/2026',
    unreadCount: 2,
    avatarEmoji: '🕌',
    avatarColor: '#4A148C',
  ),
  const Conversation(
    id: '5',
    name: 'Gozem',
    lastMessage: '1329 is your verification code. Do not share this code.',
    time: '01/03/2026',
    unreadCount: 3,
    avatarEmoji: '🛵',
    avatarColor: '#00897B',
  ),
  const Conversation(
    id: '6',
    name: '+229 53 89 07 44',
    lastMessage: 'Un instant',
    time: '22/02/2026',
    avatarEmoji: '🧑',
    avatarColor: '#37474F',
    status: MessageStatus.read,
  ),
  const Conversation(
    id: '7',
    name: '+229 50 97 38 09',
    lastMessage: "D'accord  Merci beaucoup",
    time: '21/02/2026',
    avatarEmoji: '💰',
    avatarColor: '#212121',
  ),
  const Conversation(
    id: '8',
    name: '+229 62 68 46 50',
    lastMessage: 'Le petit ou le grand',
    time: '18/02/2026',
    avatarEmoji: '🎲',
    avatarColor: '#F57C00',
    status: MessageStatus.read,
  ),
  const Conversation(
    id: '9',
    name: '+228 96 49 19 51',
    lastMessage: 'Bienvenue chez Hami Beauty Cosmétique ✨',
    time: '18/02/2026',
    avatarEmoji: '💄',
    avatarColor: '#AD1457',
  ),
];

// ── Messages par conversation ─────────────────────────────────────────────────
final Map<String, List<Message>> mockMessages = {
  '4': [
    const Message(id: 'm1', content: 'Salut !', isSent: true, time: '10:12', isRead: true),
    const Message(id: 'm2', content: 'Salut ! Comment tu vas ?', isSent: false, time: '10:13'),
    const Message(id: 'm3', content: 'Je vais bien merci, et toi ?', isSent: true, time: '10:14', isRead: true),
    const Message(id: 'm4', content: 'Ça va? Je suis o boulot actuellement et toi', isSent: false, time: '10:15'),
    const Message(id: 'm5', content: 'Je suis à la maison, en train de coder 😄', isSent: true, time: '10:16'),
  ],
  '2': [
    const Message(id: 'g1', content: 'Bonjour à tous !', isSent: false, time: '09:00'),
    const Message(id: 'g2', content: 'Salut, on commence le TP aujourd\'hui ?', isSent: true, time: '09:05', isRead: true),
    const Message(id: 'g3', content: 'Jose: Moi je ne sais pas ce que je vais lui dire', isSent: false, time: '12:30'),
  ],
  '5': [
    const Message(id: 'z1', content: 'Votre code de vérification Gozem est : 1329', isSent: false, time: '11:00'),
    const Message(id: 'z2', content: '1329 is your verification code. Do not share this code.', isSent: false, time: '11:01'),
  ],
};

// ── Appels ────────────────────────────────────────────────────────────────────
final List<Call> mockCalls = [
  const Call(
    id: 'c1',
    contactName: 'Imdad',
    time: '10:30',
    date: "Aujourd'hui",
    type: CallType.audio,
    direction: CallDirection.outgoing,
  ),
  const Call(
    id: 'c2',
    contactName: '+229 61 02 07 13',
    time: '17:45',
    date: 'Hier',
    type: CallType.video,
    direction: CallDirection.incoming,
    isMissed: true,
  ),
  const Call(
    id: 'c3',
    contactName: 'Projet tuteuré',
    time: '09:15',
    date: '11/03/2026',
    type: CallType.audio,
    direction: CallDirection.outgoing,
  ),
  const Call(
    id: 'c4',
    contactName: '+229 53 89 07 44',
    time: '20:00',
    date: '22/02/2026',
    type: CallType.audio,
    direction: CallDirection.incoming,
  ),
  const Call(
    id: 'c5',
    contactName: '+229 50 97 38 09',
    time: '14:22',
    date: '21/02/2026',
    type: CallType.video,
    direction: CallDirection.outgoing,
  ),
];
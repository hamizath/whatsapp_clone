// lib/screens/chat_screen.dart
// Écran d'une conversation : bulles de messages + champ de saisie

import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/conversation.dart';
import '../models/message.dart';
import '../theme/app_theme.dart';
import '../widgets/avatar_widget.dart';

class ChatScreen extends StatefulWidget {
  final Conversation conversation;
  const ChatScreen({super.key, required this.conversation});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late List<Message> _messages;

  @override
  void initState() {
    super.initState();
    _messages = List.from(mockMessages[widget.conversation.id] ?? []);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final now = TimeOfDay.now();
    final h = now.hour.toString().padLeft(2, '0');
    final m = now.minute.toString().padLeft(2, '0');

    setState(() {
      _messages.add(Message(
        id: 'm${_messages.length + 1}',
        content: text,
        isSent: true,
        time: '$h:$m',
      ));
      _controller.clear();
    });

    // Scroll automatique vers le bas
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.darkGreen,
        leadingWidth: 30,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            AvatarWidget(
              emoji: widget.conversation.avatarEmoji,
              colorHex: widget.conversation.avatarColor,
              size: 38,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.conversation.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: AppTheme.white, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget.conversation.isGroup ? 'Groupe' : 'En ligne',
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.videocam, color: AppTheme.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.call, color: AppTheme.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert, color: AppTheme.white), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Zone messages fond beige
          Expanded(
            child: Container(
              color: AppTheme.background,
              child: _messages.isEmpty
                  ? const Center(child: Text('Aucun message', style: TextStyle(color: AppTheme.textSecondary)))
                  : ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) => _MessageBubble(message: _messages[index]),
                    ),
            ),
          ),
          // Barre de saisie
          Container(
            color: AppTheme.inputBar,
            padding: EdgeInsets.only(
              left: 8, right: 8, top: 6,
              bottom: MediaQuery.of(context).viewInsets.bottom + 6,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.emoji_emotions_outlined, color: AppTheme.iconColor),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    maxLines: null,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      hintText: 'Message',
                      hintStyle: const TextStyle(color: AppTheme.textSecondary),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _controller,
                  builder: (_, value, __) {
                    final hasText = value.text.trim().isNotEmpty;
                    return Container(
                      margin: const EdgeInsets.only(left: 8),
                      decoration: const BoxDecoration(
                        color: AppTheme.primaryGreen,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(hasText ? Icons.send : Icons.mic, color: AppTheme.white, size: 22),
                        onPressed: hasText ? _sendMessage : () {},
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Bulle de message ──────────────────────────────────────────────────────────
class _MessageBubble extends StatelessWidget {
  final Message message;
  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isSent = message.isSent;
    final maxWidth = MediaQuery.of(context).size.width * 0.75;

    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        constraints: BoxConstraints(maxWidth: maxWidth),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSent ? AppTheme.sentBubble : AppTheme.receivedBubble,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: Radius.circular(isSent ? 12 : 0),
            bottomRight: Radius.circular(isSent ? 0 : 12),
          ),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 2, offset: const Offset(0, 1))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(message.content, style: const TextStyle(fontSize: 15, color: AppTheme.textPrimary, height: 1.3)),
            const SizedBox(height: 2),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(message.time, style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
                if (isSent) ...[
                  const SizedBox(width: 3),
                  Icon(
                    message.isRead ? Icons.done_all : Icons.done,
                    size: 14,
                    color: message.isRead ? AppTheme.checkBlue : AppTheme.textSecondary,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
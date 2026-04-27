// lib/screens/discussions_screen.dart
// Écran principal : liste de toutes les conversations

import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/conversation.dart';
import '../theme/app_theme.dart';
import '../widgets/avatar_widget.dart';
import '../widgets/message_status_icon.dart';
import 'chat_screen.dart';

class DiscussionsScreen extends StatefulWidget {
  const DiscussionsScreen({super.key});

  @override
  State<DiscussionsScreen> createState() => _DiscussionsScreenState();
}

class _DiscussionsScreenState extends State<DiscussionsScreen> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Filtre les conversations selon la recherche
  List<Conversation> get _filtered {
    if (_searchQuery.isEmpty) return mockConversations;
    return mockConversations
        .where((c) => c.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.chatListBg,
      appBar: AppBar(
        backgroundColor: AppTheme.darkGreen,
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                style: const TextStyle(color: AppTheme.white),
                cursorColor: AppTheme.white,
                decoration: const InputDecoration(
                  hintText: 'Rechercher...',
                  hintStyle: TextStyle(color: Colors.white60),
                  border: InputBorder.none,
                ),
                onChanged: (v) => setState(() => _searchQuery = v),
              )
            : const Text('Discussions',
                style: TextStyle(color: AppTheme.white, fontWeight: FontWeight.w600)),
        actions: [
          if (!_isSearching)
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined, color: AppTheme.white),
              onPressed: () {},
            ),
          if (!_isSearching)
            IconButton(
              icon: const Icon(Icons.more_vert, color: AppTheme.white),
              onPressed: () {},
            ),
          if (_isSearching)
            IconButton(
              icon: const Icon(Icons.close, color: AppTheme.white),
              onPressed: () => setState(() {
                _isSearching = false;
                _searchQuery = '';
                _searchController.clear();
              }),
            ),
        ],
      ),
      body: Column(
        children: [
          // Barre de recherche rapide sous l'AppBar
          if (!_isSearching)
            GestureDetector(
              onTap: () => setState(() => _isSearching = true),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: AppTheme.textSecondary, size: 20),
                    SizedBox(width: 8),
                    Text('Rechercher...', style: TextStyle(color: AppTheme.textSecondary)),
                  ],
                ),
              ),
            ),

          // Liste des conversations
          Expanded(
            child: ListView.builder(
              itemCount: _filtered.length,
              itemBuilder: (context, index) =>
                  _ConversationTile(conversation: _filtered[index]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.primaryGreen,
        child: const Icon(Icons.chat, color: AppTheme.white),
      ),
    );
  }
}

// ── Tuile d'une conversation ──────────────────────────────────────────────────
class _ConversationTile extends StatelessWidget {
  final Conversation conversation;
  const _ConversationTile({required this.conversation});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ChatScreen(conversation: conversation)),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppTheme.divider, width: 0.5)),
        ),
        child: Row(
          children: [
            AvatarWidget(emoji: conversation.avatarEmoji, colorHex: conversation.avatarColor, size: 52),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nom + heure
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          conversation.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: screenWidth < 360 ? 14 : 16,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ),
                      Text(
                        conversation.time,
                        style: TextStyle(
                          fontSize: 12,
                          color: conversation.unreadCount > 0
                              ? AppTheme.primaryGreen
                              : AppTheme.textSecondary,
                          fontWeight: conversation.unreadCount > 0
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  // Statut + dernier message + badge
                  Row(
                    children: [
                      if (conversation.status != null) ...[
                        MessageStatusIcon(status: conversation.status, size: 14),
                        const SizedBox(width: 3),
                      ],
                      Expanded(
                        child: Text(
                          conversation.lastMessage,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary),
                        ),
                      ),
                      if (conversation.unreadCount > 0)
                        Container(
                          margin: const EdgeInsets.only(left: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: const BoxDecoration(
                            color: AppTheme.unreadBadge,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${conversation.unreadCount}',
                            style: const TextStyle(
                              color: AppTheme.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
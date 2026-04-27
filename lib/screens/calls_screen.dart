// lib/screens/calls_screen.dart
// Écran Appels : historique des appels audio et vidéo

import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/call.dart';
import '../theme/app_theme.dart';
import '../widgets/avatar_widget.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.chatListBg,
      appBar: AppBar(
        backgroundColor: AppTheme.darkGreen,
        title: const Text('Appels', style: TextStyle(color: AppTheme.white, fontWeight: FontWeight.w600)),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: AppTheme.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert, color: AppTheme.white), onPressed: () {}),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bannière créer un lien d'appel
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
            child: const Row(
              children: [
                CircleAvatar(radius: 22, backgroundColor: AppTheme.primaryGreen, child: Icon(Icons.link, color: AppTheme.white)),
                SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Créer un lien d'appel", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                    Text('Partagez un lien pour votre appel WhatsApp', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Récents', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13, fontWeight: FontWeight.w600)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mockCalls.length,
              itemBuilder: (context, index) => _CallTile(call: mockCalls[index]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.primaryGreen,
        child: const Icon(Icons.add_call, color: AppTheme.white),
      ),
    );
  }
}

class _CallTile extends StatelessWidget {
  final Call call;
  const _CallTile({required this.call});

  @override
  Widget build(BuildContext context) {
    final nameColor = call.isMissed ? Colors.red : AppTheme.textPrimary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppTheme.divider, width: 0.5))),
      child: Row(
        children: [
          const AvatarWidget(size: 52),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(call.contactName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: nameColor)),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Icon(
                      call.direction == CallDirection.outgoing ? Icons.call_made : Icons.call_received,
                      size: 14,
                      color: call.isMissed ? Colors.red : call.direction == CallDirection.outgoing ? AppTheme.primaryGreen : AppTheme.checkBlue,
                    ),
                    const SizedBox(width: 4),
                    Text('${call.date} · ${call.time}', style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary)),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(call.type == CallType.video ? Icons.videocam : Icons.call, color: AppTheme.tealGreen),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
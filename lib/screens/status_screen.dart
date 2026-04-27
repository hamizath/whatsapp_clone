// lib/screens/status_screen.dart
// Écran Actus : mon statut + statuts récents des contacts

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/avatar_widget.dart';

const _statusData = [
  {'name': 'Imdad',            'time': 'Il y a 5 min',  'emoji': '🕌', 'color': '#4A148C'},
  {'name': '+229 61 02 07 13', 'time': 'Il y a 23 min', 'emoji': '🧑', 'color': '#E53935'},
  {'name': 'Projet tuteuré',   'time': 'Il y a 1 h',    'emoji': '👥', 'color': '#25D366'},
  {'name': '+229 53 89 07 44', 'time': 'Il y a 2 h',    'emoji': '🧑', 'color': '#37474F'},
];

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.chatListBg,
      appBar: AppBar(
        backgroundColor: AppTheme.darkGreen,
        title: const Text('Actus', style: TextStyle(color: AppTheme.white, fontWeight: FontWeight.w600)),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: AppTheme.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert, color: AppTheme.white), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
            child: Text('Mon statut', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13, fontWeight: FontWeight.w600)),
          ),
          // Mon statut
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Stack(
                  children: [
                    const AvatarWidget(emoji: '🧑‍💻', colorHex: '#075E54', size: 52),
                    Positioned(
                      bottom: 0, right: 0,
                      child: Container(
                        decoration: const BoxDecoration(color: AppTheme.primaryGreen, shape: BoxShape.circle),
                        child: const Icon(Icons.add, color: AppTheme.white, size: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 14),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mon statut', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
                    Text('Appuyer pour ajouter un statut', style: TextStyle(fontSize: 13, color: AppTheme.textSecondary)),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
            child: Text('Récents', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13, fontWeight: FontWeight.w600)),
          ),
          ..._statusData.map((s) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppTheme.divider, width: 0.5))),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(border: Border.all(color: AppTheme.primaryGreen, width: 2.5), shape: BoxShape.circle),
                  child: AvatarWidget(emoji: s['emoji'], colorHex: s['color'], size: 46),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(s['name']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
                    Text(s['time']!, style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary)),
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.primaryGreen,
        child: const Icon(Icons.edit, color: AppTheme.white),
      ),
    );
  }
}
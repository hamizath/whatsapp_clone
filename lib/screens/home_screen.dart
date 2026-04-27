// lib/screens/home_screen.dart
// Écran racine : gère la navigation entre les 5 onglets

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'discussions_screen.dart';
import 'calls_screen.dart';
import 'status_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 3; // démarre sur Discussions comme WhatsApp

  final List<Widget> _screens = [
    const StatusScreen(),
    const CallsScreen(),
    const _PlaceholderScreen(title: 'Outils'),
    const DiscussionsScreen(),
    const _PlaceholderScreen(title: 'Paramètres'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack garde tous les écrans en mémoire (pas de rechargement)
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: AppTheme.white,
        selectedItemColor: AppTheme.darkGreen,
        unselectedItemColor: AppTheme.textSecondary,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.circle_notifications_outlined),
            activeIcon: Icon(Icons.circle_notifications),
            label: 'Actus',
          ),
          BottomNavigationBarItem(
            icon: _BadgedIcon(icon: Icons.call_outlined, count: 22),
            activeIcon: _BadgedIcon(icon: Icons.call, count: 22),
            label: 'Appels',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            activeIcon: Icon(Icons.grid_view),
            label: 'Outils',
          ),
          BottomNavigationBarItem(
            icon: _BadgedIcon(icon: Icons.chat_bubble_outline, count: 5),
            activeIcon: _BadgedIcon(icon: Icons.chat_bubble, count: 5),
            label: 'Discussions',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
        ],
      ),
    );
  }
}

// Badge numérique vert sur une icône
class _BadgedIcon extends StatelessWidget {
  final IconData icon;
  final int count;
  const _BadgedIcon({required this.icon, required this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(icon),
        if (count > 0)
          Positioned(
            right: -8, top: -4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
              decoration: BoxDecoration(color: AppTheme.primaryGreen, borderRadius: BorderRadius.circular(10)),
              child: Text('$count', style: const TextStyle(color: AppTheme.white, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          ),
      ],
    );
  }
}

// Écran placeholder pour les onglets non implémentés
class _PlaceholderScreen extends StatelessWidget {
  final String title;
  const _PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.darkGreen,
        title: Text(title, style: const TextStyle(color: AppTheme.white, fontWeight: FontWeight.w600)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.construction, size: 64, color: AppTheme.textSecondary),
            const SizedBox(height: 16),
            Text('Écran "$title" à implémenter', style: const TextStyle(color: AppTheme.textSecondary, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
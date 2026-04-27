// lib/widgets/avatar_widget.dart
// Widget réutilisable pour afficher l'avatar d'un contact
// Cercle coloré avec un emoji dedans (données mockées)

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AvatarWidget extends StatelessWidget {
  final String? emoji;      // emoji affiché dans le cercle
  final String? colorHex;   // couleur hex du fond ex: "#25D366"
  final double size;        // diamètre du cercle

  const AvatarWidget({
    super.key,
    this.emoji,
    this.colorHex,
    this.size = 50,
  });

  // Convertit "#RRGGBB" en Color Flutter
  Color _parseColor(String hex) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return AppTheme.tealGreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = colorHex != null ? _parseColor(colorHex!) : AppTheme.tealGreen;

    return CircleAvatar(
      radius: size / 2,
      backgroundColor: bgColor,
      child: Text(
        emoji ?? '👤',
        style: TextStyle(fontSize: size * 0.45),
      ),
    );
  }
}
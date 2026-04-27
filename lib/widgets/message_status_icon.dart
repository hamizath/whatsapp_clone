// lib/widgets/message_status_icon.dart
// Affiche les coches de statut d'un message
// ✓ gris = envoyé | ✓✓ gris = livré | ✓✓ bleu = lu

import 'package:flutter/material.dart';
import '../models/conversation.dart';
import '../theme/app_theme.dart';

class MessageStatusIcon extends StatelessWidget {
  final MessageStatus? status;
  final double size;

  const MessageStatusIcon({
    super.key,
    required this.status,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    if (status == null) return const SizedBox.shrink();

    switch (status!) {
      case MessageStatus.sent:
        return Icon(Icons.check, size: size, color: AppTheme.textSecondary);
      case MessageStatus.delivered:
        return _DoubleCheck(color: AppTheme.textSecondary, size: size);
      case MessageStatus.read:
        return _DoubleCheck(color: AppTheme.checkBlue, size: size);
    }
  }
}

// Deux coches superposées pour simuler ✓✓
class _DoubleCheck extends StatelessWidget {
  final Color color;
  final double size;

  const _DoubleCheck({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size + 8,
      height: size,
      child: Stack(
        children: [
          Positioned(left: 0, child: Icon(Icons.check, size: size, color: color)),
          Positioned(left: 5, child: Icon(Icons.check, size: size, color: color)),
        ],
      ),
    );
  }
}
// lib/theme/app_theme.dart
// Définit toutes les couleurs et styles globaux de l'application
// Toutes les couleurs sont inspirées de WhatsApp

import 'package:flutter/material.dart';

class AppTheme {
  // ── Couleurs principales ───────────────────────────────────────────────────
  static const Color primaryGreen  = Color(0xFF25D366); // vert des badges
  static const Color darkGreen     = Color(0xFF075E54); // vert foncé AppBar
  static const Color tealGreen     = Color(0xFF128C7E); // vert moyen accents
  static const Color lightGreen    = Color(0xFFDCF8C6); // bulle message envoyé
  static const Color white         = Color(0xFFFFFFFF);
  static const Color background    = Color(0xFFECE5DD); // fond beige du chat
  static const Color chatListBg    = Color(0xFFFFFFFF); // fond liste discussions
  static const Color divider       = Color(0xFFE0E0E0); // ligne séparatrice
  static const Color unreadBadge   = Color(0xFF25D366); // cercle non lus
  static const Color textPrimary   = Color(0xFF111B21); // texte principal
  static const Color textSecondary = Color(0xFF667781); // texte secondaire gris
  static const Color receivedBubble= Color(0xFFFFFFFF); // bulle reçue
  static const Color sentBubble    = Color(0xFFDCF8C6); // bulle envoyée
  static const Color inputBar      = Color(0xFFFFFFFF); // barre de saisie
  static const Color iconColor     = Color(0xFF8696A0); // icônes grises
  static const Color checkBlue     = Color(0xFF53BDEB); // double coche bleue = lu

  // ── Thème global de l'application ─────────────────────────────────────────
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: darkGreen,
      primary: darkGreen,
      secondary: primaryGreen,
    ),
    scaffoldBackgroundColor: chatListBg,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkGreen,
      foregroundColor: white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    dividerColor: divider,
    fontFamily: 'Roboto',
  );
}
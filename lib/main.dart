// lib/main.dart
// Point d'entrée de l'application WhatsApp Clone

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Force l'orientation portrait sur mobile (comme WhatsApp)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const WhatsAppCloneApp());
}

class WhatsAppCloneApp extends StatelessWidget {
  const WhatsAppCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      debugShowCheckedModeBanner: false, // enlève le bandeau rouge "DEBUG"
      theme: AppTheme.theme,
      home: const HomeScreen(),

      // ── Responsive : centré sur Chrome, plein écran sur mobile ──
      builder: (context, child) {
        final screenWidth = MediaQuery.of(context).size.width;

        // Si l'écran dépasse 600px (Chrome, tablette)
        // → on limite à 430px et on centre comme un téléphone
        if (screenWidth > 600) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: ClipRect(child: child!),
            ),
          );
        }

        return child!; // mobile : plein écran normal
      },
    );
  }
}
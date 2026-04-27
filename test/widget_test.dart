// test/widget_test.dart
// Test de base de l'application WhatsApp Clone

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whatsapp_clone/main.dart';

void main() {
  testWidgets('WhatsApp Clone smoke test', (WidgetTester tester) async {
    // Lance l'application
    await tester.pumpWidget(const WhatsAppCloneApp());

    // Vérifie que l'écran Discussions s'affiche bien
    expect(find.text('Discussions'), findsOneWidget);
  });
}
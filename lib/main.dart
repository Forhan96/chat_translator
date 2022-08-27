import 'package:chat_translator/chat_translator_app.dart';
import 'package:chat_translator/providers/auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>.value(value: AuthProvider()),
    ],
    child: const ChatTranslatorApp(),
  ));
}

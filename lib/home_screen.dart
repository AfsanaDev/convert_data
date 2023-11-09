import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'controller/language_change_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Language { Engilsh, Spanish, Bangla }

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.msgOne),
        actions: [
          Consumer<LanguageChangeController>(
              builder: (context, provider, child) {
            return PopupMenuButton(
              onSelected: (Language item) {
                if (Language.Engilsh.name == item.name) {
                  provider.changeLanguage(Locale('en'));
                } else if (Language.Spanish.name == item.name) {
                  provider.changeLanguage(Locale('es'));
                } else {
                  provider.changeLanguage(Locale('bn'));
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
                const PopupMenuItem(
                  value: Language.Engilsh,
                  child: Text('English'),
                ),
                const PopupMenuItem(
                  value: Language.Bangla,
                  child: Text('Bangla'),
                ),
                const PopupMenuItem(
                  value: Language.Spanish,
                  child: Text('Spanish'),
                )
              ],
            );
          })
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}

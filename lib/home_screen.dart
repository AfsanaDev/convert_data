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

enum Language { engilsh, spanish, bangla }

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
                if (Language.engilsh.name == item.name) {
                  provider.changeLanguage(Locale('en'));
                } else if (Language.spanish.name == item.name) {
                  provider.changeLanguage(Locale('es'));
                } else {
                  provider.changeLanguage(Locale('bn'));
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
                const PopupMenuItem(
                  value: Language.engilsh,
                  child: Text('English'),
                ),
                const PopupMenuItem(
                  value: Language.bangla,
                  child: Text('Bangla'),
                ),
                const PopupMenuItem(
                  value: Language.spanish,
                  child: Text('Spanish'),
                )
              ],
            );
          })
        ],
      ),
      body: SafeArea(
        child : Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(AppLocalizations.of(context)!.details),
            ),
          ],
        ),
      ),
    );
  }
}

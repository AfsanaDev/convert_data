import 'package:convert_data/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:convert_data/controller/language_change_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  final String languageCode= sp.getString('language_code')?? '';
  runApp(MyApp(locale:languageCode ,));
}

class MyApp extends StatelessWidget {
  final String locale;
  const MyApp({super.key, required this.locale});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LanguageChangeController())
        ],
        child: Consumer<LanguageChangeController>(
          builder: (context, provider, child) {
            if(locale.isEmpty){
              provider.changeLanguage(const Locale('en'));
            }
            return MaterialApp(
              title: 'Flutter Demo',
              // theme: ThemeData(
              //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              //   useMaterial3: true,
              // ),
              locale: locale == '' ? const Locale('en') : provider.appLocale == null ? const Locale('en'): provider.appLocale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('es'),
                Locale('bn'),
              ],
              home: const HomeScreen(),
              debugShowCheckedModeBanner: false,
            );
          },
        ));
  }
}

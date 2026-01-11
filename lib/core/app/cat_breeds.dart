import 'package:cat_breeds/i18n/translations.g.dart';
import 'package:cat_breeds/lib.dart';
import 'package:cat_breeds_ui/cat_breeds_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CatBreeds extends StatefulWidget {
  const CatBreeds({super.key});

  @override
  State<CatBreeds> createState() => _PCAState();
}

class _PCAState extends State<CatBreeds> with RouterMixin {
  @override
  Widget build(BuildContext context) {
    return CBCloseKeyboard(
      app: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        onGenerateTitle: (_) => 'Cat Breeds'.hardCode,
        themeMode: ThemeMode.light,
        theme: CBTheme.light,
        darkTheme: CBTheme.dark,
        builder: (context, child) {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Palette.primary,
            ),
          );
          return MediaQuery(
            data: context.mediaQuery.copyWith(
              textScaler: const TextScaler.linear(
                0.9,
              ),
            ),
            child: child!,
          );
        },
      ),
    );
  }
}

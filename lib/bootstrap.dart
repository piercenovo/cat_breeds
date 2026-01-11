import 'dart:async';
import 'dart:developer';

import 'package:cat_breeds/i18n/translations.g.dart';
import 'package:cat_breeds/lib.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> bootstrap(Environment environment) async {
  final enableLogging = environment.config.enableLogging;
  return runZonedGuarded(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      await init(environment);

      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      LocaleSettings.setLocale(AppLocale.en);
      FlutterNativeSplash.remove();

      runApp(TranslationProvider(child: const CatBreeds()));

      FlutterError.onError = (details) {
        if (enableLogging) {
          log(details.exceptionAsString(), stackTrace: details.stack);
        }
      };
    },
    (error, stack) {
      if (enableLogging) {
        log(error.toString(), stackTrace: stack);
      }
    },
  );
}

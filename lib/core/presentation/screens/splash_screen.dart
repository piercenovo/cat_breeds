import 'dart:async';

import 'package:cat_breeds/lib.dart';
import 'package:cat_breeds_ui/cat_breeds_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _listener();
  }

  void _listener() {
    Timer(const Duration(milliseconds: 1000), () {
      context.pushReplacementNamed(Routes.catBreeds.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Palette.transparent),
      child: CBBaseScreen(
        backgroundColor: Palette.brandPrimary,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Assets.imgs.catBreedsLogo.image(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

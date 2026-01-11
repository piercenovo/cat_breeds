import 'package:cat_breeds_ui/cat_breeds_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CatBreedsScreen extends StatelessWidget {
  const CatBreedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Palette.primary),
      child: CBBaseScreen(
        body: SingleChildScrollView(
          child: Container(
            height: context.height * 0.96,
            padding: edgeInsetsH20.add(edgeInsetsV20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bienvenido a la App'.hardCode,
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: Palette.neutral700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CBBaseScreen extends StatelessWidget {
  const CBBaseScreen({
    required this.body,
    this.appBar,
    this.drawer,
    this.floatingActionButton,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.isSafeArea = true,
    this.resizeToAvoidBottomInset = true,
    super.key,
  });
  final Widget body;
  final Widget? appBar;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool isSafeArea;
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor,
      body: isSafeArea
          ? SafeArea(
              child: Column(
                children: [
                  ?appBar,
                  Expanded(child: body),
                ],
              ),
            )
          : Column(
              children: [
                ?appBar,
                Expanded(child: body),
              ],
            ),
      floatingActionButton: floatingActionButton,
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

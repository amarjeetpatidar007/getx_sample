import 'package:flutter/material.dart';

import '../alert_dialog/views/alert_dialog.dart';

class AnimateTest extends StatefulWidget {
  const AnimateTest({Key? key}) : super(key: key);

  @override
  State<AnimateTest> createState() => _AnimateTestState();
}

class _AnimateTestState extends State<AnimateTest>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    animation = Tween<Offset>(
      begin: const Offset(-2.0, 1.0),
      end: const Offset(1.2, 1.0),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SlideTransition(
        textDirection: TextDirection.ltr,
        position: animation,
      ),
    );
  }
}

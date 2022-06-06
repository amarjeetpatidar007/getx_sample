import 'package:flutter/material.dart';

import '../drawer.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: custDrawer(context),
      appBar: AppBar(
        title: Text('Syllabus'),
      ),
      body: const Center(
        child: Text(' Test Page 3'),
      ),
    );
  }
}

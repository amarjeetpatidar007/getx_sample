import 'package:flutter/material.dart';
import 'package:getx_project/drawer.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: custDrawer(context),
      appBar: AppBar(
        title: Text('Practice'),
      ),
      body: const Center(
        child: Text(' Test Page 1 '),
      ),
    );
  }
}

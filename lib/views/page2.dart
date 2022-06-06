import 'package:flutter/material.dart';
import 'package:getx_project/drawer.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: custDrawer(context),
      appBar: AppBar(
        title: Text('Tests & Practice'),
      ),
      body: const Center(
        child: Text(' Test Page 2'),
      ),
    );
  }
}

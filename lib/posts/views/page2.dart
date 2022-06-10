import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/drawer.dart';
import 'package:getx_project/languages.dart';
import 'package:getx_project/posts/controller/controller.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: custDrawer(context),
      appBar: AppBar(
        title: Text('select'.tr),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('msg'.tr),
            const SizedBox(height: 40),
            GetBuilder<Controller>(
              builder: (controller) {
                return DropdownButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  value: controller.selectedLang,
                  items: Languages.langs.map((String lang) {
                    return DropdownMenuItem(value: lang, child: Text(lang));
                  }).toList(),
                  onChanged: (String? value) {
                    controller.selectedLang = value!;
                    controller.changeLanguage(value);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

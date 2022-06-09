import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import '../models/post_model.dart';

class EditPage extends GetView<Controller> {
  const EditPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Posts post  = Get.arguments;
    TextEditingController postTitleController = TextEditingController(text: post.title);
    TextEditingController postBodyController = TextEditingController(text: post.body);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Post'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextFormField(
                controller: postTitleController,
                decoration: const InputDecoration(
                  labelText: "Enter Title",
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                )),
            const SizedBox(height: 20,),
            TextFormField(
              controller: postBodyController,
                decoration: const InputDecoration(
                  labelText: "Enter Body Text",
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                )),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              print(post.id);
              print(post.userId);
              print(post.title);
              print(post.body);
              controller.updatePost(post.userId, post.id, postTitleController.text, postBodyController.text);
            }, child: const Text('Submit'))

          ],
        ),
      ),
    );
  }
}

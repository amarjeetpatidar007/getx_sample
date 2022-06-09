import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/posts/controller/controller.dart';

class CreatePost extends GetView<Controller> {
  const CreatePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController userIdController = TextEditingController();
    TextEditingController postTitleController = TextEditingController();
    TextEditingController postBodyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextFormField(
                controller: userIdController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter User Id",
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                )),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: postTitleController,
                decoration: const InputDecoration(
                  labelText: "Enter Post Title",
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                )),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: postBodyController,
                decoration: const InputDecoration(
                  labelText: "Enter Post Body",
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                   await controller.createPost(
                      int.parse(userIdController.text),
                      postTitleController.text,
                      postBodyController.text);
                },
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/drawer.dart';
import 'package:getx_project/routes.dart';

import '../controller/controller.dart';
import '../models/post_model.dart';

class PostPage extends GetView<Controller> {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: custDrawer(context),
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
        actions: [
          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            onPressed: () {
              Get.toNamed(Routes.createPage);
            },
            label: const Text('Create Post'),
          )
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: controller.getPostList(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: controller.posts.length,
                  itemBuilder: (context, index) {
                    Posts post = controller.posts[index];
                    return Card(
                      child: ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.body),
                        leading: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Get.toNamed(Routes.getEditPostRoute(),
                                arguments: post);
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            controller.deletePost(post.id);
                          },
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return const Text('Error');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

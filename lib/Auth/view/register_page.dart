import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/Auth/controller/auth_controller.dart';
import 'package:getx_project/routes.dart';

class RegisterPage extends GetView<AuthController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up '),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: ListView(
          children: [
            TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Enter User Name",
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                )),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Enter Password ",
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                )),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                // controller: postBodyController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "ReType Password ",
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                )),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.registerWithEmailAndPassword(
                      emailController.text, passwordController.text);
                },
                child: const Text('Sign Up')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Already have an Account? "),
                TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.getLoginPage());
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

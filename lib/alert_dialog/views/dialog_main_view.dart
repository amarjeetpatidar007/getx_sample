import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/alert_dialog/controller/dialogController.dart';

class AlertDialogPage extends GetView<DialogController> {
  const AlertDialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController teacherNameController = TextEditingController();
    Color quizAlertColor = const Color.fromRGBO(33, 150, 243, 1);

    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 200,
                      child: TextFormField(
                        controller: teacherNameController,
                      )),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {
                      controller.teacherNotAvailableDialog(
                          teacherName: teacherNameController.text,
                          context: context);
                    },
                    child: const Text('Submit'),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    onPressed: () {
                      controller.deafultTeacherDialog(
                          teacherName: teacherNameController.text,
                          context: context);
                    },
                    child: const Text('Submit'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.timerUpdate();
                      Get.snackbar(
                        '',
                        '',
                        maxWidth: MediaQuery.of(context).size.width,
                        snackStyle: SnackStyle.FLOATING,
                        isDismissible: true,
                        instantInit: true,
                        duration: const Duration(seconds: 10),
                        dismissDirection: DismissDirection.horizontal,
                        snackPosition: SnackPosition.TOP,
                        forwardAnimationCurve: Curves.easeInCubic,
                        reverseAnimationCurve: Curves.easeOutCubic,
                        barBlur: 0.0,
                        titleText: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 50,
                              width: 320,
                              // padding: const EdgeInsets.fromLTRB(6.0, 16.0, 6.0, 16.0),
                              padding:
                                  const EdgeInsets.only(left: 6.0, right: 6.0),
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(243, 241, 248, 0.9),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0))),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 16, right: 12),
                                      // padding: EdgeInsets.fromLTRB(16, 7, 12, 7),

                                      child: Icon(
                                        Icons.error_outline,
                                        size: 15.0,
                                        color: Color.fromRGBO(33, 150, 243, 1),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.zero,
                                      // padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                                      child: Obx(() => Text(
                                            "Quiz starts in ${controller.count.value} seconds",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10,
                                                color: quizAlertColor),
                                          )),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        controller.timer.cancel();
                                        Get.closeCurrentSnackbar();
                                        controller.count.value = 10;
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        size: 12,
                                        color: quizAlertColor,
                                      ),
                                      // padding: const EdgeInsets.fromLTRB(40, 11, 12, 11),
                                      padding: const EdgeInsets.only(
                                          left: 40, right: 12),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      );
                      // quizAlertDialog(
                      //     context: context,
                      //     count: controller.count.value,
                      //     timer: controller.timer);
                    },
                    child: const Text('Quiz Alert Dialog'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

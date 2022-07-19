import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getsandbox/models/user.dart';

class ProfileController extends GetxController {
  late User _user;
  get user => _user;

  String _inputText = '';

  @override
  void onInit() {
    super.onInit();
    _user = Get.arguments as User;
  }

  void onInputTextChange(String text) {
    _inputText = text;
  }

  void goBackWithData() {
    if (_inputText.trim().isNotEmpty) {
      Get.back(result: _inputText);
    } else {
      showCupertinoModalPopup(
        context: Get.overlayContext as BuildContext,
        builder: (_) => CupertinoActionSheet(
          title: const Text("Error"),
          message: const Text("Ingrese un valor válido"),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cerrar"),
          ),
        ),
      );
      /*Get.dialog(
        AlertDialog(
          title: const Text("Error"),
          content: const Text("Ingrese un valor válido"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Aceptar"),
            )
          ],
        ),
      );*/
    }
  }
}

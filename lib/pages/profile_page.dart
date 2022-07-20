import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getsandbox/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("${_.user.firstName} ${_.user.lastName}"),
                const SizedBox(
                  height: 10,
                ),
                CupertinoTextField(
                  onChanged: _.onInputTextChange,
                ),
                const SizedBox(
                  height: 10,
                ),
                CupertinoButton(
                  onPressed: _.goBackWithData,
                  child: const Text("Aceptar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

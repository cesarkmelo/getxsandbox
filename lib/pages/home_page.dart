import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getsandbox/controllers/home_controller.dart';
import 'package:getsandbox/pages/widgets/users_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        print('Build home');
        return Scaffold(
          body: const UsersList(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _.increment();
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

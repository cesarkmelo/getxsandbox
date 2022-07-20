import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getsandbox/controllers/global_controller.dart';
import 'package:getsandbox/controllers/home_controller.dart';
import 'package:getsandbox/widgets/product_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        print('Build home');
        return Scaffold(
          appBar: AppBar(
            actions: [
              GetBuilder<GlobalController>(
                id: 'favorites',
                builder: (_) => TextButton(
                  onPressed: () {},
                  child: Text(
                    "Favoritos (${_.favorites.length})",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          //body: const UsersList(),
          body: const ProductList(),
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

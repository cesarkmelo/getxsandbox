import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:getsandbox/controllers/home_controller.dart';

class CounterLabel extends StatelessWidget {
  const CounterLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'text01',
      builder: (_) => Text(_.counter.toString()),
    );
  }
}

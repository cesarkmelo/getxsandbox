import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getsandbox/controllers/home_controller.dart';
import 'package:getsandbox/models/user.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'users',
      builder: (_) {
        if (_.loading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: LinearProgressIndicator(),
            ),
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              final User user = _.users[index];
              return ListTile(
                title: Text(user.firstName),
                subtitle: Text(user.email),
                onTap: () => _.showUserProfile(user),
              );
            },
            itemCount: _.users.length,
          );
        }
      },
    );
  }
}

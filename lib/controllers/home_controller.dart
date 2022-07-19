import 'package:get/get.dart';
import 'package:getsandbox/api/users_api.dart';
import 'package:getsandbox/models/user.dart';
import 'package:getsandbox/pages/profile_page.dart';

class HomeController extends GetxController {
  int _counter = 0;
  List<User> _users = [];
  bool _loading = true;

  int get counter => _counter;
  List<User> get users => _users;
  bool get loading => _loading;

  // Se ejecuta al iniciar el widget antes de renderizarlo
  @override
  void onInit() {
    super.onInit();
    print('Lo mismo que initState');
  }

  // Se ejecuta una sola vez despues de renderizar el widget
  @override
  onReady() {
    super.onReady();
    loadUsers();
    print('Idoneo para mostrar dialogos, snacks, navegación');
  }

  Future<void> loadUsers() async {
    final data = await UsersAPI.instance.getUsers(1);
    if (data != null) {
      _users = data;
      _loading = false;
      update(['users']);
    }
  }

  void increment() {
    _counter++;
    update(['text01']);
  }

  // Aca recibe en result la variable que se envia devuelta desde ProfilePage
  showUserProfile(User user) async {
    final result = await Get.to(
      () => const ProfilePage(),
      arguments: user,
    );
    if (result != null) {
      print('String devuelo $result');
    }
  }
}

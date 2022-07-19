import 'package:get/get.dart';

class HomeController extends GetxController {
  int _counter = 0;

  int get counter => _counter;

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
    print('Idoneo para mostrar dialogos, snacks, navegación');
  }

  void increment() {
    _counter++;
    update(['text01']);
  }
}

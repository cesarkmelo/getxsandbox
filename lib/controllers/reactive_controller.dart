import 'package:get/get.dart';
import 'package:getsandbox/models/pet.dart';

class ReactiveController extends GetxController {
  RxInt counter = 0.obs;
  RxString currentDate = ''.obs;
  RxList<String> items = <String>[].obs;
  RxMap<String, dynamic> mapItems = <String, dynamic>{}.obs;

  Pet myPet = Pet(name: "Tommy", age: 15);

  void increment() {
    counter.value++;
  }

  void getDate() {
    currentDate.value = DateTime.now().toString();
  }

  void addItem() {
    items.add(DateTime.now().toString());
  }

  void addMapItem() {
    final String key = DateTime.now().toString();
    mapItems[key] = 'value: $key';
  }

  void remoiveItem(int index) {
    items.removeAt(index);
  }

  void removeMapItem(String key) {
    mapItems.remove(key);
  }

  void setPet(Pet newPet) {
    myPet = newPet;
  }

  // para actualizar una propiedad de la clase se debe usar copyWith
  void setPetAge(int age) {
    myPet.age = age;
  }
}

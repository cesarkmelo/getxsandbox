import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getsandbox/controllers/reactive_controller.dart';
import 'package:getsandbox/models/pet.dart';

class ReactivePage extends StatelessWidget {
  const ReactivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Pet lola = Pet(name: "Lola", age: 14);
    return GetBuilder<ReactiveController>(
      init: ReactiveController(),
      builder: (_) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => Text("Nombre: ${_.myPet.value.name}")),
              Obx(() => Text("Edad: ${_.myPet.value.age}")),
              TextButton(
                onPressed: () {
                  _.setPet(lola);
                },
                child: const Text('Set Pet'),
              ),
              TextButton(
                onPressed: () {
                  _.setPetAge(14);
                },
                child: const Text('Set Pet Age'),
              )
            ],
          ),
        ),
        // Observador del map
        /*
        body: Obx(
          () => ListView(
            // Ojo esta version diferencia key de value gracias a map.entries
            children: _.mapItems.entries
                .map(
                  (e) => ListTile(
                    title: Text(e.value),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _.removeMapItem(e.key);
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        */
        // Muestra la lista
        /*
        Obx(
          () => ListView.builder(
            itemBuilder: (__, index) {
              return ListTile(
                title: const Text('Elemento'),
                subtitle: Text(_.items[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _.remoiveItem(index);
                  },
                ),
              );
            },
            itemCount: _.items.length,
          ),
        ),*/
        /*  Muestra valores primitivos int y String
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            Obx(() => Text(_.counter.value.toString())),
            const SizedBox(
              height: 16,
            ),
            Obx(() => Text(_.currentDate.value.toString())),
          ],
        ),),*/
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                _.addMapItem();
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 16,
            ),
            FloatingActionButton(
              onPressed: () {
                _.getDate();
              },
              child: const Icon(Icons.calendar_today),
            ),
          ],
        ),
      ),
    );
  }
}

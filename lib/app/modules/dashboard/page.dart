import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/page.dart';
import 'controller.dart';

class DashboardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
              //Selecionado as pagina atravez da função changePageIndex do conteller
              onDestinationSelected: controller.changePageIndex,
              //selecionado o indix da pagina pela variavel cuurrentPageIndex
              selectedIndex: controller.currentPageIndex.value,
              // listando os destindo em forma de menu
              destinations: const [
                NavigationDestination(
                    selectedIcon: Icon(Icons.explore),
                    icon: Icon(Icons.explore_outlined),
                    label: "Início"),
                NavigationDestination(
                    selectedIcon: Icon(Icons.person),
                    icon: Icon(Icons.person_outline),
                    label: "Meu Perfil"),
                NavigationDestination(
                    selectedIcon: Icon(Icons.view_list),
                    icon: Icon(Icons.view_list_outlined),
                    label: "Meus Pedidos")
              ]),
        ),
        body: Obx((() => IndexedStack(
              index: controller.currentPageIndex.value,
              children: [
                HomePage(),
                Text("Meu Pefil"),
                Text("Meus Pedidos"),
              ],
            ))));
  }
}
//Documentaçao 
//Criando um Dashboard com uma bara de menu
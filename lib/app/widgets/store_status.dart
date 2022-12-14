import 'package:flutter/material.dart';
import 'package:get/get.dart';

//botão para valisa se esta texto fechado o estabelecimento
class StoreStatus extends StatelessWidget {
  bool isOnline;

  StoreStatus({required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: isOnline ? Color.fromRGBO(290, 250, 0, 13) : Colors.black45,
        border: Border.all(color: Colors.black12, width: 2.0),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        isOnline ? 'Aberto' : 'Fechado',
        style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white),
      ),
    );
  }
}

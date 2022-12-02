//Conexão com a api
import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../models/store.dart';

class Api extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://192.168.0.162:3333/';

    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';

      return request;
    });

    super.onInit();
  }

  ///metodo para trazer as informações do estabelecimentos
  Future<List<StoreModel>> getStores() async {
    var response = _errorHandler(await get('cidades/1/estabelecimentos'));
//fazer um form na lista de estabelecimento
    List<StoreModel> data = [];
    for (var store in response.body) {
      data.add(StoreModel.fromJson(store));
    }

    return data;
  }

  Future<StoreModel> getStore(int id) async {
    var response = _errorHandler(await get('estabelecimentos/$id'));

    return StoreModel.fromJson(response.body);
  }

  Response _errorHandler(Response response) {
    print(response.bodyString);

    switch (response.statusCode) {
      case 200:
      case 202:
      case 204:
        return response;
      default:
        throw 'Ocorreu um erro';
    }
  }
}

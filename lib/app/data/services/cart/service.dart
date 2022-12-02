import 'package:get/get.dart';
import 'package:hortifrut/app/data/models/cart_product.dart';
import 'package:hortifrut/app/data/models/store.dart';

class CartService extends GetxService {
  //lista do tipo cart de produtos model
  List<CartProductModel> products = RxList<CartProductModel>.empty();
//variavem para reseber o estabelecimento.
  final store = Rxn<StoreModel>();
//função para add um produto no carinho
//pega o valor da lista e add no cart de produto
  void AddProductToCart(CartProductModel cartProduct) {
    products.add(cartProduct);
  }

  //remover produto do cart
  void removeProductFromCart(CartProductModel cartProduct) {
    products.remove(cartProduct);
  }

  bool isANewStore(StoreModel newStore) {
    return store.value != null && store.value!.id != newStore.id;
  }

  void clearCart() {
    products.clear();
  }

// função para iniciar um novo carrinho
  void newCart(StoreModel newStore) {
    store.value = newStore;
  }
}

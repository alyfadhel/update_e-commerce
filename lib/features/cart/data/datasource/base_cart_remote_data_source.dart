import 'package:review_shop_app/core/network/dio_helper.dart';
import 'package:review_shop_app/core/network/end-points.dart';
import 'package:review_shop_app/features/cart/data/model/cart_model.dart';
import 'package:review_shop_app/features/cart/data/model/get_cart_model.dart';
import 'package:review_shop_app/features/cart/domain/repository/base_cart_repository.dart';

abstract class BaseCartRemoteDataSource {
  Future<CartModel> getCart(CartParameter parameter);

  Future<List<CartItemsModel>> getCartItems();
}

class CartRemoteDataSource extends BaseCartRemoteDataSource {
  final DioHelper dioHelper;

  CartRemoteDataSource(this.dioHelper);

  @override
  Future<CartModel> getCart(CartParameter parameter) async {
    final response = await dioHelper.post(
      endPoint: cartEndPoint,
      data: {
        'product_id': parameter.id,
      },
      Authorization: token,
      lang: language,
    );
    return CartModel.fromJson(response);
  }

  @override
  Future<List<CartItemsModel>> getCartItems() async {
    final response = await dioHelper.get(
      endPoint: cartEndPoint,
      Authorization: token,
      lang: language,
    );
    return List<CartItemsModel>.from((response['data']['cart_items'] as List)
        .map((e) => CartItemsModel.fromJson(e)));
  }
}

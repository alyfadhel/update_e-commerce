import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/core/usecase/base_usecase.dart';
import 'package:review_shop_app/features/cart/domain/entities/cart.dart';
import 'package:review_shop_app/features/cart/domain/repository/base_cart_repository.dart';

class GetCartUseCase extends BaseUseCase<Cart,CartParameter>
{
  final BaseCartRepository baseCartRepository;

  GetCartUseCase(this.baseCartRepository);
  @override
  Future<Either<Failure, Cart>> call(CartParameter parameter)async {
    return await baseCartRepository.getCart(parameter);
  }

}
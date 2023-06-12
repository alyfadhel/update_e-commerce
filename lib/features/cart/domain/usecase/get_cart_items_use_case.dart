import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/core/usecase/base_usecase.dart';
import 'package:review_shop_app/features/cart/domain/entities/get_cart.dart';
import 'package:review_shop_app/features/cart/domain/repository/base_cart_repository.dart';

class GetCartItemsUseCase extends BaseUseCase<List<CartItems>,NoParameters>
{
  final BaseCartRepository baseCartRepository;

  GetCartItemsUseCase(this.baseCartRepository);
  @override
  Future<Either<Failure, List<CartItems>>> call(NoParameters parameter)async {
    return await baseCartRepository.getICartItems(parameter);
  }

}
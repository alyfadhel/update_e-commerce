import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/products_details/domain/entities/products_details.dart';

abstract class BaseProductsDetailsRepository
{
  Future<Either<Failure,ProductsDetails>>getProductsDetails(ProductsParameter parameter);
}

class ProductsParameter extends Equatable
{
  final int id;

  const ProductsParameter({required this.id});
  @override
  List<Object?> get props => [
    id,
  ];

}
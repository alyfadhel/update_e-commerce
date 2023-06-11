import 'package:get_it/get_it.dart';
import 'package:review_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:review_shop_app/core/network/dio_helper.dart';
import 'package:review_shop_app/features/cart/data/datasource/base_cart_remote_data_source.dart';
import 'package:review_shop_app/features/cart/data/repository/cart_repository.dart';
import 'package:review_shop_app/features/cart/domain/repository/base_cart_repository.dart';
import 'package:review_shop_app/features/cart/domain/usecase/get_cart_items_use_case.dart';
import 'package:review_shop_app/features/cart/domain/usecase/get_cart_use_case.dart';
import 'package:review_shop_app/features/categories_details/data/datasource/base_categories_details_remote_data_source.dart';
import 'package:review_shop_app/features/categories_details/data/repository/categories_details_repository.dart';
import 'package:review_shop_app/features/categories_details/domain/repository/base_categories_details_repository.dart';
import 'package:review_shop_app/features/categories_details/domain/usecase/get_categories_details_use_case.dart';
import 'package:review_shop_app/features/change_favorites/data/datasource/base_change_favorites_remote_data_source.dart';
import 'package:review_shop_app/features/change_favorites/data/repository/change_favorites_repository.dart';
import 'package:review_shop_app/features/change_favorites/domain/repository/base_change_favorites_repository.dart';
import 'package:review_shop_app/features/change_favorites/domain/usecase/get_change_favorites_use_case.dart';
import 'package:review_shop_app/features/favorites/data/repository/favorites_repository.dart';
import 'package:review_shop_app/features/favorites/domain/repository/base_favorites_repository.dart';
import 'package:review_shop_app/features/favorites/domain/usecase/get_favorites_use_case.dart';
import 'package:review_shop_app/features/home/data/datasource/base_home_remote_data_source.dart';
import 'package:review_shop_app/features/home/data/repository/home_repository.dart';
import 'package:review_shop_app/features/home/domain/repository/base_home_repository.dart';
import 'package:review_shop_app/features/home/domain/usecase/get_categories_use_case.dart';
import 'package:review_shop_app/features/home/domain/usecase/get_home_use_case.dart';
import 'package:review_shop_app/features/products_details/data/datasource/base_products_details_remote_data_source.dart';
import 'package:review_shop_app/features/products_details/data/repository/products_details_repository.dart';
import 'package:review_shop_app/features/products_details/domain/repository/base_products_details_repository.dart';
import 'package:review_shop_app/features/products_details/domain/usecase/get_products_details_use_case.dart';
import 'package:review_shop_app/features/search/data/datasource/base_search_remote_data_source.dart';
import 'package:review_shop_app/features/search/data/repository/search_repository.dart';
import 'package:review_shop_app/features/search/domain/repository/base_serach_repository.dart';
import 'package:review_shop_app/features/search/domain/usecase/get_search_use_case.dart';
import 'package:review_shop_app/features/user/log_out/data/datasource/base_log_out_remote_data_source.dart';
import 'package:review_shop_app/features/user/log_out/data/repository/log-out_repository.dart';
import 'package:review_shop_app/features/user/log_out/domain/repository/base_logout_repository.dart';
import 'package:review_shop_app/features/user/log_out/domain/usecase/get_log_out_use_case.dart';
import 'package:review_shop_app/features/user/login/data/datasource/base_login_user_remote_data_source.dart';
import 'package:review_shop_app/features/user/login/data/repository/login_user_repository.dart';
import 'package:review_shop_app/features/user/login/domain/repository/base_login_repository.dart';
import 'package:review_shop_app/features/user/login/domain/usecase/get_login_user_use_case.dart';
import 'package:review_shop_app/features/user/login/presentation/controller/cubit/login_cubit.dart';
import 'package:review_shop_app/features/user/register/data/datasource/base_user_register_remote_data_source.dart';
import 'package:review_shop_app/features/user/register/data/repository/register_user_repository.dart';
import 'package:review_shop_app/features/user/register/domain/repository/base_register_repository.dart';
import 'package:review_shop_app/features/user/register/domain/usecase/get_user_register_use_case.dart';
import 'package:review_shop_app/features/user/register/presentation/controller/cubit/register_cubit.dart';
import 'package:review_shop_app/features/user/settings/data/datasource/base_profile_remote_data_source.dart';
import 'package:review_shop_app/features/user/settings/data/repository/profile_repository.dart';
import 'package:review_shop_app/features/user/settings/domain/repository/base_profile_repository.dart';
import 'package:review_shop_app/features/user/settings/domain/usecase/get_profile_use_case.dart';
import 'package:review_shop_app/features/user/update_profile/data/datasource/base_update_profile_remote_data_source.dart';
import 'package:review_shop_app/features/user/update_profile/data/repository/update_profile_repository.dart';
import 'package:review_shop_app/features/user/update_profile/domain/repository/base_update_profile_use_case.dart';
import 'package:review_shop_app/features/user/update_profile/domain/usecase/get_update_profile_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/favorites/data/datasource/base_favorites_remote_data_source.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    sl.registerFactory(() => ShopCubit(
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
        ));
    ///////////////////////////////////////////////////////
    sl.registerLazySingleton(() => GetCartItemsUseCase(sl()));

    sl.registerLazySingleton(() => GetCartUseCase(sl()));

    sl.registerLazySingleton<BaseCartRepository>(
            () => CartRepository(sl()));

    sl.registerLazySingleton<BaseCartRemoteDataSource>(
            () => CartRemoteDataSource(sl()));
    //////////////////////////////////////////////////////
    sl.registerLazySingleton(() => GetSearchUseCase(sl()));

    sl.registerLazySingleton<BaseSearchRepository>(
            () => SearchRepository(sl()));

    sl.registerLazySingleton<BaseSearchRemoteDataSource>(
            () => SearchRemoteDataSource(sl()));
    ///////////////////////////////////////////////////////
    sl.registerLazySingleton(() => GetChangeFavoritesUseCase(sl()));

    sl.registerLazySingleton<BaseChangeFavoritesRepository>(
        () => ChangeFavoritesRepository(sl()));

    sl.registerLazySingleton<BaseChangeFavoritesRemoteDataSource>(
        () => ChangeFavoritesRemoteDataSource(sl()));
    ///////////////////////////////////////////////////////
    sl.registerLazySingleton(() => GetFavoritesUseCase(sl()));

    sl.registerLazySingleton<BaseFavoritesRepository>(
        () => FavoritesRepository(sl()));

    sl.registerLazySingleton<BaseFavoritesRemoteDataSource>(
        () => FavoritesRemoteDataSource(sl()));
    ///////////////////////////////////////////////////////
    sl.registerLazySingleton(() => GetProductsDetailsUseCase(sl()));

    sl.registerLazySingleton<BaseProductsDetailsRepository>(
        () => ProductsDetailsRepository(sl()));

    sl.registerLazySingleton<BaseProductsDetailsRemoteDataSource>(
        () => ProductsDetailsRemoteDataSource(sl()));
    ///////////////////////////////////////////////////////
    sl.registerLazySingleton(() => GetCategoriesDetailsUseCase(sl()));

    sl.registerLazySingleton<BaseCategoriesDetailsRepository>(
        () => CategoriesDetailsRepository(sl()));

    sl.registerLazySingleton<BaseCategoriesDetailsRemoteDataSource>(
        () => CategoriesDetailsRemoteDataSource(sl()));
    ///////////////////////////////////////////////////////
    sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));

    ///////////////////////////////////////////////////////
    sl.registerLazySingleton(() => GetHomeUseCase(sl()));

    sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));

    sl.registerLazySingleton<BaseHomeRemoteDataSource>(
        () => HomeRemoteDataSource(sl()));

    ///////////////////////////////////////////////////////
    sl.registerLazySingleton(() => GetLogOutUseCase(sl()));

    sl.registerLazySingleton<BaseLogOutRepository>(
        () => LogOutRepository(sl()));

    sl.registerLazySingleton<BaseLogOutRemoteDataSource>(
        () => LogOutRemoteDataSource(sl()));
    ///////////////////////////////////////////////////////
    sl.registerLazySingleton(() => GetUpdateProfileUseCase(sl()));

    sl.registerLazySingleton<BaseUpdateProfileRepository>(
        () => UpdateProfileRepository(sl()));

    sl.registerLazySingleton<BaseUpdateProfileRemoteDataSource>(
        () => UpdateProfileRemoteDataSource(sl()));

    //////////////////////////////////////////////////////////

    sl.registerLazySingleton(() => GetProfileUseCase(sl()));

    sl.registerLazySingleton<BaseProfileRepository>(
        () => ProfileRepository(sl()));

    sl.registerLazySingleton<BaseProfileRemoteDataSource>(
        () => ProfileRemoteDataSource(sl()));

    /////////////////////////////////////////////////////////

    sl.registerFactory(() => LoginCubit(
          sl(),
        ));

    sl.registerLazySingleton(() => GetLoginUserUseCase(sl()));

    sl.registerLazySingleton<BaseLoginUserRepository>(
        () => LoginUserRepository(sl()));

    sl.registerLazySingleton<BaseLoginUserRemoteDataSource>(
        () => LoginUserRemoteDataSource(sl()));

    //////////////////////////////////////////////////////////

    sl.registerFactory(() => RegisterCubit(
          sl(),
        ));

    sl.registerLazySingleton(() => GetUserRegisterUseCase(sl()));

    sl.registerLazySingleton<BaseRegisterUserRepository>(
        () => RegisterUserRepository(sl()));

    sl.registerLazySingleton<BaseRegisterUserRemoteDataSource>(
        () => RegisterUserRemoteDataSource(sl()));

    /////////////////////////////////////////////////////////
    sl.registerLazySingleton<DioHelper>(
      () => DioHelperImpl(),
    );

    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(
      () => sharedPreferences,
    );
  }
}

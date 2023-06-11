import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/core/layout/cubit/shop_state.dart';
import 'package:review_shop_app/core/network/end-points.dart';
import 'package:review_shop_app/core/service/service_locator.dart';
import 'package:review_shop_app/core/usecase/base_usecase.dart';
import 'package:review_shop_app/features/cart/domain/entities/cart.dart';
import 'package:review_shop_app/features/cart/domain/entities/get_cart.dart';
import 'package:review_shop_app/features/cart/domain/repository/base_cart_repository.dart';
import 'package:review_shop_app/features/cart/domain/usecase/get_cart_items_use_case.dart';
import 'package:review_shop_app/features/cart/domain/usecase/get_cart_use_case.dart';
import 'package:review_shop_app/features/categories/presentation/pages/categories_screen.dart';
import 'package:review_shop_app/features/categories_details/domain/entities/categories_details.dart';
import 'package:review_shop_app/features/categories_details/domain/repository/base_categories_details_repository.dart';
import 'package:review_shop_app/features/categories_details/domain/usecase/get_categories_details_use_case.dart';
import 'package:review_shop_app/features/change_favorites/domain/entities/change_favorites.dart';
import 'package:review_shop_app/features/change_favorites/domain/repository/base_change_favorites_repository.dart';
import 'package:review_shop_app/features/change_favorites/domain/usecase/get_change_favorites_use_case.dart';
import 'package:review_shop_app/features/favorites/domain/entities/favorites.dart';
import 'package:review_shop_app/features/favorites/domain/usecase/get_favorites_use_case.dart';
import 'package:review_shop_app/features/favorites/presentation/pages/favorites_screen.dart';
import 'package:review_shop_app/features/home/domain/entities/categories.dart';
import 'package:review_shop_app/features/home/domain/entities/home.dart';
import 'package:review_shop_app/features/home/domain/usecase/get_categories_use_case.dart';
import 'package:review_shop_app/features/home/domain/usecase/get_home_use_case.dart';
import 'package:review_shop_app/features/home/presentation/pages/home_screen.dart';
import 'package:review_shop_app/features/products_details/domain/entities/products_details.dart';
import 'package:review_shop_app/features/products_details/domain/repository/base_products_details_repository.dart';
import 'package:review_shop_app/features/products_details/domain/usecase/get_products_details_use_case.dart';
import 'package:review_shop_app/features/search/domain/entities/search.dart';
import 'package:review_shop_app/features/search/domain/repository/base_serach_repository.dart';
import 'package:review_shop_app/features/search/domain/usecase/get_search_use_case.dart';
import 'package:review_shop_app/features/user/log_out/domain/entities/logout.dart';
import 'package:review_shop_app/features/user/log_out/domain/repository/base_logout_repository.dart';
import 'package:review_shop_app/features/user/log_out/domain/usecase/get_log_out_use_case.dart';
import 'package:review_shop_app/features/user/settings/domain/entities/profile.dart';
import 'package:review_shop_app/features/user/settings/domain/usecase/get_profile_use_case.dart';
import 'package:review_shop_app/features/user/settings/presentation/pages/settings_screen.dart';
import 'package:review_shop_app/features/user/update_profile/domain/entities/update_profile.dart';
import 'package:review_shop_app/features/user/update_profile/domain/repository/base_update_profile_use_case.dart';
import 'package:review_shop_app/features/user/update_profile/domain/usecase/get_update_profile_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit(
    this.getProfileUseCase,
    this.getUpdateProfileUseCase,
    this.getLogOutUseCase,
    this.getHomeUseCase,
    this.getCategoriesUseCase,
    this.getCategoriesDetailsUseCase,
    this.getProductsDetailsUseCase,
    this.getFavoritesUseCase,
    this.getChangeFavoritesUseCase,
    this.getSearchUseCase,
    this.getCartUseCase,
    this.getCartItemsUseCase,
  ) : super(ShopInitialState());

  final GetProfileUseCase getProfileUseCase;
  final GetUpdateProfileUseCase getUpdateProfileUseCase;
  final GetLogOutUseCase getLogOutUseCase;
  final GetHomeUseCase getHomeUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetCategoriesDetailsUseCase getCategoriesDetailsUseCase;
  final GetProductsDetailsUseCase getProductsDetailsUseCase;
  final GetChangeFavoritesUseCase getChangeFavoritesUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;
  final GetSearchUseCase getSearchUseCase;
  final GetCartUseCase getCartUseCase;
  final GetCartItemsUseCase getCartItemsUseCase;
  Profile? profile;
  UpdateProfile? updateProfile;
  LogOut? logOut;
  Home? home;
  Categories? categories;
  CategoriesDetails? categoriesDetails;
  ProductsDetails? productsDetails;
  ChangeFavorites? changeFavorites;
  Favorites? favorites;
  Search? search;
  Cart? cart;
  GetCart? getCartItem;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var fcmTokenController = TextEditingController();
  var imageController = TextEditingController();
  var searchController = TextEditingController();

  bool isSearch = false;

  static ShopCubit get(context) => BlocProvider.of(context);

  void changeLanguage() {
    if (language == 'ar') {
      language = 'en';
    } else {
      language = 'ar';
    }
    emit(ShopChangeLanguageState());
  }

  bool isDark = true;

  void changeThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeThemeMode());
    } else {
      isDark = !isDark;
      sl<SharedPreferences>().setBool('isDark', isDark).then((value) {
        emit(ChangeThemeMode());
      });
    }
  }

  int currentIndex = 0;

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.category,
      ),
      label: 'Categories',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite,
      ),
      label: 'Favorites',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Settings',
    ),
  ];

  List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];

  List<String> title = [
    'Home',
    'Categories',
    'Favorites',
    'Settings',
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNav());
  }

  void getProfile() async {
    emit(ShopProfileLoadingState());

    final result = await getProfileUseCase(const NoParameters());

    result.fold(
      (l) {
        emit(ShopProfileErrorState(l.message));
      },
      (r) {
        profile = r;
        emit(ShopProfileSuccessState(r));
      },
    );
  }

  void getUpdateProfile({
    required String name,
    required String email,
    required String phone,
    required String image,
  }) async {
    emit(ShopUpdateProfileLoadingState());

    final result = await getUpdateProfileUseCase(
      UpdateParameter(
        name: name,
        email: email,
        phone: phone,
        image: image,
      ),
    );

    result.fold(
      (l) {
        emit(ShopUpdateProfileErrorState(l.message));
      },
      (r) {
        updateProfile = r;
        getProfile();
        emit(ShopUpdateProfileSuccessState(r));
      },
    );
  }

  void getLogOut({
    required String fcmToken,
  }) async {
    emit(ShopLogOutLoadingState());

    final result = await getLogOutUseCase(
      TokenParameter(
        fcmToken: fcmToken,
      ),
    );
    result.fold(
      (l) {
        emit(ShopLogOutErrorState(l.message));
      },
      (r) {
        logOut = r;
        emit(ShopLogOutSuccessState(r));
      },
    );
  }

  Map<int, bool> favoritesProducts = {};

  void getHomeData() async {
    emit(ShopHomeLoadingState());

    final result = await getHomeUseCase(const NoParameters());

    result.fold(
      (l) {
        emit(ShopHomeErrorState(l.message));
      },
      (r) {
        home = r;
        home!.data!.products!.forEach((element) {
          favoritesProducts.addAll(({element.id!: element.inFavorites!}));
        });
        home!.data!.products!.forEach((element) {
          inCart.addAll({
            element.id!: element.inCart!,
          });
        });
        debugPrint('The Favorites Is : $favoritesProducts');
        emit(ShopHomeSuccessState(r));
      },
    );
    debugPrint('The result Home is : $result');
  }

  void changeFavoritesItems({required int productId}) async {
    favoritesProducts[productId] = !favoritesProducts[productId]!;
    emit(ShopChangeFavoritesLoadingState());
    final result = await getChangeFavoritesUseCase(
      ChangeFavoriteParameter(
        id: productId,
      ),
    );
    result.fold(
      (l) {
        favoritesProducts[productId] = !favoritesProducts[productId]!;
        emit(ShopChangeFavoritesErrorState(l.message));
      },
      (r) {
        changeFavorites = r;
        if (!changeFavorites!.status!) {
          favoritesProducts[productId] = !favoritesProducts[productId]!;
        } else {
          getFavorites();
        }
        emit(ShopChangeFavoritesSuccessState(r));
      },
    );
  }

  void getFavorites() async {
    emit(ShopFavoritesLoadingState());

    final result = await getFavoritesUseCase(const NoParameters());

    result.fold(
          (l) {
        emit(ShopFavoritesErrorState(l.message));
      },
          (r) {
        favorites = r;
        emit(ShopFavoritesSuccessState(r));
        debugPrint('The ProductFavorites Is :$favorites');
      },
    );
  }

  Map<int,bool>inCart = {};
  void changeCart({required int id}) async {
    inCart[id] = !inCart[id]!;
    emit(ShopCartLoadingState());
    final result = await getCartUseCase(
      CartParameter(
        id: id,
      ),
    );
    result.fold(
          (l) {
        inCart[id] = !inCart[id]!;
        emit(ShopCartErrorState(l.message));
      },
          (r) {
        cart = r;
        if (!cart!.status!) {
          inCart[id] = !inCart[id]!;
        } else {
          getCart();
        }
        emit(ShopCartSuccessState(r));
      },
    );
  }

  void getCart() async {
    emit(ShopGetCartLoadingState());

    final result = await getCartItemsUseCase(
      const NoParameters(),
    );

    result.fold(
          (l) {
        emit(ShopGetCartErrorState(l.message));
      },
          (r) {
        getCartItem = r;
        emit(ShopGetCartSuccessState(r));
      },
    );
  }

  void getCategories() async {
    final result = await getCategoriesUseCase(const NoParameters());

    result.fold(
      (l) {
        emit(ShopCategoriesErrorState(l.message));
      },
      (r) {
        categories = r;
        emit(ShopCategoriesSuccessState(r));
      },
    );
    debugPrint('The result Categories is : $result');
  }

  void getCategoriesDetails({required int id}) async {
    emit(ShopCategoriesDetailsLoadingState());

    final result = await getCategoriesDetailsUseCase(
      CategoriesParameter(
        id: id,
      ),
    );
    result.fold(
      (l) {
        emit(ShopCategoriesDetailsErrorState(l.message));
      },
      (r) {
        categoriesDetails = r;
        emit(ShopCategoriesDetailsSuccessState(r));
      },
    );
  }

  void getProductsDetails({required int id}) async {
    emit(ShopProductsDetailsLoadingState());

    final result = await getProductsDetailsUseCase(
      ProductsParameter(
        id: id,
      ),
    );

    result.fold(
      (l) {
        emit(ShopProductsDetailsErrorState(l.message));
      },
      (r) {
        productsDetails = r;
        emit(ShopProductsDetailsSuccessState(r));
      },
    );
  }



  void getSearch({required String text}) async {
    emit(ShopSearchLoadingState());

    final result = await getSearchUseCase(
      SearchParameter(
        text: text,
      ),
    );
    result.fold(
      (l) {
        emit(ShopSearchErrorState(l.message));
      },
      (r) {
        search = r;
        emit(ShopSearchSuccessState(r));
      },
    );
  }


}

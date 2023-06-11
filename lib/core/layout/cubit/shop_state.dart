

import 'package:review_shop_app/features/cart/domain/entities/cart.dart';
import 'package:review_shop_app/features/cart/domain/entities/get_cart.dart';
import 'package:review_shop_app/features/categories_details/domain/entities/categories_details.dart';
import 'package:review_shop_app/features/change_favorites/domain/entities/change_favorites.dart';
import 'package:review_shop_app/features/favorites/domain/entities/favorites.dart';
import 'package:review_shop_app/features/home/domain/entities/categories.dart';
import 'package:review_shop_app/features/home/domain/entities/home.dart';
import 'package:review_shop_app/features/products_details/domain/entities/products_details.dart';
import 'package:review_shop_app/features/search/domain/entities/search.dart';
import 'package:review_shop_app/features/user/log_out/domain/entities/logout.dart';
import 'package:review_shop_app/features/user/settings/domain/entities/profile.dart';
import 'package:review_shop_app/features/user/update_profile/domain/entities/update_profile.dart';

abstract class ShopState {}

class ShopInitialState extends ShopState{}

class ChangeBottomNav extends ShopState{}

class ShopChangeLanguageState extends ShopState{}

class ChangeThemeMode extends ShopState{}


class ShopProfileLoadingState extends ShopState{}
class ShopProfileSuccessState extends ShopState{
  final Profile profile;

  ShopProfileSuccessState(this.profile);
}
class ShopProfileErrorState extends ShopState{
  final String error;

  ShopProfileErrorState(this.error);
}

class ShopUpdateProfileLoadingState extends ShopState{}
class ShopUpdateProfileSuccessState extends ShopState{
  final UpdateProfile updateProfile;

  ShopUpdateProfileSuccessState(this.updateProfile);
}
class ShopUpdateProfileErrorState extends ShopState{
  final String error;

  ShopUpdateProfileErrorState(this.error);
}

class ShopLogOutLoadingState extends ShopState{}
class ShopLogOutSuccessState extends ShopState{
  final LogOut logOut;

  ShopLogOutSuccessState(this.logOut);
}
class ShopLogOutErrorState extends ShopState{
  final String error;

  ShopLogOutErrorState(this.error);
}


class ShopHomeLoadingState extends ShopState{}
class ShopHomeSuccessState extends ShopState{
  final Home home;

  ShopHomeSuccessState(this.home);
}
class ShopHomeErrorState extends ShopState{
  final String error;

  ShopHomeErrorState(this.error);
}

class ShopCategoriesSuccessState extends ShopState{
  final Categories categories;

  ShopCategoriesSuccessState(this.categories);
}
class ShopCategoriesErrorState extends ShopState{
  final String error;

  ShopCategoriesErrorState(this.error);
}


class ShopCategoriesDetailsLoadingState extends ShopState{}
class ShopCategoriesDetailsSuccessState extends ShopState{
  final CategoriesDetails categoriesDetails;

  ShopCategoriesDetailsSuccessState(this.categoriesDetails);
}
class ShopCategoriesDetailsErrorState extends ShopState{
  final String error;

  ShopCategoriesDetailsErrorState(this.error);
}

class ShopProductsDetailsLoadingState extends ShopState{}
class ShopProductsDetailsSuccessState extends ShopState{
  final ProductsDetails productsDetails;

  ShopProductsDetailsSuccessState(this.productsDetails);
}
class ShopProductsDetailsErrorState extends ShopState{
  final String error;

  ShopProductsDetailsErrorState(this.error);
}


class ShopFavoritesLoadingState extends ShopState{}
class ShopFavoritesSuccessState extends ShopState{
  final Favorites favorites;

  ShopFavoritesSuccessState(this.favorites);
}
class ShopFavoritesErrorState extends ShopState{
  final String error;

  ShopFavoritesErrorState(this.error);
}

class ShopChangeFavoritesLoadingState extends ShopState{}
class ShopChangeFavoritesSuccessState extends ShopState{
  final ChangeFavorites changeFavorites;

  ShopChangeFavoritesSuccessState(this.changeFavorites);
}
class ShopChangeFavoritesErrorState extends ShopState{
  final String error;

  ShopChangeFavoritesErrorState(this.error);
}


class ShopSearchLoadingState extends ShopState{}
class ShopSearchSuccessState extends ShopState{
  final Search search;

  ShopSearchSuccessState(this.search);
}
class ShopSearchErrorState extends ShopState{
  final String error;

  ShopSearchErrorState(this.error);
}

class ShopCartLoadingState extends ShopState{}
class ShopCartSuccessState extends ShopState{
  final Cart cart;

  ShopCartSuccessState(this.cart);
}
class ShopCartErrorState extends ShopState{
  final String error;

  ShopCartErrorState(this.error);
}


class ShopGetCartLoadingState extends ShopState{}
class ShopGetCartSuccessState extends ShopState{
  final GetCart getCartItem;

  ShopGetCartSuccessState(this.getCartItem);
}
class ShopGetCartErrorState extends ShopState{
  final String error;

  ShopGetCartErrorState(this.error);
}



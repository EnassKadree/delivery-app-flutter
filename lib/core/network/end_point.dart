abstract class EndPoint {
  // BASE URL
  static const String baseUrl = 'http://10.0.2.2:8000/api/';  
  // AUTH
  static const String register = 'register';
  static const String login = 'login';

  // PROFILE updateProfile
  static const String userInfo = 'show';
  static const String updateProfile = 'update';


  // CATEGORIES
  static const String categories = 'categories';

  // STORES
  static const String stores = 'stores';

  // PRODUCTS
  static const String products = 'products';
  static const String cartProducts = 'Cart/show';
  static const String addToCart = 'Cart/add';
  static const String removeFromCart = 'Cart/delete';
  static const String favoriteProducts = 'Favorites';
  static const String addToFavorite = 'Favorite/add';
  static const String removeFromFavorite = 'Favorite/delete';
}

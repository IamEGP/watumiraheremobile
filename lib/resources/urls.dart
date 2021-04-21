class Urls {
  static const String _authBaseUrl = 'https://api.watumirahere.com/auth';
  static const String _apiBaseUrl = 'https://api.watumirahere.com';
  // static const String _baseUrl = 'http://192.168.137.1:8081';

  // Authentication
  static const String LOGIN = '$_authBaseUrl/login';
  static const String REFRESH_TOKEN = '$_authBaseUrl/refresh-token';
  static const String GET_USER = '$_authBaseUrl/current';
  static const String REGISTER_USER = '$_authBaseUrl';
  static const String VERIFY_USER = '$_authBaseUrl/verify';

  // Towns
  static const String TOWNS = '$_apiBaseUrl/towns';
  static const String TOWN = '$_apiBaseUrl/towns/';

  // Products
  static const String PRODUCTS = '$_apiBaseUrl/products';

  //User
  static const String COLLECTORS = '$_apiBaseUrl/collectors';

  static const String CART = '$_apiBaseUrl/cart';

  static const String ORDERS = '$_apiBaseUrl/orders';
}

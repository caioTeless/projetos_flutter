import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shop/exceptions/http_exception.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/utils/constants.dart';

class Products with ChangeNotifier {
  final String _baseUrl = '${Constants.BASE_API_URL}/products';

  List<Product> _items = [];

  dynamic _token;

  dynamic _userId;

  Products([this._token, this._userId, this._items = const []]);

  List<Product> get items => [..._items];

  List<Product> get favoriteItems {
    return _items.where((prod) => prod.isFavorite).toList();
  }

  int get itemCount {
    return _items.length;
  }

  Future<void> loadProducts() async {
    final response = await get(Uri.parse("$_baseUrl.json?auth=$_token"));
    Map<String, dynamic>? data = json.decode(response.body);

    final favResponse = await get(Uri.parse("${Constants.BASE_API_URL}/userFavorites/$_userId.json?auth=$_token"));
    final favMap = json.decode(favResponse.body);

    _items.clear();
    if (data != null) {
      data.forEach((productId, productData) {
        final isFavorite = favMap == null ? false : favMap[productId] ?? false;
        _items.add(
          Product(
            id: productId,
            title: productData['title'],
            description: productData['description'],
            price: productData['price'],
            imageUrl: productData['imageUrl'],
            isFavorite: isFavorite,
          ),
        );
      });
      notifyListeners();
    }
    return Future.value();
  }

  Future<void> addProduct(Product newProduct) async {
    // http
    final response = await post(
      Uri.parse("$_baseUrl.json?auth=$_token"),
      body: json.encode({
        'title': newProduct.title,
        'description': newProduct.description,
        'price': newProduct.price,
        'imageUrl': newProduct.imageUrl,
        'isFavorite': newProduct.isFavorite,
      }),
    );
    _items.add(
      Product(
        id: json.decode(response.body)['name'],
        title: newProduct.title,
        description: newProduct.description,
        price: newProduct.price,
        imageUrl: newProduct.imageUrl,
      ),
    );
    notifyListeners();
  }

  Future<void> updateProduct(Product product) async {
    if (product.id == null) {
      return;
    }
    final index = _items.indexWhere((prod) => prod.id == product.id);
    if (index >= 0) {
      await patch(Uri.parse('$_baseUrl/${product.id}.json?auth=$_token'), body: {
        json.encode({
          'title': product.title,
          'description': product.description,
          'price': product.price,
          'imageUrl': product.imageUrl,
        })
      });
      _items[index] = product;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String id) async {
    final index = _items.indexWhere((prod) => prod.id == id);
    if (index >= 0) {
      final product = _items[index];
      _items.remove(product);
      notifyListeners();
      final response = await delete(Uri.parse('$_baseUrl/${product.id}.json?auth=$_token'));

      if (response.statusCode >= 400) {
        _items.insert(index, product);
        notifyListeners();
        throw HttpException('Ocorreu um erro na exclusão do produto.');
      } 
    }
  }
}

// List<Product> get items {
//   if(_showFavoriteOnly){
//     return _items.where((prod) => prod.isFavorite).toList();
//   }
//   return [ ...items ];
// }

// bool _showFavoriteOnly = false;

// void showFavoriteOnly(){
//   _showFavoriteOnly = true;
//   notifyListeners();
// }

// void showAll(){
//   _showFavoriteOnly = false;
//   notifyListeners();
// }

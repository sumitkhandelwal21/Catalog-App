import 'package:flutter_catelog/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();
  
  CartModel._internal();

  factory CartModel() => cartModel;
  // catalog field
  late CatalogModel _catalog;

  // Collection of IDs - store Ids of each items
  final List<int> _itemIds = [];

  // get Catalog
  CatalogModel get catalog => _catalog;

  // set Catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add Item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

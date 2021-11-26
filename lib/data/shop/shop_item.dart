class ShopItem {
  final String _imageUrl;
  final String _itemName;
  final int _itemPrice;

  ShopItem(this._imageUrl, this._itemName, this._itemPrice);

  int get itemPrice => _itemPrice;

  String get itemName => _itemName;

  String get imageUrl => _imageUrl;
}

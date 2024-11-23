class CartModel {
  final String? asset;
  final String? model;
  final int? price;

  const CartModel({this.asset, this.model, this.price});
}

List viewCart = [];

List cartList = [
  const CartModel(
    asset: "assets/images/product/Cycle/large/Combatlarge.png",
    model: "Combat",
    price: 200,
  ),
  const CartModel(
    asset: "assets/images/product/Cycle/large/santa large.png",
    model: "Santa",
    price: 300,
  ),
  const CartModel(
    asset: "assets/images/product/Cycle/large/viperlarge.png",
    model: "Viper",
    price: 150,
  ),
  const CartModel(
    asset: "assets/images/product/accecories/helmet.png",
    model: "helmet",
    price: 50,
  ),
  const CartModel(
    asset: "assets/images/product/accecories/gloves.png",
    model: "Gloves",
    price: 30,
  ),
  const CartModel(
    asset: "assets/images/product/accecories/jersey.png",
    model: "jersey",
    price: 70,
  ),
  const CartModel(
    asset: "assets/images/product/accecories/shoes.png",
    model: "Shoes",
    price: 50,
  ),
];

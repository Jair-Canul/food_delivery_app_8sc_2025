import 'package:food_delivery_app_8sc_2025/model/burger_model.dart';

List<BurgerModel> getBurger() {
  List<BurgerModel> burger = [];
  BurgerModel burgerModel = new BurgerModel();

  burgerModel.name = "Chesse Burger";
  burgerModel.image = "images/burger1.png";
  burgerModel.price = "50";
  burger.add(burgerModel);
  burgerModel = new BurgerModel();

  burgerModel.name = "Veggie Burger";
  burgerModel.image = "images/burger2.png";
  burgerModel.price = "70";
  burger.add(burgerModel);
  burgerModel = new BurgerModel();

  burgerModel.name = "Veggie Burger";
  burgerModel.image = "images/burger3.png";
  burgerModel.price = "90";
  burger.add(burgerModel);
  burgerModel = new BurgerModel();

  burgerModel.name = "Veggie Burger";
  burgerModel.image = "images/burger4.png";
  burgerModel.price = "80";
  burger.add(burgerModel);
  burgerModel = new BurgerModel();

  return burger;
}

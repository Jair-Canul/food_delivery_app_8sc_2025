import 'package:food_delivery_app_8sc_2025/model/pizza_model.dart';

List<PizzaModel> getPizza() {
  List<PizzaModel> pizza = [];
  PizzaModel pizzaModel = new PizzaModel();

  pizzaModel.name = "Chesse Pizza";
  pizzaModel.image = "images/pizza1.png";
  pizzaModel.price = "100";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "Margherita pizza";
  pizzaModel.image = "images/pizza2.png";
  pizzaModel.price = "35";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "Margherita pizza";
  pizzaModel.image = "images/pizza3.png";
  pizzaModel.price = "99";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "Margherita pizza";
  pizzaModel.image = "images/pizza4.png";
  pizzaModel.price = "89";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  return pizza;
}

import 'package:food_delivery_app_8sc_2025/model/pizza_model.dart';

List<PizzaModel> getPizza() {
  List<PizzaModel> pizza = [];
  PizzaModel pizzaModel = new PizzaModel();

  pizzaModel.name = "Chesse Pizza";
  pizzaModel.image = "images/pizza1.png";
  pizzaModel.price = "50";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "Margherita pizza";
  pizzaModel.image = "images/pizza2.png";
  pizzaModel.price = "80";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "Margherita pizza";
  pizzaModel.image = "images/pizza2.png";
  pizzaModel.price = "80";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "Margherita pizza";
  pizzaModel.image = "images/pizza2.png";
  pizzaModel.price = "80";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();
  
  return pizza;
}

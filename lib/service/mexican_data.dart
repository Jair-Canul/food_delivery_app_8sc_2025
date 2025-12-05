import 'package:food_delivery_app_8sc_2025/model/mexican_model.dart';

List<MexicanModel> getMexican() {
  List<MexicanModel> mexican = [];
  MexicanModel mexicanModel = new MexicanModel();

  mexicanModel.name = "Tacos 1";
  mexicanModel.image = "images/tacos1.png";
  mexicanModel.price = "50";
  mexican.add(mexicanModel);
  mexicanModel = new MexicanModel();

  mexicanModel.name = "Tacos 1";
  mexicanModel.image = "images/tacos2.png";
  mexicanModel.price = "50";
  mexican.add(mexicanModel);
  mexicanModel = new MexicanModel();
  mexicanModel.name = "Tacos 1";
  mexicanModel.image = "images/tacos3.png";
  mexicanModel.price = "50";
  mexican.add(mexicanModel);
  mexicanModel = new MexicanModel();
  mexicanModel.name = "Tacos 1";
  mexicanModel.image = "images/tacos3.png";
  mexicanModel.price = "50";
  mexican.add(mexicanModel);
  mexicanModel = new MexicanModel();

  return mexican;
}

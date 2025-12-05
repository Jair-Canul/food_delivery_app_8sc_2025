import 'package:food_delivery_app_8sc_2025/model/chinese_model.dart';

List<ChineseModel> getChinese() {
  List<ChineseModel> chinese = [];
  ChineseModel chineseModel = new ChineseModel();

  chineseModel.name = "Chinese 1";
  chineseModel.image = "images/chinese1.png";
  chineseModel.price = "50";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  chineseModel.name = "Chinese 1";
  chineseModel.image = "images/chinese2.png";
  chineseModel.price = "60";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  chineseModel.name = "Chinese 1";
  chineseModel.image = "images/chinese3.png";
  chineseModel.price = "70";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  chineseModel.name = "Chinese 3";
  chineseModel.image = "images/chinese3.png";
  chineseModel.price = "80";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  return chinese;
}

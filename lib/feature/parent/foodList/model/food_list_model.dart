class FoodListModel {
  String? date;
  List<Menu>? menu;
  String? school;
  String? id;

  FoodListModel({this.date, this.menu, this.school, this.id});

  FoodListModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['menu'] != null) {
      menu = <Menu>[];
      json['menu'].forEach((v) {
        menu!.add(Menu.fromJson(v));
      });
    }
    school = json['school'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    if (menu != null) {
      data['menu'] = menu!.map((v) => v.toJson()).toList();
    }
    data['school'] = school;
    data['id'] = id;
    return data;
  }
}

class Menu {
  String? mainDish;
  String? appetizer;
  String? soup;
  String? dessert;
  String? drink;
  String? sId;

  Menu(
      {this.mainDish,
      this.appetizer,
      this.soup,
      this.dessert,
      this.drink,
      this.sId});

  Menu.fromJson(Map<String, dynamic> json) {
    mainDish = json['main_dish'];
    appetizer = json['appetizer'];
    soup = json['soup'];
    dessert = json['dessert'];
    drink = json['drink'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['main_dish'] = mainDish;
    data['appetizer'] = appetizer;
    data['soup'] = soup;
    data['dessert'] = dessert;
    data['drink'] = drink;
    data['_id'] = sId;
    return data;
  }
}

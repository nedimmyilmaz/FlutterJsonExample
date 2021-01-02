import 'model.dart';

class Araba {
  String arabaAdi;
  String ulke;
  int kurulus;
  List<Model> model;

  Araba({
      this.arabaAdi, 
      this.ulke, 
      this.kurulus, 
      this.model});

  Araba.fromJson(dynamic json) {
    arabaAdi = json["araba_adi"];
    ulke = json["ulke"];
    kurulus = json["kurulus"];
    if (json["model"] != null) {
      model = [];
      json["model"].forEach((v) {
        model.add(Model.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["araba_adi"] = arabaAdi;
    map["ulke"] = ulke;
    map["kurulus"] = kurulus;
    if (model != null) {
      map["model"] = model.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
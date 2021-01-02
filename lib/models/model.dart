class Model {
  String modelAdi;
  int fiyat;
  bool benzinli;

  Model({
      this.modelAdi, 
      this.fiyat, 
      this.benzinli});

  Model.fromJson(dynamic json) {
    modelAdi = json["model_adi"];
    fiyat = json["fiyat"];
    benzinli = json["benzinli"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["model_adi"] = modelAdi;
    map["fiyat"] = fiyat;
    map["benzinli"] = benzinli;
    return map;
  }

}
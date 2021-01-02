import 'data.dart';
import 'support.dart';

class Ornek {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<Data> data;
  Support support;

  Ornek({
      this.page, 
      this.perPage, 
      this.total, 
      this.totalPages, 
      this.data, 
      this.support});

  Ornek.fromJson(dynamic json) {
    page = json["page"];
    perPage = json["per_page"];
    total = json["total"];
    totalPages = json["total_pages"];
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
    support = json["support"] != null ? Support.fromJson(json["support"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["page"] = page;
    map["per_page"] = perPage;
    map["total"] = total;
    map["total_pages"] = totalPages;
    if (data != null) {
      map["data"] = data.map((v) => v.toJson()).toList();
    }
    if (support != null) {
      map["support"] = support.toJson();
    }
    return map;
  }

}
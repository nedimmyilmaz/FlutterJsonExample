import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutterjson/models/araba.dart';

class LocalJsonOrnegi extends StatefulWidget {
  @override
  _LocalJsonOrnegiState createState() => _LocalJsonOrnegiState();
}

class _LocalJsonOrnegiState extends State<LocalJsonOrnegi> {
  List<Araba> tumArabalar;

  @override
  void initState() {
    debugPrint("init st çalıştı");
    // veriKaynaginiOku().then((gelenArabaListesi) {
    //   setState(() {
    //     tumArabalar = gelenArabaListesi;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    veriKaynaginiOku();

    return Scaffold(
        appBar: AppBar(
          title: Text("Local Json "),
        ),
        body: Container(
          child: FutureBuilder(
            future: veriKaynaginiOku(),
            builder: (context, sonuc) {
              if (sonuc.hasData) {
                tumArabalar = sonuc.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tumArabalar[index].arabaAdi),
                      subtitle: Text(tumArabalar[index].ulke),
                    );
                  },
                  itemCount: tumArabalar.length,
                );
              } else {
                return Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ));
  }

  // @override
  // Widget build(BuildContext context) {
  //   veriKaynaginiOku();
  //
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Local Json "),
  //     ),
  //     body:  tumArabalar != null ? Container(
  //       child: RaisedButton(
  //           onPressed: () {},
  //           child: ListView.builder(
  //             itemBuilder: (context, index) {
  //               return ListTile(
  //                 title: Text(tumArabalar[index]["araba_adi"]),
  //                 subtitle: Text(tumArabalar[index]["ulke"]),
  //               );
  //             },
  //             itemCount: tumArabalar.length,
  //           )),
  //     ) : Center(child: CircularProgressIndicator(),)
  //   );
  // }

  Future<List> veriKaynaginiOku() async {
    // Future<String> jsonOku = DefaultAssetBundle.of(context).loadString("assets/data.araba.json");

    // jsonOku.then((okunan) {
    //   debugPrint(okunan);
    //   return okunan;
    // });

    var gelenJson = await DefaultAssetBundle.of(context)
        .loadString("assets/data/araba.json");
    debugPrint(gelenJson);

    List<Araba> arabaListesi = (json.decode(gelenJson) as List).map((mapYapisi) =>Araba.fromJson(
mapYapisi)).toList();
    debugPrint("toplam araba sayısı" + arabaListesi.length.toString());

    for (int i = 0; i <= arabaListesi.length - 1; i++) {
      debugPrint("Marka " + arabaListesi[i].arabaAdi.toString());
      debugPrint("Ülkesi  " + arabaListesi[i].ulke.toString());
    }
    return arabaListesi;
  }
}

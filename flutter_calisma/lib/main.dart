import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mesajlaşma Uygulaması",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mesajlaşma Arayüzü"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController txtMesaj = TextEditingController();
  List<MesajBalonu> mesajListesi = [];

  listeyeEkle(String gelenMesaj) {
    setState(() {
      MesajBalonu mesajNesnesi = MesajBalonu(mesaj: gelenMesaj);
      mesajListesi.insert(0, mesajNesnesi);
      txtMesaj.clear();
    });
  }

  Widget sohbetKutusu() {
    return Container(
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              onSubmitted: listeyeEkle,
              controller: txtMesaj,
            ),
          ),
          IconButton(
            onPressed: () => listeyeEkle(txtMesaj.text),
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Center(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                  reverse: true,
                  itemCount: mesajListesi.length,
                  itemBuilder: (context, indexNumarasi) =>
                      mesajListesi[indexNumarasi]),
            ),
            Divider(
              thickness: 3,
            ),
            sohbetKutusu(),
          ],
        ),
      ),
    );
  }
}

String isim = "Kullanici1";
String mesaj;

class MesajBalonu extends StatelessWidget {
  String mesaj;

  MesajBalonu({this.mesaj});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              child: Text(isim[0]),
            ),
            Column(
              children: <Widget>[
                Text(isim),
                Text(mesaj + "\n"),
              ],
            )
          ],
        ));
  }
}

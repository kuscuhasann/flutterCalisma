import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Liste Uygulaması",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste Çalışması"),
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
  TextEditingController metinAlici = TextEditingController();
  List alisverisListesi = [];

  listeyeEkle() {
    setState(() {
      alisverisListesi.add(metinAlici.text);
    });
  }

  listedenCikar() {
    setState(() {
      alisverisListesi.remove(metinAlici.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      child: Center(
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                    itemCount: alisverisListesi.length,
                    itemBuilder: (context, indexNumarasi) => ListTile(
                          title: Text(alisverisListesi[indexNumarasi]),
                        ))),
            TextField(
              controller: metinAlici,
            ),
            ElevatedButton(
                onPressed: listeyeEkle, child: Text("Listeye Nesne Ekleyin")),
            ElevatedButton(
                onPressed: listedenCikar,
                child: Text("Listeden Nesne Çıkartın ")),
          ],
        ),
      ),
    );
  }
}

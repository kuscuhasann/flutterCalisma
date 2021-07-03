import 'dart:html';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hesap Makinesi",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basit Hesap Makinesi"),
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
  num sayi1, sayi2, sonuc;
  TextEditingController textSayi1 = TextEditingController();
  TextEditingController textSayi2 = TextEditingController();

  turDonusumu() {
    setState(() {
      sayi1 = num.parse(textSayi1.text);
      sayi2 = num.parse(textSayi2.text);
    });
  }

  toplamaIslemi() {
    setState(() {
      turDonusumu();
      sonuc = sayi1 + sayi2;
    });
  }

  cikarmaIslemi() {
    setState(() {
      turDonusumu();
      sonuc = sayi1 - sayi2;
    });
  }

  bolmeIslemi() {
    setState(() {
      turDonusumu();
      sonuc = sayi1 / sayi2;
    });
  }

  carpmaIslemi() {
    setState(() {
      turDonusumu();
      sonuc = sayi1 * sayi2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      child: Center(
        child: Column(
          children: <Widget>[
            Text("$sonuc"),
            TextField(
              controller: textSayi1,
            ),
            TextField(
              controller: textSayi2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(onPressed: toplamaIslemi, child: Text("Topla")),
                ElevatedButton(
                    onPressed: cikarmaIslemi, child: Text("Çıkarma")),
                ElevatedButton(onPressed: bolmeIslemi, child: Text("Bölme")),
                ElevatedButton(onPressed: carpmaIslemi, child: Text("Çarpma")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

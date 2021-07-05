import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => GirisEkrani(),
        "/ProfilSayfasiRotasi": (context) => ProfilEkrani(),
      },
    );
  }
}

class GirisEkrani extends StatefulWidget {
  @override
  _GirisEkraniState createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  TextEditingController txtKullaniciAdi = TextEditingController();
  TextEditingController txtKullanciSifre = TextEditingController();
  profilEkraninaGider() {
    Navigator.pushNamed(context, "/ProfilSayfasiRotasi",
        arguments: VeriModeli(
            kullaniciAdi: txtKullaniciAdi.text,
            kullanciSifre: txtKullanciSifre.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş Ekrani"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: txtKullaniciAdi,
            ),
            TextFormField(
              controller: txtKullanciSifre,
            ),
            ElevatedButton(
                onPressed: profilEkraninaGider,
                child: Text("Profil Ekranına Geçmek için Basınız"))
          ],
        ),
      ),
    );
  }
}

class ProfilEkrani extends StatefulWidget {
  @override
  _ProfilEkraniState createState() => _ProfilEkraniState();
}

class _ProfilEkraniState extends State<ProfilEkrani> {
  girisEkraninaGit() {
    Navigator.pushNamed(context, "/");
  }

  @override
  Widget build(BuildContext context) {
    VeriModeli gelenMesaj = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Ekranı"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
                "Kullanıcı adı:  ${gelenMesaj.kullaniciAdi} \n Kullanıcı Sifre: ${gelenMesaj.kullanciSifre}"),
            ElevatedButton(
                onPressed: girisEkraninaGit,
                child: Text("Giriş Ekranına Gider"))
          ],
        ),
      ),
    );
  }
}

class VeriModeli {
  String kullaniciAdi, kullanciSifre;
  VeriModeli({this.kullaniciAdi, this.kullanciSifre});
}

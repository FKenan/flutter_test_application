import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const TestApp());
}

// container => genişlik yükseklik verilmezse içerik kadar yer kaplar.
// Row => children ile alt içeriklerini vereniliriz. mainAxisAligment ile x ekseninde hizalama yapabiliriz.
//    => crossAxisAligment ile y ekseninde hizalayabiliriz.
// Column => mainAxisAligment ile y, crossAxisAligment x üzerinde hizalama yaparız.
//    => mainAxisSize min ile içeriği kapsatabiliriz. max ile genişleyebildiği kadar genişler. wrap, match_parent mantığı

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Scaffold ile beyaz ekran getirttik. Scaffold içinde widgetlerimizi tanımlarız.
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue, title: Text("Test")),
        body: Row(
          children: [
            Container(width: 150, height: 150, color: Colors.red),
            Container(width: 150, height: 150, color: Colors.yellow),
            Container(width: 150, height: 150, color: Colors.pink),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint("buton tıklandı");
          },
          backgroundColor: Colors.red,
          child: Icon(Icons.add_home_work_sharp),
        ),
      ),
    );
  }

  Column myMainColumn() {
    // 1. Örnek Schafold un bodysine yazarak çalıştırabiliriz.
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [myPinkContainer(), myPinkContainer()],
    );
  }

  Container myPinkContainer() {
    return Container(
      height: 300,
      color: Colors.pink,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [myContainer(), myContainer()],
      ),
    );
  }

  Container myContainer() {
    // bu kodları scaffold altında yazmak yerine method olarak yazdık.Kod okunabilirliği için
    return Container(
      margin: EdgeInsets.all(
        8,
      ), // margin kullanım. all yerine symmetric vb gibi özellikler verip sağdan soldan ayarlayabliriz.
      padding: EdgeInsets.all(8), // padding kullanım
      color: Colors.amber,
      height: 100,
      width: 100,
      alignment: Alignment.center,
      child: Container(
        height: 100,
        width: 100,
        color: Colors.red,
        child: Text("Merhaba"),
      ),
    );
  }
}

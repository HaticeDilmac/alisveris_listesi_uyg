import 'package:flutter/material.dart';

void main() {
  runApp(uygulamam());
}

class uygulamam extends StatelessWidget {
  const uygulamam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:   Center(
          child: Text(
            'Alışveriş Listesi',
            style: TextStyle(
              fontSize: 25.0
            ),
          ),
        ),
      ),
      body: iskelet(),
    ));
  }
}

class iskelet extends StatefulWidget {
  const iskelet({Key? key}) : super(key: key);

  @override
  State<iskelet> createState() => _iskeletState();
}

class _iskeletState extends State<iskelet> {
  TextEditingController t1 = TextEditingController();//controller koyduk
  List alisverisListesi = [];//boş bir liste hazırladık

  elemanEkle() {
    setState(() {
      alisverisListesi.add(t1.text);
      t1.clear();
    });
  }

  elemanCikar() {
    setState(() {
      alisverisListesi.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:15.0,bottom:15.0),
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: alisverisListesi.length,
              itemBuilder: (context, indeksNumarasi) => ListTile(
                subtitle: Text('Alışveriş Malzemeleri'),
                title: Text(alisverisListesi[indeksNumarasi]),
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Ürünleri yazınız...',
            ),
            cursorColor: Colors.black,
            controller: t1,
          ),
          const SizedBox(height: 20.0,),
           Row(
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: elemanEkle,
                  child: Text('+',
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  ),
                ),
                SizedBox(width: 290.0,),
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: elemanCikar,
                  child: const Text(
                      '-',style: TextStyle(
                    fontSize: 40.0
                  ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

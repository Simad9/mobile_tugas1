import 'package:flutter/material.dart';
import '../../import/all_pages.dart';

class GenapganjilPage extends StatefulWidget {
  const GenapganjilPage({super.key});

  @override
  State<GenapganjilPage> createState() => _GenapganjilPageState();
}

class _GenapganjilPageState extends State<GenapganjilPage> {
  final TextEditingController angkaController = TextEditingController();
  String angka = "Angka";
  void cek() {
    if (angkaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Masukkan angka terlebih dahulu!')),
      );
      return;
    }
    if (angkaController.text.length > 16) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Maksimal 16 digit!')),
      );
      return;
    }
    int? num = int.tryParse(angkaController.text);
    if (num == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Masukkan angka bulat yang valid!')),
      );
      return;
    }

    if (num % 2 == 0) {
      angka = "Genap";
    } else {
      angka = "Ganjil";
    }
    setState(() {
      angka = angka;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // button mbalik
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Image.asset(
                "images/backbutton.png",
                width: 32,
                height: 32,
              ),
            ),
            SizedBox(height: 20),
            // judul
            Align(
              alignment: Alignment.center,
              child: Text(
                "Genap Ganjil",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Silahkan masukan angka dibawah",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            // Input Username
            TextField(
              controller: angkaController,
              keyboardType: TextInputType.number,
              maxLength: 16,
              decoration: InputDecoration(
                hintText: "Angka",
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            // tombol kalkulasi
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () => cek(),
                child: const Text(
                  "Angka apa yak?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xff4DC5F2),
                    Color(0xffFF61E4),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Hasil yang didapat",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        angka == "Angka" ? "Angka" : angka,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
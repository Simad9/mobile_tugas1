import 'package:flutter/material.dart';
import '../../import/all_pages.dart';

class MaxminPage extends StatefulWidget {
  const MaxminPage({super.key});

  @override
  State<MaxminPage> createState() => _MaxminPageState();
}

class _MaxminPageState extends State<MaxminPage> {
  final TextEditingController angkaController = TextEditingController();
  List<int> angkaList = [];

  void perulangan() {
    int i = int.tryParse(angkaController.text) ?? 0;
    setState(() {
      angkaList = List.generate(i, (index) => 0);
    });
  }

  void hitungMaxMin() {
    if (angkaList.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Peringatan"),
            content: const Text("Masukkan angka terlebih dahulu!"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              )
            ],
          );
        },
      );
      return;
    }

    int max = angkaList.reduce((curr, next) => curr > next ? curr : next);
    int min = angkaList.reduce((curr, next) => curr < next ? curr : next);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Hasil"),
          content: Text("Max: $max, Min: $min"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tombol Kembali
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Image.asset(
                "images/backbutton.png",
                width: 32,
                height: 32,
              ),
            ),
            const SizedBox(height: 20),

            // Judul
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Max Min",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            // Deskripsi
            const Text(
              "Silahkan masukan angka di bawah",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),

            // Input angka jumlah elemen
            TextField(
              controller: angkaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Jumlah angka",
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol Generate Input
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
                onPressed: perulangan,
                child: const Text(
                  "Buat Input",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Daftar Input Angka
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: angkaList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      int input = int.tryParse(value) ?? 0;
                      setState(() {
                        angkaList[index] = input;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Angka ke-${index + 1}",
                      border: const OutlineInputBorder(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),

            // Tombol Hitung Max Min
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
                onPressed: hitungMaxMin,
                child: const Text(
                  "Hitung",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

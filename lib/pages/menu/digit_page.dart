import 'package:flutter/material.dart';
import '../../import/all_pages.dart';

class DigitPage extends StatefulWidget {
  const DigitPage({super.key});

  @override
  State<DigitPage> createState() => _DigitPageState();
}

class _DigitPageState extends State<DigitPage> {
  final TextEditingController textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String result = "Hasil";
  String errorText = "";
  void cek() {
    if (textController.text.isEmpty) {
      setState(() {
        errorText = "Input tidak boleh kosong";
      });
      return;
    }
    if (textController.text.length > 100) {
      setState(() {
        errorText = "Input tidak boleh lebih dari 100 karakter";
      });
      return;
    }
    String input = textController.text;
    int letterCount = 0;
    int digitCount = 0;
    int specialCharCount = 0;

    for (int i = 0; i < input.length; i++) {
      if (input[i].toLowerCase().contains(RegExp(r'[a-z]'))) {
        letterCount++;
      } else if (input[i].contains(RegExp(r'[0-9]'))) {
        digitCount++;
      } else {
        specialCharCount++;
      }
    }
    setState(() {
      result = 'Huruf: $letterCount, '
          'Digit: $digitCount, '
          'Karakter Khusus: $specialCharCount';
      errorText = "";
    });
    _focusNode.unfocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    textController.dispose();
    super.dispose();
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
                  "Digit",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Silahkan masukan apapun dibawah",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              // Input Username
              TextField(
                controller: textController,
                focusNode: _focusNode,
                keyboardType: TextInputType.text,
                maxLength: 100,
                decoration: InputDecoration(
                  hintText: "Masukkan teks",
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  errorText: errorText.isEmpty ? null : errorText,
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
                    "Cek Teks",
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
                          result == "Hasil" ? "Hasil" : result,
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
        ));
  }
}
import 'package:flutter/material.dart';
import '../import/all_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Home Page'),
            Text("Selamat datang di Home Page"),
            SizedBox(height: 30),
            buttonPrimary(context, 'Kalkulator', KalkulatorPage()),
            buttonPrimary(context, "Bilangan Bulat", BilanganPage()),
            buttonLogout(context, "Keluar")
          ],
        ),
      ),
    );
  }

  Widget buttonPrimary(BuildContext context, String text, Widget page) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          backgroundColor: Color(0xFF4CA2FF),
        ),
        child: Text(text,
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)));
  }

  Widget buttonLogout(BuildContext context, String text) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
              (route) => false);
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          backgroundColor: Color(0xFF4CA2FF),
        ),
        child: Text(text,
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)));
  }
}

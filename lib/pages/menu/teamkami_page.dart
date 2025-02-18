import 'package:flutter/material.dart';
import '../../import/all_pages.dart';

class TeamkamiPage extends StatelessWidget {
  const TeamkamiPage({super.key});

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
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
                "Team Kami",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),

            // Foto kami
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
                childAspectRatio: 1.1,
                children: [
                  boxFoto("images/foto1.png", "WIJDAN AKHMAD S", "12320010"),
                  boxFoto("images/foto1.png", "AQSHA JAUZAARAFA", "12320016"),
                  boxFoto("images/foto1.png", "VRIDA PUSPARANI", "12320082"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget boxFoto(String path, String nama, String nim) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Color(0xff4DC5F2),
            Color(0xffFF61E4),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              path,
              width: 98,
              height: 98,
            ),
          ),
          SizedBox(height: 5),
          Text(
            nama,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(nim,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ],
      ),
    );
  }
}

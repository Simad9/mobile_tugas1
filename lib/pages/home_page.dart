import 'package:flutter/material.dart';
import '../import/all_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Halo, bang!",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Silakan pilih menu di bawah ini",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 60),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text("Menu",
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 10),

                  // Menu Box
                  Center(
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      padding: EdgeInsets.all(20),
                      children: [
                        customButton(Icons.groups_2_outlined, "Team Kami",
                            context, TeamkamiPage()),
                        customButton(Icons.calculate_outlined, "Hitung",
                            context, HitungPage()),
                        customButton(Icons.filter_list_rounded, "Genap Ganjil",
                            context, GenapganjilPage()),
                        customButton(
                            Icons.functions, "Digit", context, DigitPage()),
                        // customButton(
                        //     Icons.functions, "Hitung", context, MaxminPage()),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  // _buttonTeam(context),

                  // Tombol Keluar
                  _buttonHitam(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buttonTeam(BuildContext context) {
  //   return SizedBox(
  //     width: double.infinity,
  //     height: 50,
  //     child: ElevatedButton.icon(
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: Colors.white,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(30),
  //         ),
  //       ),
  //       onPressed: () {
  //         // Implement login logic here
  //         Navigator.pushReplacement(
  //             context, MaterialPageRoute(builder: (context) => TeamkamiPage()));
  //       },
  //       icon: Icon(
  //         Icons.groups_2_outlined,
  //         color: Colors.black54,
  //       ),
  //       label: Text(
  //         "Team Kami",
  //         style: TextStyle(
  //             color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w500),
  //       ),
  //     ),
  //   );
  // }

  Widget _buttonHitam(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          // Implement login logic here
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        child: const Text(
          "Keluar",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget customButton(
      IconData icon, String label, BuildContext context, Widget widget) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.black),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

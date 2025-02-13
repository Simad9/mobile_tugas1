import 'package:flutter/material.dart';
import './/import/all_pages.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Login Page'),
            Text("Silahkan login untuk melanjutkan"),
            SizedBox(height: 30),
            formInput(
              hint: 'Username',
              icon: Icons.person,
              controller: usernameController,
            ),
            SizedBox(height: 20),
            formInput(
              hint: 'Password',
              icon: Icons.lock,
              controller: passwordController,
              obscureText: true,
            ),
            SizedBox(height: 20),
            buttonPrimary(
              context,
              'Login',
              usernameController: usernameController,
              passwordController: passwordController,
            ),
          ],
        ),
      ),
    );
  }

  Widget formInput({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool obscureText = false,
  }) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: Container(
              padding: EdgeInsets.all(10),
              child: Icon(icon, color: Color(0xFFBFC3C4)),
            ),
            hintText: hint,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xFFBFC3C4)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xFFBFC3C4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color.fromARGB(255, 88, 91, 91)),
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonPrimary(
    BuildContext context,
    String text, {
    required TextEditingController usernameController,
    required TextEditingController passwordController,
  }) {
    return ElevatedButton(
      onPressed: () {
        String username = usernameController.text;
        String password = passwordController.text;

        if (username == 'admin' && password == 'admin') {
          print('Login Berhasil');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          print('Login Gagal');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login Gagal'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        backgroundColor: Color(0xFF4CA2FF),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

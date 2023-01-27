import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();
  bool checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              height: 150,
              child: Image.asset(
                "assets/logo/login.png",
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Silahkan masuk dengan nomor telkomsel kamu",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Nomor HP",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: loginController,
              keyboardType: TextInputType.phone,
              autocorrect: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Cth. 082310340xxxx",
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  activeColor: Colors.red,
                  value: checkbox,
                  onChanged: (value) {
                    setState(() {
                      checkbox = !checkbox;
                    });
                  },
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: "Saya menyetujui ",
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: "syarat",
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        const TextSpan(
                          text: ",",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: "ketentuan",
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        const TextSpan(
                          text: ", dan ",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: "privasi",
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        const TextSpan(
                          text: " Telkomsel",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/home");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                fixedSize: const Size(150, 50),
              ),
              child: const Text(
                "MASUK",
                style: TextStyle(
                  color: Color(0xFF747D8C),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text("Atau masuk menggunakan"),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      const Size(150, 50),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    side: MaterialStateProperty.all(
                      const BorderSide(
                        color: Color(0xFF3B5998),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/facebook.png",
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(width: 7),
                      const Text(
                        "Facebook",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF3B5998),
                        ),
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      const Size(150, 50),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    side: MaterialStateProperty.all(
                      const BorderSide(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/google.png",
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(width: 7),
                      const Text(
                        "Google",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

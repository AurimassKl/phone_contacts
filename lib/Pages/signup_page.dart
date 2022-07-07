import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: GestureDetector(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).padding.top + kToolbarHeight),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 144, 95, 228),
                  Colors.white,
                ],
              ),
            ),
            child: Column(
              children: [
                const Image(
                  height: 301,
                  fit: BoxFit.fill,
                  image: AssetImage('assets/contacts.png'),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        width: 300,
                        height: 230,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: name,
                              cursorColor: Colors.black,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                hintStyle: TextStyle(color: Colors.black),
                                hintText: 'Name',
                                border: InputBorder.none,
                              ),
                            ),
                            Container(
                              width: 300,
                              height: 1,
                              color: Colors.grey[400],
                            ),
                            TextField(
                              controller: email,
                              cursorColor: Colors.black,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                hintStyle: TextStyle(color: Colors.black),
                                hintText: 'Email address',
                                border: InputBorder.none,
                              ),
                            ),
                            Container(
                              width: 300,
                              height: 1,
                              color: Colors.grey[400],
                            ),
                            TextField(
                              controller: password,
                              cursorColor: Colors.black,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              obscureText: !passwordVisible,
                              decoration: InputDecoration(
                                icon: const Icon(
                                  Icons.lock_outline_rounded,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                hintStyle: const TextStyle(color: Colors.black),
                                hintText: 'Password',
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        passwordVisible = !passwordVisible;
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 300,
                              height: 1,
                              color: Colors.grey[400],
                            ),
                            TextField(
                              controller: confirmPassword,
                              cursorColor: Colors.black,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              obscureText: !confirmPasswordVisible,
                              decoration: InputDecoration(
                                icon: const Icon(
                                  Icons.lock_outline_rounded,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                hintStyle: const TextStyle(color: Colors.black),
                                hintText: 'Confirm Password',
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        confirmPasswordVisible =
                                            !confirmPasswordVisible;
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    confirmPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 230),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
                          minimumSize: const Size(180, 40),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('SIGN UP'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

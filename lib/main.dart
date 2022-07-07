import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Pages/signin_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PhoneContacts',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: const LoginPage(),
      ),
    );
  }
}

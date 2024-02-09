import 'package:Alaqsa/Features/HomeScreen/Presentation/View/SearchProduct/Screens/BuildScanBarCode.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
void initState() {
Future.delayed(Duration(seconds: 4),() {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    return BuildScan();
  },));
},);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("Assets/Images/6770245.jpg"),
        ],
      ),
    );
  }
}

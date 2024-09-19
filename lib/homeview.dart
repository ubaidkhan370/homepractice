import 'package:flutter/material.dart';
import 'package:homepractice/icecream/icecream_view.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: IcecreamView(),),
    );
  }
}

import 'package:entrance/app/common/util/exports.dart';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  final String? urlImage;
  const BackgroundWidget({super.key, required this.child, this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(
            height: 450.h,
            width: double.infinity,
            child: Image.asset(
              urlImage ?? AppImages.backgroudImg,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 450.h,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 1.0],
                    colors: [AppColors.kBlackLight, Colors.black])),
          ),
          child
        ],
      ),
    );
  }
}

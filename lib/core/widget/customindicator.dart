// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:my_app/core/const.dart';

// class CustomIndicator extends StatelessWidget {
//   final dynamic dotIndex;

//   const CustomIndicator({Key? key, required this.dotIndex,  }) : super(key: key) 
    

//   }
//   final int dotIndex;

//   @override
//   Widget build(BuildContext context) {
//     return DotsIndicator(
//       decorator: DotsDecorator(
//           color: Colors.transparent,
//           activeColor: kMainColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//             side: BorderSide(color: kMainColor),
//           )),
//       dotsCount: 3,
//       position:  dotIndex,
//     );
//   }
// }
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/const.dart';

class CustomIndicator extends StatelessWidget {
  final int? dotIndex;

  const CustomIndicator({Key? key, required this.dotIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
          color: Colors.transparent,
          activeColor: kMainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: kMainColor),
          )),
      dotsCount: 3,
      position: dotIndex!,
    );
  }
}
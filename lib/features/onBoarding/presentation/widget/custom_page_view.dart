// import 'package:flutter/material.dart';
// import 'package:my_app/features/onBoarding/presentation/widget/pageView_item.dart';

// class CustomPageView extends StatelessWidget {
//   const CustomPageView({super.key, this.pageController});
// final PageController? pageController ;
//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       controller: pageController ,
// children: [
//   PageviewItem(
// image: 'assets/images/Onboard1.jpg' ,


//   ),


// PageviewItem(
// image: 'assets/images/Onboard2.jpg',


//   ),



// PageviewItem(
// image: 'assets/images/Onboard3.png',


//   ),

















// ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:my_app/features/onBoarding/presentation/widget/pageView_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, this.pageController});
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: 3, // Replace with the actual number of pages
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return PageviewItem(
              image: 'assets/images/Onboard1.jpg',
            );
          case 1:
            return PageviewItem(
              image: 'assets/images/Onboard2.jpg',
            );
          case 2:
            return PageviewItem(
              image: 'assets/images/Onboard3.png',
            );
          default:
            return const SizedBox.shrink(); // Or any other widget you want to display
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_app/core/utils/size_conf.dart';
import 'package:my_app/core/widget/buttons.dart';
import 'package:my_app/core/widget/customindicator.dart';
import 'package:my_app/features/onBoarding/presentation/widget/custom_page_view.dart';
import 'package:my_app/login_page.dart';
import 'package:my_app/main.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(
initialPage: 0

    )..addListener((){

setState(() {
  
});

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPageView(
          pageController: pageController,
        ),
        Positioned(
          bottom: 30,
          left: 17,
          child: CustomIndicator( 
            dotIndex: pageController!.hasClients ? pageController!.page!.round() : 0,
            
          ),
        ),
        Positioned(
          left: SizeConfig.defaultSize!*23,
          bottom: SizeConfig.defaultSize!*1,
          child: CustomGeneralButton(
            onTap: (){
if (pageController!.page! <2){
pageController?.nextPage(
  duration: Duration(microseconds: 500) , 
  curve: Curves.easeIn);
}else{

Get.to(() => LoginPage(), transition: Transition.rightToLeft , duration: Duration(microseconds: 500));

}
            },
           text: pageController!.hasClients ? (pageController?.page ==0 ? 'Get Started' : 'Next') :'Next',
             
            
          ),
        ),
      ],
    );
  }
}


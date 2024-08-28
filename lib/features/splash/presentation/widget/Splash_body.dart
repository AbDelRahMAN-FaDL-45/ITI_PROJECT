import 'package:flutter/material.dart';
import 'package:my_app/core/utils/size_conf.dart';
import 'package:my_app/features/onBoarding/presentation/onBoarding.dart';
import 'package:get/get.dart';
class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    goToNextView();
    SizeConfig().init(context);

    
    return Scaffold(
      
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Splash.png'),
            fit: BoxFit.cover,  
           
          ),
           
        ),
       
        
       
     
      ),
    );
  }
  
  goToNextView() {
    Future.delayed(Duration(seconds: 6) ,() {
      Get.to(()=>OnboardingView(), transition: Transition.fade);
    });
  }
 }



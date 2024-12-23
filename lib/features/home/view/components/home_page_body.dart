import 'package:delivery_app/Core/constants/app_colors.dart';
import 'package:delivery_app/core/Extensions/space_extension.dart';
import 'package:delivery_app/features/home/view/components/custom_app_bar.dart';
import 'package:delivery_app/features/home/view/components/stor_item.dart';
import 'package:flutter/material.dart';


class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: 
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const CustomAppBar(),
            8.spaceH,
              const StorItem(),
            ],
          ),
        )
  
    );
  }
}

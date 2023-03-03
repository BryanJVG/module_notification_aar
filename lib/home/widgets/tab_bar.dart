import 'package:flutter/material.dart';
import 'package:module_notification/assets/colors.dart';

class TabsHome extends StatelessWidget {
  const TabsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: AppColors.darkBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.home, color: Theme.of(context).colorScheme.secondary),
          Icon(Icons.search, color: AppColors.iconWhite),
          Icon(Icons.notifications_none, color: AppColors.iconWhite),
          Icon(Icons.mail_outline, color: AppColors.iconWhite)
        ],
      ),
    );
  }
}
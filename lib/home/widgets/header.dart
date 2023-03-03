import 'package:flutter/material.dart';
import 'package:module_notification/assets/colors.dart';
import 'package:module_notification/models/user_model.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.darkBlue,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(right: 30.0),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(userModel.imageProfile),
              ),
            ),
          ),
          Flexible(
            child: ImageIcon(
              const AssetImage('assets/images/twitter.png'),
              size: 24,
              color: AppColors.originalBlue,
            ),
          ),
          Flexible(child: Text(userModel.username)),
        ],
      ),
      elevation: 4.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:to_do_app/assets/app_colors.dart';
import 'package:to_do_app/assets/app_text__styles.dart';

class CustomTile extends GetWidget {
  const CustomTile({
    Key? key,
    required this.title,
    required this.onTap,
    required this.leading,
    required this.trailing,
  }) : super(key: key);
  final String? title;
  final VoidCallback? onTap;
  final IconData? leading;
  final IconData? trailing;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.transparent,
      elevation: .0,
      child: ListTile(
        dense: true,
        leading: Icon(
          leading,
          color: AppColors.primary,
        ),
        title: Text(
          title!,
          style: AppTextStyle.primaryTextstyle,
        ),
        onTap: onTap,
        trailing: Icon(
          trailing,
          size: 15.w,
        ),
      ),
    );
  }
}

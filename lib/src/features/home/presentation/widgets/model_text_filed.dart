import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';

class ModelTextFiled extends StatelessWidget {
  const ModelTextFiled({
    super.key,
    required this.title,
    required this.hint,
    this.controller,
    required this.onChanged,
  });
  final String title;
  final String hint;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          width: 120.w,
          height: 50.h,
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: StyleManager.getRegularStyle(
                fontSize: FontSize.s14,
                color: ColorManager.black.withOpacity(0.60),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

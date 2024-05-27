import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/features/home/data/constants/diseases_constants.dart';

class ModelDropDownButton extends StatelessWidget {
  const ModelDropDownButton({
    super.key,
    this.onChanged,
    required this.title,
  });

  final void Function(String?)? onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          width: 120.w,
          height: 60.h,
          child: DropdownButtonFormField2(
            // validator: validator,
            dropdownStyleData: DropdownStyleData(
              width: 120.w,
              maxHeight: 120.h,
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: ColorManager.black,
              ),
            ),
            style: StyleManager.getMediumStyle(
                fontSize: FontSize.s13, color: ColorManager.black),
            decoration: InputDecoration(
              filled: false,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.0.w,
                vertical: 10.0.h,
              ),
              enabledBorder: _getTFFBorderStyle(),
              focusedBorder: _getTFFBorderStyle(color: ColorManager.secondary),
              errorBorder: _getTFFBorderStyle(color: ColorManager.brightRed),
              focusedErrorBorder: _getTFFBorderStyle(),
              border: _getTFFBorderStyle(),
            ),
            items: _dropDonList().map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
            hint: _hint(),
          ),
        ),
      ],
    );
  }

  static InputBorder _getTFFBorderStyle({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? ColorManager.primary,
        width: 2.w,
      ),
      borderRadius: BorderRadius.circular(
        10.r,
      ),
    );
  }

  List<String> _dropDonList() {
    if (title == StringsManager.chosesCameraResolution) {
      return resolutionList;
    } else if (title == StringsManager.gpuOption) {
      return ["true", "false"];
    } else {
      return [];
    }
  }

  Widget _hint() {
    return Center(
      child: Text(
        title == StringsManager.chosesCameraResolution
            ? StringsManager.resolution
            : title == StringsManager.gpuOption
                ? StringsManager.gpu
                : "",
        style: StyleManager.getRegularStyle(
          fontSize: FontSize.s14,
          color: ColorManager.black.withOpacity(0.60),
        ),
      ),
    );
  }
}

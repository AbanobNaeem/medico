import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({
    super.key,
    this.onGoogleTap,
    this.onFaceBookTap,
    this.onAppleTap,
  });

  final VoidCallback? onGoogleTap;
  final VoidCallback? onFaceBookTap;
  final VoidCallback? onAppleTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialMediaButton(
          onTap: onGoogleTap,
          AssetsManager.google,
        ),
        16.horizontalSpace,
        _buildSocialMediaButton(
          onTap: onFaceBookTap,
          AssetsManager.facebook,
        ),
        16.horizontalSpace,
        _buildSocialMediaButton(
          onTap: onAppleTap,
          AssetsManager.apple,
        ),
      ],
    );
  }

  Widget _buildSocialMediaButton(String assetName, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(assetName),
    );
  }
}

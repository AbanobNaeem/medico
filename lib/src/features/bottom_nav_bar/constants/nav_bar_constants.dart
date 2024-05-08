import 'package:flutter/material.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/features/chat/screens/messages_screen.dart';
import 'package:xpert/src/features/home/presentation/screens/home_screen.dart';
import 'package:xpert/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:xpert/src/features/setting/presentation/screen/setting_screen.dart';

class PlaceHolder extends StatefulWidget {
  const PlaceHolder({
    super.key,
    this.title,
  });
  final String? title;
  @override
  State<PlaceHolder> createState() => _PlaceHolderState();
}

class _PlaceHolderState extends State<PlaceHolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.title!),
      ),
    );
  }
}

List<Widget> navBarPages = const [
  HomeScreen(),
  MessagesScreen(),
  SettingScreen(),
  ProfileScreen(),
];

class MenuItemModel {
  final String selectedAsset;
  final String unselectedAsset;
  final int index;

  MenuItemModel({
    required this.selectedAsset,
    required this.unselectedAsset,
    required this.index,
  });
}

final List<MenuItemModel> navBarItems = [
  MenuItemModel(
    selectedAsset: AssetsManager.filledHomeIc,
    unselectedAsset: AssetsManager.unfilledHomeIc,
    index: 0,
  ),
  MenuItemModel(
    selectedAsset: AssetsManager.filledChatIc,
    unselectedAsset: AssetsManager.unfilledChatIc,
    index: 1,
  ),
  MenuItemModel(
    selectedAsset: AssetsManager.unfilledSettingsIc,
    unselectedAsset: AssetsManager.unfilledSettingsIc,
    index: 2,
  ),
  MenuItemModel(
    selectedAsset: AssetsManager.filledProfileIc,
    unselectedAsset: AssetsManager.unfilledProfileIc,
    index: 3,
  ),
];

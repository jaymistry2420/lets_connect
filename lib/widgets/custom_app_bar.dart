import 'package:flutter/material.dart';
import 'package:lets_connect/config/palette.dart';
import 'package:lets_connect/models/models.dart';
import 'package:lets_connect/widgets/custom_tab_bar.dart';
import 'package:lets_connect/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icon;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBar({
    Key key,
    @required this.currentUser,
    @required this.icon,
    @required this.selectedIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'connect',
              style: const TextStyle(
                color: Palette.facebookBlue,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.1,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: 600.0,
            child: CustomTabBar(
              icons: icon,
              selectedIndex: selectedIndex,
              onTap: onTap,
              isBottomIndicator : true
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(currentUser: currentUser),
                const SizedBox(
                  width: 12.0,
                ),
                CircleButton(
                  icon: Icons.search,
                  iconSize: 30.0,
                  iconColor: Colors.black,
                  onPressed: () {},
                ),
                CircleButton(
                  icon: MdiIcons.facebookMessenger,
                  iconSize: 30.0,
                  iconColor: Colors.black,
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

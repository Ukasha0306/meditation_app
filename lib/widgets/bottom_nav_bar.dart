import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';



class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      height: size.height*0.10,
      color: Colors.white,
      child:  const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavItem(
            title: "Today",
            svgSrc: "assets/icons/calendar.svg",
          ),
          BottomNavItem(
              title: "All Exercises",
              svgSrc: "assets/icons/gym.svg",
              isActive : true
          ),
          BottomNavItem(
            title: "Settings",
            svgSrc: "assets/icons/Settings.svg",
          ),

        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgSrc;
  final String title;
  final VoidCallback? press;
  final bool isActive;
  const BottomNavItem({
    super.key, required this.svgSrc, required this.title,  this.press,  this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(svgSrc,
            colorFilter: isActive ? const ColorFilter.mode(kActiveIconColor, BlendMode.srcIn) : null,),
          Text(title, style:
          TextStyle(color: isActive ? kActiveIconColor : kTextColor),),

        ],
      ),
    );
  }
}
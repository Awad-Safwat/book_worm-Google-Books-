import 'package:flutter/material.dart';

class CustomAppBarIcon extends StatelessWidget {
  const CustomAppBarIcon({
    this.onPressed,
    super.key,
    this.icon,
    this.textButtonLable,
    this.isIcon = false,
  });
  final IconData? icon;
  final void Function()? onPressed;
  final String? textButtonLable;
  final bool? isIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: isIcon!
            ? IconButton(
                icon: Icon(
                  icon,
                  size: 32,
                ),
                onPressed: onPressed,
              )
            : TextButton(
                onPressed: onPressed,
                child: Text(textButtonLable!),
              ));
  }
}

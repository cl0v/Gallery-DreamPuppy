import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class SocialButtonWidget extends StatelessWidget {
  const SocialButtonWidget({
    super.key,
    this.onPressed,
    required this.icon,
    required this.text,
    required this.color,
  });

  final VoidCallback? onPressed;
  final Widget icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: CupertinoDynamicColor.resolve(
        Color.fromARGB(0xFF, color.red, color.green, color.blue),
        context,
      ),
      disabledColor: CupertinoDynamicColor.resolve(
        Color.fromARGB(55, color.red, color.green, color.blue),
        context,
      ),
      onPressed: onPressed,
      padding: const EdgeInsets.only(left: 12, right: 36),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          const Gap(12),
          Text(text),
          //     // Assets.icons.icons8Whatsapp48.image(height: 22),
          //     // const SizedBox(),
        ],
      ),
    );
  }
}

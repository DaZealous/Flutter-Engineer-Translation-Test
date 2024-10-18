import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomOffers extends HookWidget {
  const CustomOffers(
      {super.key,
      required this.title,
      required this.middleTitle,
      required this.subTitle,
      required this.textColor,
      required this.backgroundColor,
      required this.shape});

  final String title;
  final String middleTitle;
  final String subTitle;
  final Color textColor;
  final Color backgroundColor;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    final counter = useState(1);

    useEffect(() {
      final timer = Timer.periodic(const Duration(milliseconds: 2), (timer) {
        if (counter.value < (int.tryParse(middleTitle) ?? 1000)) {
          counter.value++;
        } else {
          timer.cancel();
        }
      });
      return timer.cancel;
    }, []);

    return Container(
      decoration: BoxDecoration(
        shape: shape,
        color: backgroundColor,
        borderRadius:
            shape != BoxShape.circle ? BorderRadius.circular(20.0) : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: textColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${counter.value}',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: textColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            subTitle,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: textColor),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

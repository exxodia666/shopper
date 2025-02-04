import 'package:flutter/material.dart';
import 'package:shopper/theme/colors.dart';

class AnimatedHeart extends StatefulWidget {
  const AnimatedHeart({
    Key? key,
    required this.isFavorite,
    required this.onPress,
  }) : super(key: key);

  final Function onPress;
  final bool isFavorite;
  @override
  State<AnimatedHeart> createState() => _AnimatedHeartState();
}

class _AnimatedHeartState extends State<AnimatedHeart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addListener(() {
        print(_scaleAnimation.status);
        setState(() {});
      });
    _scaleAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.5), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.5, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPress();
        if (_controller.status != AnimationStatus.forward &&
            _controller.status != AnimationStatus.reverse) {
          _controller.forward(from: 0.1);
        }
      },
      child: Container(
        width: 36.0,
        height: 36.0,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18.0)),
        child: Transform.scale(
            scale: _scaleAnimation.value,
            child: widget.isFavorite
                ? const Icon(
                    Icons.favorite,
                    color: CustomColors.red,
                  )
                : const Icon(
                    Icons.favorite_border,
                    color: CustomColors.black,
                  )),
      ),
    );
  }
}

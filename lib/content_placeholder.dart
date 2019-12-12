import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class ContentPlaceholder extends StatelessWidget {
  static Widget block({
    double width,
    double height,
    BuildContext context,
    EdgeInsets spacing = _Styles.defaultSpacing,
    double borderRadius = _Styles.defaultBorderRadius,
  }) {
    return Container(
      width: context != null ? MediaQuery.of(context).size.width : width,
      height: height != null ? height : _Styles.defaultHeight,
      margin: spacing,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: _Styles.defaultBlockColor,
      ),
    );
  }

  final Widget child;
  final double width;
  final double height;
  final double borderRadius;
  final BuildContext context;
  final EdgeInsets spacing;
  final Color bgColor;
  final bool isAnimationEnabled;
  final Color highlightColor;

  ContentPlaceholder({
    this.width,
    this.height,
    this.context,
    this.spacing = _Styles.defaultSpacing,
    this.bgColor = _Styles.defaultPlaceholderColor,
    this.highlightColor = _Styles.defaultPlaceholderHighlight,
    this.isAnimationEnabled = true,
    this.borderRadius = _Styles.defaultBorderRadius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return this.child != null
        ? Padding(
            padding: this.spacing,
            child: Shimmer.fromColors(
              baseColor: bgColor,
              highlightColor: highlightColor,
              child: child,
              enabled: isAnimationEnabled,
            ),
          )
        : ContentPlaceholder(
            bgColor: this.bgColor,
            highlightColor: this.highlightColor,
            isAnimationEnabled: this.isAnimationEnabled,
            child: ContentPlaceholder.block(
              width: this.width,
              height: this.height,
              context: this.context,
              spacing: EdgeInsets.all(0),
              borderRadius: this.borderRadius,
            ),
          );
  }
}

class _Styles {
  static const EdgeInsets defaultSpacing =
      const EdgeInsets.fromLTRB(0, 0, 0, 10);
  static const double defaultBorderRadius = 8;
  static const double defaultHeight = 100;
  static const Color defaultBlockColor = Colors.white;
  static const Color defaultPlaceholderColor = const Color(0xFFf1f3f4);
  static const Color defaultPlaceholderHighlight = const Color(0xFFe4e7e8);
}

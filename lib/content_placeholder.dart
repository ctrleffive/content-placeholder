import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class ContentPlaceholder extends StatelessWidget {
  /// Single block for group of shapes. `block` should be used only inside a `ContentPlaceholder`.
  static Widget block({
    double? width,
    double? height,
    BuildContext? context,
    double topSpacing = 0,
    double leftSpacing = 0,
    double rightSpacing = 0,
    double bottomSpacing = _Styles.defaultSpacingSingle,
    double borderRadius = _Styles.defaultBorderRadius,
  }) {
    return Container(
      width: width,
      height: height ?? _Styles.defaultHeight,
      margin: EdgeInsets.fromLTRB(
        leftSpacing,
        topSpacing,
        rightSpacing,
        bottomSpacing,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: _Styles.defaultBlockColor,
      ),
    );
  }

  /// If child is `null` you will get one block. If child contains some widget, the widget will be covered with placeholder.
  final Widget? child;

  /// Default width will be 100%.
  final double? width;
  final double? height;
  final double borderRadius;
  final BuildContext? context;
  final EdgeInsets spacing;

  /// Blocks background color
  final Color bgColor;

  /// Is shimmer animation needed. Default is `true`.
  final bool isAnimationEnabled;

  /// Shimmer animation gradient color.
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
    if (this.child != null) {
      return Padding(
        padding: this.spacing,
        child: Shimmer.fromColors(
          baseColor: bgColor,
          highlightColor: highlightColor,
          child: child!,
          enabled: isAnimationEnabled,
        ),
      );
    } else {
      return ContentPlaceholder(
        bgColor: this.bgColor,
        highlightColor: this.highlightColor,
        isAnimationEnabled: this.isAnimationEnabled,
        child: ContentPlaceholder.block(
          width: this.width,
          height: this.height,
          context: this.context,
          topSpacing: this.spacing.top ,
          leftSpacing: this.spacing.left,
          rightSpacing: this.spacing.right,
          bottomSpacing: this.spacing.bottom,
          borderRadius: this.borderRadius,
        ),
      );
    }
  }
}

class _Styles {
  static const double defaultSpacingSingle = 10;
  static const EdgeInsets defaultSpacing =
      const EdgeInsets.fromLTRB(0, 0, 0, _Styles.defaultSpacingSingle);
  static const double defaultBorderRadius = 8;
  static const double defaultHeight = 100;
  static const Color defaultBlockColor = Colors.white;
  static const Color defaultPlaceholderColor = const Color(0xFFf1f3f4);
  static const Color defaultPlaceholderHighlight = const Color(0xFFe4e7e8);
}

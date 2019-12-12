import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContentPlaceholder extends StatelessWidget {
  static Widget block({
    double width,
    double height,
    BuildContext context,
    EdgeInsets spacing = const EdgeInsets.fromLTRB(0, 0, 0, 10),
    double borderRadius = 8,
  }) {
    return Container(
      width: context != null ? MediaQuery.of(context).size.width : width,
      height: height != null ? height : 100,
      margin: spacing,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.white,
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
    this.spacing = const EdgeInsets.fromLTRB(0, 0, 0, 10),
    this.bgColor = const Color(0xFFf1f3f4),
    this.highlightColor = const Color(0xFFe4e7e8),
    this.isAnimationEnabled = true,
    this.borderRadius = 8,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return this.child != null ? Padding(
      padding: this.spacing,
      child: Shimmer.fromColors(
        baseColor: bgColor,
        highlightColor: highlightColor,
        child: child,
        enabled: isAnimationEnabled,
      ),
    ) : ContentPlaceholder(
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

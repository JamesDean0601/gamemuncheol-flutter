import 'package:flutter/material.dart';

class PaddingBuilder {
  EdgeInsets? _padding;
  late final Widget _child;

  PaddingBuilder withPadding({
    double? left,
    double? right,
    double? top,
    double? bottom,
    double? horizontal,
    double? vertical,
  }) {
    _padding = EdgeInsets.only(
      left: left ?? (horizontal == null ? 0 : horizontal / 2),
      right: right ?? (horizontal == null ? 0 : horizontal / 2),
      top: top ?? (vertical == null ? 0 : vertical / 2),
      bottom: bottom ?? (vertical == null ? 0 : vertical / 2),
    );

    return this;
  }

  Padding withChild(Widget child) {
    _child = child;

    return Padding(
      padding: _padding ?? const EdgeInsets.all(0),
      child: _child,
    );
  }
}

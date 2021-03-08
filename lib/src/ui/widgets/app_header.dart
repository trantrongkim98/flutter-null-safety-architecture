import 'package:flutter/material.dart';
import 'package:flutterarchitecture/src/utils/colors.dart';

/// [AppHeader] default header of all screen
class AppHeader extends StatelessWidget {
  ///
  const AppHeader({
    Key? key,
    this.back,
    this.more,
    this.title,
    this.onMore,
    this.onBack,
    this.isSafeArea = false,
    this.backgroundColor = AppColor.transparent,
  }) : super(key: key);

  /// this's back widget of AppHeader
  final Widget? back;

  /// this's more widget of AppHeader
  final Widget? more;

  /// this's title widget of AppHeader
  final Widget? title;

  /// this's function for widget more
  final Function()? onMore;

  /// this's function for widet back
  final Function()? onBack;

  /// it'll have SafeArea widget if it's true
  final bool isSafeArea;

  /// [backgroundColor] background color of header
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    if (this.isSafeArea) {
      return Container(
        color: this.backgroundColor,
        child: SafeArea(
          child: _content(),
        ),
      );
    }
    return _content();
  }

  Widget _content() {
    return Container(
      color: this.backgroundColor,
      child: Row(
        children: [
          _back(),
          Expanded(child: _title()),
          _more(),
        ],
      ),
    );
  }

  Widget _back() {
    if (this.back == null && this.more == null) return Container();
    if (this.back == null) return Opacity(opacity: 0, child: this.more);
    return GestureDetector(
      child: Container(
        child: this.back,
        color: AppColor.transparent,
      ),
    );
  }

  Widget _title() {
    if (this.title == null) return Container();
    return this.title!;
  }

  Widget _more() {
    if (this.back == null && this.more == null) return Container();
    if (this.more == null) return Opacity(opacity: 0, child: this.back);
    return GestureDetector(
      child: Container(
        child: this.more,
        color: AppColor.transparent,
      ),
    );
  }
}

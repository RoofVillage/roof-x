import '_components/page_header.dart';

mixin PageHeaderBuilder {
  PageHeader buildPageHeader({
    String text,
    double horizontalGutter,
  }) =>
      PageHeader(
        text: text,
        horizontalGutter: horizontalGutter,
      );
}

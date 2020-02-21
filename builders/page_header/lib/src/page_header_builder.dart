import '_components/page_header.dart';

mixin PageHeaderBuilder {
  PageHeader buildPageHeader(String title) => PageHeader(
        title: title,
      );
}

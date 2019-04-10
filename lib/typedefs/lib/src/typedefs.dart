import 'package:flutter/material.dart';

typedef ChildrenBuilder = List<Widget> Function(BuildContext context);
typedef ColorGetter = Color Function(BuildContext context);
typedef ContextPasser = void Function(BuildContext context);
typedef EventListener = void Function();
typedef FlagListener = void Function(bool flag);

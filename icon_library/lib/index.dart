export 'references.dart';

import 'references.dart';

class IconReference {
  static final cashSack = SmallIconReference(path: 'cash_sack.svg');
  static final balances = SmallIconReference(path: 'balances.svg');
  static final action = SmallIconReference(path: 'action.svg');
  static final info = NavigationIconReference(path: 'info.svg');
  static final logoFull =
      NavigationIconReference(path: 'logo_full.svg', customWidth: 67);
}

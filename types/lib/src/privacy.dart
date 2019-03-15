import 'package:string_from_enum_string/index.dart';

enum _PrivacyTypeOption { context, world }

class PrivacyType {
  final _PrivacyTypeOption _value;
  const PrivacyType._internal(this._value);
  factory PrivacyType.fromString(String string) {
    final option = _PrivacyTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return PrivacyType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
//     func title(context: AppContext) -> String {
//         switch self {
//         case .context:
//             switch context {
//             case .user: return "Private"
//             case .roof: return "Roommates only"
//             case .landlord: return "Team only"
//             case .lease: return "Tenant only"
//             }
//         case .world: return "Public"
//         }
//     }
//  func largeImage(context: AppContext) -> UIImage? {
//         switch self {
//         case .context:
//             switch context {
//             case .user: return #imageLiteral(resourceName: "roommate")
//             case .roof: return #imageLiteral(resourceName: "roommate")
//             case .landlord: return #imageLiteral(resourceName: "landlord")
//             case .lease: return #imageLiteral(resourceName: "lease")
//             }
//         case .world: return #imageLiteral(resourceName: "globepriv")
//         }
//     }

//     func smallImage(context: AppContext) -> UIImage {
//         switch self {
//         case .context:
//             switch context {
//             case .user: return #imageLiteral(resourceName: "userpriv-small")
//             case .roof: return #imageLiteral(resourceName: "userpriv-small")
//             case .landlord: return #imageLiteral(resourceName: "userpriv-small")
//             case .lease: return #imageLiteral(resourceName: "userpriv-small")
//             }
//         case .world: return #imageLiteral(resourceName: "globepriv-small")
//         }
//     }
}

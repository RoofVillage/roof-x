import 'package:views/src/view.dart';
import 'package:views/src/view_model.dart';
import 'package:views/src/view_models/index.dart';

class LoginView extends View<LoginViewModel> {
  @override
  String get address => "login";

  @override
  ViewModel get model => LoginViewModel();
}














// class ViewData<T extends View> {
//   final String address;

//   ViewData._internal(this.address);

//   Future<T> get data => http.get('https://views/$address').then((res) {
//         return json.decode(res.body);
//       });

//   factory ViewData.load(T view) {
//     return ViewData._internal(view.address);
//   }
// }

// String _addressForView(View view) {
//   switch (view.address) {
//     case View.login:
//       return "login";
//     default:
//       return null;
//   }
// }

// typedef ArtboardBuilder<T> = Widget Function(BuildContext, AsyncSnapshot<T>);

// abstract class WelcomeViewModel {
//   String day;
//   int temperature;
// }

// abstract class View<T> {
//   ViewId get id;

//   ArtboardBuilder<T> get artboardBuilder;

//   FutureBuilder<T> get viewBuilder => FutureBuilder<T>(
//         future: ViewDataService.getData(id),
//         builder: artboardBuilder,
//       );
// }

// class LoginView extends View<WelcomeViewModel> {
//   @override
//   ViewId get id => ViewId.login;

//   @override
//   ArtboardBuilder<WelcomeViewModel> get artboardBuilder => (context, snapshot) {
//         return Column(
//           children: [
//             Text("Sup, it's ${snapshot.data.day}."),
//             Text("And currently ${snapshot.data.temperature} degrees out."),
//           ],
//         );
//       };
// }

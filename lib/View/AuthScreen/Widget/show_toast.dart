import 'package:fluttertoast/fluttertoast.dart';

class CommonToast {
  static void showToast(msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
  }
}

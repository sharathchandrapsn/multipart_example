import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class UploadProvider extends ChangeNotifier {
  Future<String?> uploadImage(filename, url) async {
    var request = MultipartRequest('POST', Uri.parse(url));
    request.files.add(await MultipartFile.fromPath('picture', filename));
    var res = await request.send();
    return res.reasonPhrase;
  }

  String? state = "";

  String? get getState => state;

  setState(String? state) {
    this.state = state;
    notifyListeners();
  }
}

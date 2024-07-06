import 'package:hngt2/secrets.dart';

class Photo {
  final String url;
  Photo({
    required this.url
});
  factory Photo.fromJson(Map<String, dynamic> json){
    return Photo(url: json["url"]);
  }
}

extension PE on Photo {

  String get link =>
     '${ AppSecrets.baseUrl}images/$url';
}
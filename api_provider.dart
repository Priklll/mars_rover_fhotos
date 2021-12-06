import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:photo_from_the_rover/features/models/photo.dart';
import 'package:photo_from_the_rover/features/models/photo_manifest.dart';
import 'package:photo_from_the_rover/features/models/rover.dart';

class Provider {
  NasaEndpoint _endpoint = NasaEndpoint();

  Future<List<Photos>> getPhoto() async {
    final response = await http.get(Uri.parse(
        "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=2000&api_key=sb8F9naJTo9Isy04Ye7KV6a5PZbPdiIlwiCn319b"));
    if (response.statusCode == 200) {
      final List<dynamic> photoJson =
          (jsonDecode(response.body) as Map)['photos'];
      // print(photoJson);
      return photoJson.map((json) => Photos.fromJson(json)).toList();
    } else {
      throw Exception("Error");
    }
  }

  Future<RoverManifest> getManifest() async {
    final response = await http.get(Uri.parse("https://api.nasa.gov/mars-photos/api/v1/manifests/spirit?api_key=eb0Q4TEg6PKMZTlKogsUBgxQWGHH1SrWEgqfQxP4")
        // final response = await http.get(Uri.parse("${_endpoint.getManifestUri(rover)}")
    );
    if (response.statusCode == 200) {
      final dynamic manifestJson =
          (jsonDecode(response.body) as Map)['photo_manifest'];
      // print(manifestJson);
      RoverManifest manifest = RoverManifest.fromJson(manifestJson);
      return manifest;
    } else {
      throw Exception("Error");
    }
  }
}

class NasaEndpoint {
  String host = 'https://api.nasa.gov/mars-photos/api/v1/';
  String apiKey = 'eb0Q4TEg6PKMZTlKogsUBgxQWGHH1SrWEgqfQxP4';

  Uri getManifestUri(Rover rover) {
    return Uri.parse(host + rover.name + '?api_key=' + apiKey);
  }

  Uri getPhotoToSolUri(RoverData rover, int sol){
    return Uri.parse(host + 'rovers/' + rover.name + '/photos?sol=' + '$sol' + '&api_key=' + apiKey);
  }

}

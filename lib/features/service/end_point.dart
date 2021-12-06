import 'package:photo_from_the_rover/features/models/rover.dart';

class NasaEndpoint {
  String host = 'https://api.nasa.gov/mars-photos/api/v1/';
  String apiKey = 'eb0Q4TEg6PKMZTlKogsUBgxQWGHH1SrWEgqfQxP4';

  Uri getManifestUri(Rover rover) {
    String uriStr = host + 'manifests/' + rover.name + '?api_key=' + apiKey;
    print("Generated manifest uri: $uriStr");
     return Uri.parse(uriStr);
  }

  Uri getPhotoToSolUri(Rover rover, int sol){
    return Uri.parse(host + 'rovers/' + rover.name + '/photos?sol=' + '$sol' + '&api_key=' + apiKey);
  }

}
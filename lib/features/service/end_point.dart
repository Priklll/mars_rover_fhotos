import 'package:photo_from_the_rover/features/models/rover.dart';

class NasaEndpoint {
  String host = 'https://api.nasa.gov/mars-photos/api/v1/';
  String apiKey = 'INCrvBcbuIcSdVngxiyxgZSZWDVqCmaPlCPO2EhP';

  Uri getManifestUri(Rover rover) {
    String uriStr = host + 'manifests/' + rover.name + '?api_key=' + apiKey;
    print("Generated manifest uri: $uriStr");
     return Uri.parse(uriStr);
  }

  Uri getPhotoToSolUri(Rover rover, int sol){
    return Uri.parse(host + 'rovers/' + rover.name + '/photos?sol=' + '$sol' + '&api_key=' + apiKey);
  }

  Uri getPhotoToEarthDateUri(Rover rover, String earthDate){
   return Uri.parse(host + 'rovers/' + rover.name + '/photos?earth_date=' + earthDate + '&api_key=' + apiKey);
  }
}
// https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2015-6-3&api_key=INCrvBcbuIcSdVngxiyxgZSZWDVqCmaPlCPO2EhP
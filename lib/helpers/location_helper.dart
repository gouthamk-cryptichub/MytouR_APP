const GOOGLE_API_KEY = 'Here vil be the key after getting the google map api';

class LocationHelper {
  static String generateLocationPreviewImage({double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:V%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}

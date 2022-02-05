class ApiConstants {
  Map<String, String> getHeader() => {
        'Content-Type': 'application/json',
      };

  final baseUrl = '';

  String saveUserLocationUrl() =>
      baseUrl + 'https://dry-citadel-09478.herokuapp.com/dataToFirebase';

  final paramName = 'name';
  final paramLatitude = 'lat';
  final paramLongitude = 'long';
}

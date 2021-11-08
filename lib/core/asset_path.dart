const String imageAssetsRoot = "assets/";

//! folder name
const String logo = 'logo';

//! logo
final String logoSmall = _getImagePath("$logo/logo.png");

String _getImagePath(String fileName) {
  return imageAssetsRoot + fileName;
}

final String _imageUrlMedium = 'https://image.tmdb.org/t/p/w300/';
final String _imageUrlLrge = 'https://image.tmdb.org/t/p/w500/';

//contruimos la url del poster
String getMediumPictureUrl(String path) => _imageUrlMedium + path;
String getLargePictureUrl(String path) => _imageUrlLrge + path;

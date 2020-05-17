class Film {
  final String title;
  final String imagePath =
      'https://avatars.mds.yandex.net/get-kinopoisk-image/1704946/c6adfa98-a415-4565-bacf-38855e4919a6/x1000';
  final List<String> genres = ['Comedy'];
  final String description = 'Description of the film';
  final List<String> countries = ['USA'];
  final Duration duration = Duration(hours: 1, minutes: 32);

  Film(this.title);
}
class Film {
  final int id;
  final String title;
  final String imagePath;
  final List<String> genres = ['Comedy'];
  final String description = 'Description of the film';
  final List<String> countries = ['USA'];
  final Duration duration = Duration(hours: 1, minutes: 32);

  Film({this.title, this.id, this.imagePath});
}
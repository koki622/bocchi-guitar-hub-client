class RepositoryException implements Exception {
  final String message;
  RepositoryException(this.message);

  @override
  String toString() => 'RepositoryException: $message';
}

class SongNotFoundException extends RepositoryException {
  SongNotFoundException(int songId) : super('Song with ID $songId not found.');
}

class ChordNotFoundException extends RepositoryException {
  ChordNotFoundException(int songId)
      : super('Chord with ID $songId not found.');
}

class BeatNotFoundException extends RepositoryException {
  BeatNotFoundException(int songId) : super('Beat with ID $songId not found.');
}

class SectionNotFoundException extends RepositoryException {
  SectionNotFoundException(int songId)
      : super('Section with ID $songId not found.');
}

class LyricNotFoundException extends RepositoryException {
  LyricNotFoundException(int songId)
      : super('Lyric with ID $songId not found.');
}

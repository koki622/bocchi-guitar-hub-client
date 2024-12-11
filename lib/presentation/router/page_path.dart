enum PageId {
  top,
  practice,
}

/// 設計上の画面パス
extension PagePath on PageId {
  String get path {
    switch (this) {
      case PageId.top:
        return '/';
      case PageId.practice:
        return '/practice';
    }
  }
}

/// 設計上の画面名
extension PageName on PageId {
  String get routeName {
    switch (this) {
      case PageId.top:
        return 'top';
      case PageId.practice:
        return 'practice';
    }
  }
}

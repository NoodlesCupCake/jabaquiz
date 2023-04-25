class NicknameGenerator {
  static final _first = ['Wireless', 'Quiz', 'James', 'Bam', 'No Work'];
  static final _second = [
    'Lover',
    'Sad',
    'Ever',
    'Again',
    'Pro',
    'lnwza',
    'Assa',
    'Please',
    '(✿◡‿◡)',
    '╰(*°▽°*)╯',
    '༼ つ ◕_◕ ༽つ',
    '(๑•̀ㅂ•́)و✧'
  ];

  static String get generate {
    _first.shuffle();
    _second.shuffle();
    return _first.first + ' ' + _second.first;
  }
}

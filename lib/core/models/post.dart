import 'user.dart';

class Post {
  final String text;
  final String? mediaUrl;
  final int repostsCount;
  final int likesCount;
  final String time;
  final User user;

  Post(
    this.text,
    this.mediaUrl,
    this.repostsCount,
    this.likesCount,
    this.time,
    this.user,
  );
}

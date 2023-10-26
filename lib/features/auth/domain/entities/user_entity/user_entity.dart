import 'package:hive/hive.dart';
part 'user_entity.g.dart';

@HiveType(typeId: 2)
class UserEntity {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String userImageUrl;
  @HiveField(2)
  final String userAccessToken;
  @HiveField(3)
  final String userName;

  UserEntity(
      {required this.userName,
      required this.email,
      required this.userImageUrl,
      required this.userAccessToken});
}

import '../../app_database.dart';






Future<Map<String, int>> seedRole(
    AppDatabase db,
    ) async {
  final data =
    [
      'Characters',
      'Battleline',
      'Dedicated Transports',
      'Fortifications',
      'Other',
    ];


  final result = <String, int>{};

  for (final role in data) {
    final id = await db.into(db.role)
        .insert(RoleCompanion.insert(role: role));
    result[role] = id;
  }

  return result;
}

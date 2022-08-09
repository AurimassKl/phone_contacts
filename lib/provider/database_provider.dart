import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phone_contacts/models/database_model.dart';

final databaseProvider = Provider<Database>((ref) {
  return Database();
});

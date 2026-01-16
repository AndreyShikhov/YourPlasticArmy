import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/domain/models/codex/codex_id.dart';
import 'package:ypa/domain/models/unit/unit_dom.dart';
import 'package:ypa/domain/models/unit/unit_repository.dart';

// class GetUnitsForBuilder {
//   final UnitRepository repository;
//
//   GetUnitsForBuilder(this.repository);
//
//   Future<List<UnitDOM>> call({
//     required String codexIdRaw,
//     required String roleTitle,
//   }) async {
//     final codexId = CodexId.fromString(codexIdRaw);
//
//     // Превращаем строковый титул роли обратно в Enum UnitRoleCode
//     final role = UnitRoleCode.values.firstWhere(
//       (r) => r.title == roleTitle,
//       orElse: () => UnitRoleCode.other,
//     );
//
//     return repository.findByCodexAndRole(codexId, role);
//   }
// }

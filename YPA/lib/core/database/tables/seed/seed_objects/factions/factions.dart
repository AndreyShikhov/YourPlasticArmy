import 'package:ypa/domain/models/faction/faction.dart';
import '../_types.dart';



List<FactionSeed> getAllFactions() {
  return
    [
      FactionSeed(
          code: FactionTypeCode.imperium,
          name: FactionName(FactionTypeCode.imperium.title),
      ),
      FactionSeed(
        code: FactionTypeCode.chaos,
        name: FactionName(FactionTypeCode.chaos.title),
      ),
      FactionSeed(
        code: FactionTypeCode.xenos,
        name: FactionName(FactionTypeCode.xenos.title),
      ),

    ];
}
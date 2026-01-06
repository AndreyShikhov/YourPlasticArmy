
import '../_types.dart';

List<CodexSeed> getAllCodexes()
{
  return const [
      CodexSeed(
          code: CodexCode.ultramarines,
          army: ArmyCode.spaceMarines,
      ),
      CodexSeed(
          code: CodexCode.bloodAngels,
          army: ArmyCode.spaceMarines,
      ),
  ];
}

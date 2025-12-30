
import '../_types.dart';


List<StrategemsSeed> strategemsSeed() {
  return const[
   StrategemsSeed(
       code: 'command_re_roll',
       name: 'Command Re-roll',
       description: 'Re-roll one Command roll test.',
       phase: 'Command',
       target: 'Yourself',
       effect: 'Re-roll one D6',
       condition: null,
       oncePerBattle:  false,
       codexId: 'ultramarines',
       detachmentId: null),
    StrategemsSeed(
        code: 'angelic_grace',
        name: 'Angelic Grace',
        description: 'Use when a Blood Angels unit is destroyed.',
        phase: 'Any',
        target: 'Blood Angels unit',
        effect: 'Roll a D6, on a 4+ the unit returns to play',
        condition: null,
        oncePerBattle:  true,
        codexId: 'blood_angels',
        detachmentId: null),

  ];
}
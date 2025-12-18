
import '../_types.dart';


List<StrategemsSeed> strategemsSeed() {
  return const[
   StrategemsSeed(
       code: 'comand_re_role',
       name: 'Comand re-role',
       description: 'description',
       phase: 'phase',
       target: 'target',
       effect: 'effect',
       condition: 'condition',
       oncePerBattle:  false,
       codexId: 'NULL',
       detachmentId: 'NULL'),
    StrategemsSeed(
        code: 'angelic_grace',
        name: 'Angelic Grace',
        description: 'description',
        phase: 'phase',
        target: 'target',
        effect: 'effect',
        condition: 'condition',
        oncePerBattle:  false,
        codexId: 'blood_angels',
        detachmentId: 'detachmentId'),

  ];
}
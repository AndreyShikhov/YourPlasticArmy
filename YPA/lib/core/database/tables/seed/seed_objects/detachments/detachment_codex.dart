/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../_types.dart';

List<DetachmentCodexLinkSeed> detachmentsCodex()
{
    return const[
        ///=============Spacemarines - Blood angels============
        DetachmentCodexLinkSeed(
            detachmentCode: 'encarmine_speartip',
            codex: CodexTypeCode.bloodAngels,
            isGeneral: false
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'wrath_of_the_doomed',
            codex: CodexTypeCode.bloodAngels,
            isGeneral: false
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'angelic_inheritors',
            codex: CodexTypeCode.bloodAngels,
            isGeneral: false
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'gladius_task_force',
            codex: CodexTypeCode.bloodAngels,
            isGeneral: false
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'phobos_shadow_force',
            codex: CodexTypeCode.bloodAngels,
            isGeneral: false
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'phobos_shock_force',
            codex: CodexTypeCode.bloodAngels,
            isGeneral: true
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'ironclad_champions',
            codex: CodexTypeCode.bloodAngels,
            isGeneral: true
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'tactical_brethren',
            codex: CodexTypeCode.bloodAngels,
            isGeneral: true
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'tacticus_firestorm_force',
            codex: CodexTypeCode.bloodAngels,
            isGeneral: true
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'terminator_storm_force',
            codex: CodexTypeCode.bloodAngels,
            isGeneral: true
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'devastator_brethren',
            codex: CodexTypeCode.bloodAngels,
            isGeneral: true
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'ironstorm_spearhead',
            codex: CodexTypeCode.bloodAngels,
            isGeneral: true
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'gauntlet_task_force',
            codex: CodexTypeCode.bloodAngels,
            isGeneral: true
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'stormlance_task_force',
            codex: CodexTypeCode.bloodAngels,
            isGeneral: true
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'gravis_linebreaker_force',
            codex: CodexTypeCode.bloodAngels,
            isGeneral: true
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'gravis_siege_force',
            codex: CodexTypeCode.bloodAngels,
            isGeneral: true
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'tacticus_attack_force',
            codex: CodexTypeCode.bloodAngels,
            isGeneral: true
        ),
        ///=============Spacemarines - Dark angels============
        DetachmentCodexLinkSeed(
            detachmentCode: 'unforgiven_task_force',
            codex: CodexTypeCode.darkAngels,
            isGeneral: false
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'inner_circle_task_force',
            codex: CodexTypeCode.darkAngels,
            isGeneral: false
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'company_of_hunters',
            codex: CodexTypeCode.darkAngels,
            isGeneral: false
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'wrath_of_the_rock',
            codex: CodexTypeCode.darkAngels,
            isGeneral: false
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'lions_blade_task_force',
            codex: CodexTypeCode.darkAngels,
            isGeneral: false
        ),

        ///=============Spacemarines - Black templars============
        DetachmentCodexLinkSeed(
            detachmentCode: 'companions_of_vehemence',
            codex: CodexTypeCode.blackTemplars,
            isGeneral: false
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'vindication_task_force',
            codex: CodexTypeCode.blackTemplars,
            isGeneral: false
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'godhammer_assault_force',
            codex: CodexTypeCode.blackTemplars,
            isGeneral: false
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'wrathful_procession',
            codex: CodexTypeCode.blackTemplars,
            isGeneral: false
        ),

        ///=============Spacemarines - Space wolfs============
        DetachmentCodexLinkSeed(
            detachmentCode: 'saga_of_the_hunter',
            codex: CodexTypeCode.spaceWolves,
            isGeneral: false
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'saga_of_the_bold',
            codex: CodexTypeCode.spaceWolves,
            isGeneral: false
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'saga_of_the_beastslayer',
            codex: CodexTypeCode.spaceWolves,
            isGeneral: false
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'champions_of_fenris',
            codex: CodexTypeCode.spaceWolves,
            isGeneral: false
        ),
        DetachmentCodexLinkSeed(
            detachmentCode: 'saga_of_the_great_wolf',
            codex: CodexTypeCode.spaceWolves,
            isGeneral: false
        ),

        ///=============Spacemarines - Deathwatch============
        DetachmentCodexLinkSeed(
            detachmentCode: 'black_spear_task_force',
            codex: CodexTypeCode.deathWatch,
            isGeneral: false
        ),

        ///=============Spacemarines - Imrepial fists============
        DetachmentCodexLinkSeed(
            detachmentCode: 'emperors_shield',
            codex: CodexTypeCode.imperialFists,
            isGeneral: false
        ),

        ///=============Spacemarines - Iron hands============
        DetachmentCodexLinkSeed(
            detachmentCode: 'hammer_of_avernii',
            codex: CodexTypeCode.ironHands,
            isGeneral: false
        ),

        ///=============Spacemarines - Raven guard============
        DetachmentCodexLinkSeed(
            detachmentCode: 'shadowmark_talon',
            codex: CodexTypeCode.ravenGuard,
            isGeneral: false
        ),

        ///=============Spacemarines - Salamanders============
        DetachmentCodexLinkSeed(
            detachmentCode: 'forgefatherss_seekers',
            codex: CodexTypeCode.salamanders,
            isGeneral: false
        ),

        ///=============Spacemarines - Ultramarines============
        DetachmentCodexLinkSeed(
            detachmentCode: 'blade_of_ultramar',
            codex: CodexTypeCode.ultramarines,
            isGeneral: false
        ),

        ///=============Spacemarines - White scars============
        DetachmentCodexLinkSeed(
            detachmentCode: 'spearpoint_task_force',
            codex: CodexTypeCode.whiteScars,
            isGeneral: false
        ),
    ];
}

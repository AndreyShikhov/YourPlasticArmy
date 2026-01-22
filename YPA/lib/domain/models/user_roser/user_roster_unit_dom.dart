
class UserRosterUnitDOM {
  final String instanceId;
  final String unitId;
  final Map<String, dynamic> wargearOptions;

  UserRosterUnitDOM({
    required this.instanceId,
    required this.unitId,
    required this.wargearOptions,
  });

  Map<String, dynamic> toMap() => {
    'instanceId': instanceId,
    'unitId': unitId,
    'wargearOptions': wargearOptions,
  };

  factory UserRosterUnitDOM.fromMap(Map<String, dynamic> map) => UserRosterUnitDOM(
    instanceId: map['instanceId'] ?? '',
    unitId: map['unitId'] ?? '',
    wargearOptions: map['wargearOptions'] ?? {},
  );
}

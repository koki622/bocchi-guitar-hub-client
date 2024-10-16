enum HiveBoxType implements Comparable<HiveBoxType> {
  songs(boxName: 'songs', typeId: 1),
  jobStatus(boxName: 'job_status', typeId: 2);

  const HiveBoxType({required this.boxName, required this.typeId});

  final String boxName;
  final int typeId;

  static int getTypeId() => songs.typeId;
  @override
  int compareTo(HiveBoxType other) => typeId.compareTo(other.typeId);
}

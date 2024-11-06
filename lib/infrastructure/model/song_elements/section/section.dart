import 'package:bocchi_guitar_hub_client/core/constant/reference/hive_box.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/section/section.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/analysis_result/structure/structure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'section.freezed.dart';
part 'section.g.dart';

@freezed
class SectionsData with _$SectionsData {
  @HiveType(typeId: HiveBoxConstant.sectionsBoxTypeId)
  const factory SectionsData({
    @HiveField(0) required List<SectionData> sections,
  }) = _SectionsData;

  // StructureResponseからSectionsDataに変換するメソッド
  factory SectionsData.fromStructureResponse(StructureResponse response) {
    return SectionsData(
      sections: response.segments.map((section) {
        return SectionData(
            section: section.label, start: section.start, end: section.end);
      }).toList(),
    );
  }
}

extension SectionsDataX on SectionsData {
  List<Section> toEntityList() {
    return sections
        .map((sectionData) => Section(
            section: sectionData.section,
            start: sectionData.start,
            end: sectionData.end))
        .toList();
  }
}

@HiveType(typeId: HiveBoxConstant.sectionTypeId)
class SectionData {
  @HiveField(0)
  String section;

  @HiveField(1)
  double start;

  @HiveField(2)
  double end;

  SectionData({required this.section, required this.start, required this.end});
}

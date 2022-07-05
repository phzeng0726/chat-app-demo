import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_dtos.freezed.dart';
part 'image_dtos.g.dart';

@freezed
class ImageListDto with _$ImageListDto {
  const ImageListDto._();
  const factory ImageListDto({
    required List<ImageDto> list,
  }) = _ImageListDto;

  factory ImageListDto.fromDomain(List<Map<String, dynamic>> imageList) {
    return ImageListDto(
        list: imageList.map((image) => ImageDto.fromDomain(image)).toList());
  }

  List<Map<String, dynamic>> toDomain() {
    return list.map((dto) => dto.toDomain()).toList();
  }

  factory ImageListDto.fromJson(Map<String, dynamic> json) =>
      _$ImageListDtoFromJson(json);

  factory ImageListDto.fromFirestore(QuerySnapshot snapshot) {
    final list = snapshot.docs.map((doc) => doc.data()).toList();
    return ImageListDto.fromJson({'list': list});
  }
}

@freezed
class ImageDto with _$ImageDto {
  const ImageDto._();
  const factory ImageDto({
    required String url,
    required String path,
    required String userId,
  }) = _ImageDto;

  factory ImageDto.fromDomain(Map<String, dynamic> image) {
    return ImageDto(
      url: image['url'] ?? '',
      path: image['path'] ?? '',
      userId: image['userId'] ?? '',
    );
  }

  Map<String, dynamic> toDomain() => <String, dynamic>{
        url: url,
        path: path,
        userId: userId,
      };

  factory ImageDto.fromJson(Map<String, dynamic> json) =>
      _$ImageDtoFromJson(json);

  factory ImageDto.fromFirestore(DocumentSnapshot doc) {
    return ImageDto.fromJson(doc.data()! as Map<String, dynamic>);
  }
}

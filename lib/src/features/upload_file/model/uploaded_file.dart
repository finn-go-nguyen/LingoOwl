import 'package:freezed_annotation/freezed_annotation.dart';

part 'uploaded_file.freezed.dart';

@freezed
class LUploadedFile with _$LUploadedFile {
  const factory LUploadedFile({
    required String uid,
    required String filePath,
    void Function()? whenUploadCompleted,
  }) = _LUploadedFile;
}

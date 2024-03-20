import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

Future<String> uploadImage() async {
  // Select a file from the device
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    withData: false,
    // Ensure to get file stream for better performance
    withReadStream: true,
    allowedExtensions: ['jpg', 'png', 'gif'],
  );

  if (result == null) {
    throw Exception('No file selected');
  }

  // Upload file with its filename as the key
  final platformFile = result.files.single;
  try {
    final uploadResult = await Amplify.Storage.uploadFile(
      localFile: AWSFile.fromStream(
        platformFile.readStream!,
        size: platformFile.size,
      ),
      key: platformFile.name,
      onProgress: (progress) {
        safePrint('Fraction completed: ${progress.fractionCompleted}');
      },
    ).result;
    safePrint('Successfully uploaded file: ${uploadResult.uploadedItem.key}');

    final getUrlResult =
        await Amplify.Storage.getUrl(key: uploadResult.uploadedItem.key).result;
    final s3Url = getUrlResult.url.toString(); // Convert Uri to String
    safePrint('File URL: $s3Url');

    return s3Url;
  } on StorageException catch (e) {
    safePrint('Error uploading file: $e');
    rethrow;
  }
}

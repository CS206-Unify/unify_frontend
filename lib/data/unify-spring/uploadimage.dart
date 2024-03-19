import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:aws_s3_client/aws_s3_client.dart';
import 'package:image_picker/image_picker.dart';

Future<void> uploadImage() async {
  // Use the ImagePicker to let the user select an image
  final picker = ImagePicker();
  final pickedFile = await picker.getImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    // Get the file from the image picker
    File file = File(pickedFile.path);

    // Create an S3 client (ensure you use secure ways to handle credentials)
    var s3client = S3Client(
      accessKey: "YOUR_ACCESS_KEY",
      secretKey: "YOUR_SECRET_KEY",
      region: "YOUR_AWS_REGION",
    );

    // Define the bucket and the file key
    String bucket = 'your-bucket-name';
    String fileKey = 'uploads/image.jpg';

    // Upload the file
    try {
      PutObjectResponse response = await s3client.putObject(
        bucket,
        fileKey,
        file,
        public:
            true, // if you want the file to be publicly accessible after upload
      );

      if (response.statusCode == 200) {
        print("Upload successful");
      } else {
        print("Upload failed with status code ${response.statusCode}");
      }
    } catch (e) {
      print("Upload failed with error: $e");
    }
  }
}

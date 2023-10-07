/*import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';*/

/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StoragePermissionExample(),
    );
  }
}

class StoragePermissionExample extends StatefulWidget {
  @override
  _StoragePermissionExampleState createState() =>
      _StoragePermissionExampleState();
}

class _StoragePermissionExampleState extends State<StoragePermissionExample> {
  @override
  void initState() {
    super.initState();
    requestStoragePermission();
  }

  Future<void> requestStoragePermission() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      // Permission granted. You can now access storage.
      // Perform the actions that require storage access.
    } else {
      // Permission denied.
      // You may want to show a message or disable functionality that requires storage access.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Storage Permission Example'),
      ),
      body: Center(
        child: Text('Requesting storage permission...'),
      ),
    );
  }
}*/

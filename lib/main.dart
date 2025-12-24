import 'package:flutter/material.dart';
import 'package:tray_manager/tray_manager.dart';
import 'dart:io'; // For Process commands

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  await initTray(); // Initialize tray after app starts
}

Future<void> initTray() async {
  await trayManager.setIcon(
    Platform.isWindows ? 'assets/icon.ico' : 'assets/icon.png',
  );
  Menu menu = Menu(
    items: [
      MenuItem(label: 'Scan Ports', onClick: (_) => scanAndUpdate()),
      // Call your scan function
      MenuItem(label: 'Kill All', onClick: (_) => killAllPorts()),
      MenuItem.separator(),
      MenuItem(label: 'Quit', onClick: (_) => exit(0)),
    ],
  );
  await trayManager.setContextMenu(menu);
  await trayManager.setToolTip('Port Killer');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Text('Running in background')), // Minimal window, hide it
    );
  }
}

// Your scan/kill functions from previous example
Future<void> scanAndUpdate() async {
  // Implement scanPorts() and update menu/state
}

Future<void> killAllPorts() async {
  // Implement killing logic
}
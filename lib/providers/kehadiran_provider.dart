import 'package:flutter/material.dart';
import 'package:kehadiran/models/siswa.dart';

class KehadiranProvider extends ChangeNotifier {
  List<Siswa> siswaList = [
    Siswa(name: 'Ali'),
    Siswa(name: 'Budi'),
    Siswa(name: 'Citra'),
  ];

  List<Map<String, dynamic>> riwayatKehadiran = [];

  void toggleAttendance(int index) {
    siswaList[index].Hadir = !siswaList[index].Hadir;
    notifyListeners();
  }

  void saveAttendance() {
    int presentCount = siswaList.where((siswa) => siswa.Hadir).length;
    int absentCount = siswaList.length - presentCount;

    riwayatKehadiran.insert(0, {
      'date': DateTime.now(),
      'present': presentCount,
      'absent': absentCount,
    });

    for (var siswa in siswaList) {
      siswa.Hadir = false;
    }

    notifyListeners();
  }
}

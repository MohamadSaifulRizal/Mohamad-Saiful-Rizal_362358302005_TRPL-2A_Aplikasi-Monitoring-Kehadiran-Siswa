import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kehadiran/providers/kehadiran_provider.dart';

class KehadiranScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Presensi Siswa')), 
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.siswaList.length,
              itemBuilder: (context, index) {
                final siswa = provider.siswaList[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  padding: EdgeInsets.symmetric(horizontal: 280.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(siswa.name, style: TextStyle(fontSize: 16)),
                      Checkbox(
                        value: siswa.Hadir,
                        onChanged: (_) => provider.toggleAttendance(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0, left: 515.0),
            child: ElevatedButton(
              onPressed: provider.siswaList.any((s) => s.Hadir)
              ? () {
            provider.saveAttendance();
            Navigator.pushNamed(context, '/profile');
          }
        : null,
              child: Text('Simpan'),
            ),
          ),
        ],
      ),
    );
  }
}

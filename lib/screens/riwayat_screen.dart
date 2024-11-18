import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kehadiran/providers/kehadiran_provider.dart';
import 'package:intl/intl.dart';

class RiwayatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Riwayat Kehadiran')),
      ),
      body: ListView.separated(
        itemCount: provider.riwayatKehadiran.length,
        separatorBuilder: (context, index) => Divider(thickness: 2),
        itemBuilder: (context, index) {
          final record = provider.riwayatKehadiran[index];
          final formattedDate =
              DateFormat('dd MMM yyyy').format(record['date']);
          return ListTile(
            title: Text(formattedDate),
            subtitle: Text(
              'Hadir: ${record['present']}, Tidak Hadir: ${record['absent']}',
            ),
          );
        },
      ),
    );
  }
}

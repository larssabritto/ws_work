import 'dart:async';

import 'package:http/http.dart' as http;

class SyncService {
  String baseUrl = 'https://www.wswork.com.br/cars/leads';

  Future<void> syncWithServer(Map<String, dynamic> leadsData) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        body: {'leads': leadsData},
      );
      if (response.statusCode == 200) {
        print('Leads enviados com sucesso!');
      } else {
        print('Falha ao enviar os leads: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao enviar os leads: $e');
    }
  }

  void startSyncPeriodically(Map<String, dynamic> leadsData) {
    Timer.periodic(const Duration(minutes: 15), (timer) async {
      await syncWithServer(leadsData);
    });
  }
}

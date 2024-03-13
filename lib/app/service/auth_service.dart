class AuthService {
  final List<Map<String, dynamic>> users = [
    {'cpf': '12345678900', 'senha': 'senha123', 'nome': 'Usuário 1'},
    {'cpf': '98765432100', 'senha': 'senha456', 'nome': 'Usuário 2'},
    // Adicione mais usuários conforme necessário
  ];

  List<String> authorizedUsers = [
    'Usuário 1',
    'usuario 2',
  ];

  bool isUserInList(String user) {
    return authorizedUsers.contains(user);
  }

  Future<Map<String, dynamic>?> authenticate(String cpf, String senha) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      final user = users.firstWhere(
        (user) => user['cpf'] == cpf && user['senha'] == senha,
      );

      // Verifica se o usuário está na lista de usuários autorizados
      if (!isUserInList(user['nome'])) {
        throw Exception('Usuário não autorizado');
      }

      return user;
    } catch (e) {
      // Se não encontrar o usuário, retorne null
      return null;
    }
  }
}

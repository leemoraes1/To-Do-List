// Importa a biblioteca de entrada/saída para permitir a interação com o usuário
import 'dart:io';

void main() {
  // Cria uma lista de tarefas inicialmente vazia
  List<String> tarefas = [];

  while (true) {
    // Exibe o menu para o usuário
    print('--- Lista de Tarefas ---');
    print('1. Adicionar tarefa');
    print('2. Listar tarefas');
    print('3. Remover tarefa');
    print('4. Sair');
    print('Escolha uma opção:');

    // Lê a opção escolhida pelo usuário
    String? opcao = stdin.readLineSync();

    // Verifica qual opção o usuário escolheu e executa a ação correspondente
    switch (opcao) {
      case '1':
        // Adiciona uma nova tarefa
        print('Digite a nova tarefa:');
        String? tarefa = stdin.readLineSync();
        if (tarefa != null && tarefa.isNotEmpty) {
          tarefas.add(tarefa);
          print('Tarefa adicionada com sucesso!');
        } else {
          print('Tarefa não pode ser vazia.');
        }
        break;

      case '2':
        // Lista todas as tarefas
        if (tarefas.isEmpty) {
          print('Nenhuma tarefa para mostrar.');
        } else {
          print('--- Suas Tarefas ---');
          for (int i = 0; i < tarefas.length; i++) {
            print('${i + 1}. ${tarefas[i]}');
          }
        }
        break;

      case '3':
        // Remove uma tarefa
        print('Digite o número da tarefa para remover:');
        String? numeroStr = stdin.readLineSync();
        if (numeroStr != null) {
          int numero = int.tryParse(numeroStr) ?? 0;
          if (numero > 0 && numero <= tarefas.length) {
            tarefas.removeAt(numero - 1);
            print('Tarefa removida com sucesso!');
          } else {
            print('Número inválido.');
          }
        }
        break;

      case '4':
        // Sai do programa
        print('Saindo...');
        return;

      default:
        print('Opção inválida. Tente novamente.');
    }
  }
}

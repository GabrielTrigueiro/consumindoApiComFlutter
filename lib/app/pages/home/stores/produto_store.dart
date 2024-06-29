import 'package:flutter/material.dart';
import 'package:flutter_rest/app/data/http/exceptions.dart';
import 'package:flutter_rest/app/data/models/produto_model.dart';
import 'package:flutter_rest/app/data/repositories/produto_repository.dart';

class ProdutoStore {
  // ! criar um repository do produto
  final IProdutoReposity repository;

  ProdutoStore({required this.repository});

  // var relativa ao loading
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  // var relativa ao state
  final ValueNotifier<List<ProdutoModel>> state =
      ValueNotifier<List<ProdutoModel>>([]);

  // var relativa ao erro
  final ValueNotifier<String> error = ValueNotifier('');

  Future getProdutos() async {
    isLoading.value = true;

    try {
      final result = await repository.getProdutos();
      state.value = result;
    } on NotFoundException catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    }
    
    isLoading.value = false;
  }
}

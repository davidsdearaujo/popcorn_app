import 'package:mobx/mobx.dart';
import 'package:popcorn_app_mobx/app/shared/repositories/popcorn_repository.dart';

part 'popular_controller.g.dart';

class PopularController = _PopularBase with _$PopularController;

abstract class _PopularBase with Store {
  final PopcornRepository _repository;

  _PopularBase(this._repository);

  @action
  Future<void> find(CategoryEnum category) async {
    // var lista = await _repository.getList(category: category);
    // moviesList = lista;
    _repository
        .getList2(category: category)
        .listen((list) => moviesList = list);
  }

  @observable
  List<MovieModel> moviesList;
}

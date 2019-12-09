// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PopularController on _PopularBase, Store {
  final _$moviesListAtom = Atom(name: '_PopularBase.moviesList');

  @override
  List<MovieModel> get moviesList {
    _$moviesListAtom.context.enforceReadPolicy(_$moviesListAtom);
    _$moviesListAtom.reportObserved();
    return super.moviesList;
  }

  @override
  set moviesList(List<MovieModel> value) {
    _$moviesListAtom.context.conditionallyRunInAction(() {
      super.moviesList = value;
      _$moviesListAtom.reportChanged();
    }, _$moviesListAtom, name: '${_$moviesListAtom.name}_set');
  }

  final _$findAsyncAction = AsyncAction('find');

  @override
  Future<void> find(CategoryEnum category) {
    return _$findAsyncAction.run(() => super.find(category));
  }
}

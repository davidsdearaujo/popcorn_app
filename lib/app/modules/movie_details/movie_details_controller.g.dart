// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieDetailsController on _MovieDetailsBase, Store {
  Computed<List<SeasonModel>> _$seasonsComputed;

  @override
  List<SeasonModel> get seasons =>
      (_$seasonsComputed ??= Computed<List<SeasonModel>>(() => super.seasons))
          .value;
  Computed<List<Episode>> _$episodesComputed;

  @override
  List<Episode> get episodes =>
      (_$episodesComputed ??= Computed<List<Episode>>(() => super.episodes))
          .value;

  final _$detailsAtom = Atom(name: '_MovieDetailsBase.details');

  @override
  MovieDetailsModel get details {
    _$detailsAtom.context.enforceReadPolicy(_$detailsAtom);
    _$detailsAtom.reportObserved();
    return super.details;
  }

  @override
  set details(MovieDetailsModel value) {
    _$detailsAtom.context.conditionallyRunInAction(() {
      super.details = value;
      _$detailsAtom.reportChanged();
    }, _$detailsAtom, name: '${_$detailsAtom.name}_set');
  }

  final _$selectedSeasonAtom = Atom(name: '_MovieDetailsBase.selectedSeason');

  @override
  SeasonModel get selectedSeason {
    _$selectedSeasonAtom.context.enforceReadPolicy(_$selectedSeasonAtom);
    _$selectedSeasonAtom.reportObserved();
    return super.selectedSeason;
  }

  @override
  set selectedSeason(SeasonModel value) {
    _$selectedSeasonAtom.context.conditionallyRunInAction(() {
      super.selectedSeason = value;
      _$selectedSeasonAtom.reportChanged();
    }, _$selectedSeasonAtom, name: '${_$selectedSeasonAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_MovieDetailsBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$getMovieDetailsAsyncAction = AsyncAction('getMovieDetails');

  @override
  Future<void> getMovieDetails() {
    return _$getMovieDetailsAsyncAction.run(() => super.getMovieDetails());
  }

  final _$_MovieDetailsBaseActionController =
      ActionController(name: '_MovieDetailsBase');

  @override
  void setSeason(SeasonModel model) {
    final _$actionInfo = _$_MovieDetailsBaseActionController.startAction();
    try {
      return super.setSeason(model);
    } finally {
      _$_MovieDetailsBaseActionController.endAction(_$actionInfo);
    }
  }
}

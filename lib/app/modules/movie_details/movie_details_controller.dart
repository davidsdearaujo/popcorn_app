import 'package:mobx/mobx.dart';
import 'package:popcorn_app_mobx/app/shared/models/movie_details_model.dart';
import 'package:popcorn_app_mobx/app/shared/models/temporada_model.dart';
import 'package:popcorn_app_mobx/app/shared/repositories/popcorn_repository.dart';

part 'movie_details_controller.g.dart';

class MovieDetailsController = _MovieDetailsBase with _$MovieDetailsController;

abstract class _MovieDetailsBase with Store {
  final MovieModel model;

  final PopcornRepository _repository;
  _MovieDetailsBase(this._repository, this.model) {
    getMovieDetails();
    reaction((_) => this.seasons, (seasons) => selectedSeason = seasons?.first);
  }

  @observable
  MovieDetailsModel details;

  @observable
  SeasonModel selectedSeason;

  @observable
  bool isLoading = true;

  @action
  void setSeason(SeasonModel model) => selectedSeason = model;

  @computed
  List<SeasonModel> get seasons =>
      details.episodes
        .map((ep) => SeasonModel(ep.season))
        .toSet()
        .toList()
        ..sort((x, y) => x.season.compareTo(y.season));

  @computed
  List<Episode> get episodes => details.episodes
      .where((ep) => ep.season == selectedSeason?.season)
      .toList()
      ..sort((x, y) => x.episode.compareTo(y.episode));

  @action
  Future<void> getMovieDetails() async {
    var data = await _repository.getDetails(
      id: model.imdbId,
      category: model.category,
    );
    details = data;
  }
}

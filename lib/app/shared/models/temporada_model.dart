class SeasonModel{
  int season;

  SeasonModel(this.season);

  @override
  String toString() => "Temporada $season";

  operator ==(o) => o is SeasonModel && o.season == season;

  @override
  int get hashCode => season.hashCode;
}
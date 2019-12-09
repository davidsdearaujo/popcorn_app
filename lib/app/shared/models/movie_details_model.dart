// To parse this JSON data, do
//
//     final serieDetailsModel = serieDetailsModelFromJson(jsonString);

import 'dart:convert';

MovieDetailsModel serieDetailsModelFromJson(String str) => MovieDetailsModel.fromJson(json.decode(str));

String serieDetailsModelToJson(MovieDetailsModel data) => json.encode(data.toJson());

class MovieDetailsModel {
    String id;
    String imdbId;
    String tvdbId;
    String title;
    String year;
    String slug;
    String synopsis;
    String runtime;
    String country;
    String network;
    String airDay;
    String airTime;
    String status;
    int numSeasons;
    int lastUpdated;
    int v;
    List<Episode> episodes;
    List<String> genres;
    Images images;
    Rating rating;

    MovieDetailsModel({
        this.id,
        this.imdbId,
        this.tvdbId,
        this.title,
        this.year,
        this.slug,
        this.synopsis,
        this.runtime,
        this.country,
        this.network,
        this.airDay,
        this.airTime,
        this.status,
        this.numSeasons,
        this.lastUpdated,
        this.v,
        this.episodes,
        this.genres,
        this.images,
        this.rating,
    });

    factory MovieDetailsModel.fromJson(Map<String, dynamic> json) => new MovieDetailsModel(
        id: json["_id"] == null ? null : json["_id"],
        imdbId: json["imdb_id"] == null ? null : json["imdb_id"],
        tvdbId: json["tvdb_id"] == null ? null : json["tvdb_id"],
        title: json["title"] == null ? null : json["title"],
        year: json["year"] == null ? null : json["year"],
        slug: json["slug"] == null ? null : json["slug"],
        synopsis: json["synopsis"] == null ? null : json["synopsis"],
        runtime: json["runtime"] == null ? null : json["runtime"],
        country: json["country"] == null ? null : json["country"],
        network: json["network"] == null ? null : json["network"],
        airDay: json["air_day"] == null ? null : json["air_day"],
        airTime: json["air_time"] == null ? null : json["air_time"],
        status: json["status"] == null ? null : json["status"],
        numSeasons: json["num_seasons"] == null ? null : json["num_seasons"],
        lastUpdated: json["last_updated"] == null ? null : json["last_updated"],
        v: json["__v"] == null ? null : json["__v"],
        episodes: json["episodes"] == null ? null : new List<Episode>.from(json["episodes"].map((x) => Episode.fromJson(x))),
        genres: json["genres"] == null ? null : new List<String>.from(json["genres"].map((x) => x)),
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "imdb_id": imdbId == null ? null : imdbId,
        "tvdb_id": tvdbId == null ? null : tvdbId,
        "title": title == null ? null : title,
        "year": year == null ? null : year,
        "slug": slug == null ? null : slug,
        "synopsis": synopsis == null ? null : synopsis,
        "runtime": runtime == null ? null : runtime,
        "country": country == null ? null : country,
        "network": network == null ? null : network,
        "air_day": airDay == null ? null : airDay,
        "air_time": airTime == null ? null : airTime,
        "status": status == null ? null : status,
        "num_seasons": numSeasons == null ? null : numSeasons,
        "last_updated": lastUpdated == null ? null : lastUpdated,
        "__v": v == null ? null : v,
        "episodes": episodes == null ? null : new List<dynamic>.from(episodes.map((x) => x.toJson())),
        "genres": genres == null ? null : new List<dynamic>.from(genres.map((x) => x)),
        "images": images == null ? null : images.toJson(),
        "rating": rating == null ? null : rating.toJson(),
    };
}

class Episode {
    Map<String, Torrent> torrents;
    Watched watched;
    int firstAired;
    bool dateBased;
    String overview;
    String title;
    int episode;
    int season;
    int tvdbId;

    Episode({
        this.torrents,
        this.watched,
        this.firstAired,
        this.dateBased,
        this.overview,
        this.title,
        this.episode,
        this.season,
        this.tvdbId,
    });

    factory Episode.fromJson(Map<String, dynamic> json) => new Episode(
        torrents: json["torrents"] == null ? null : new Map.from(json["torrents"]).map((k, v) => new MapEntry<String, Torrent>(k, Torrent.fromJson(v))),
        watched: json["watched"] == null ? null : Watched.fromJson(json["watched"]),
        firstAired: json["first_aired"] == null ? null : json["first_aired"],
        dateBased: json["date_based"] == null ? null : json["date_based"],
        overview: json["overview"] == null ? null : json["overview"],
        title: json["title"] == null ? null : json["title"],
        episode: json["episode"] == null ? null : json["episode"],
        season: json["season"] == null ? null : json["season"],
        tvdbId: json["tvdb_id"] == null ? null : json["tvdb_id"],
    );

    Map<String, dynamic> toJson() => {
        "torrents": torrents == null ? null : new Map.from(torrents).map((k, v) => new MapEntry<String, dynamic>(k, v.toJson())),
        "watched": watched == null ? null : watched.toJson(),
        "first_aired": firstAired == null ? null : firstAired,
        "date_based": dateBased == null ? null : dateBased,
        "overview": overview == null ? null : overview,
        "title": title == null ? null : title,
        "episode": episode == null ? null : episode,
        "season": season == null ? null : season,
        "tvdb_id": tvdbId == null ? null : tvdbId,
    };
}

class Torrent {
    String url;
    int seeds;
    int peers;
    Provider provider;

    Torrent({
        this.url,
        this.seeds,
        this.peers,
        this.provider,
    });

    factory Torrent.fromJson(Map<String, dynamic> json) => new Torrent(
        url: json["url"] == null ? null : json["url"],
        seeds: json["seeds"] == null ? null : json["seeds"],
        peers: json["peers"] == null ? null : json["peers"],
        provider: json["provider"] == null ? null : providerValues.map[json["provider"]],
    );

    Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "seeds": seeds == null ? null : seeds,
        "peers": peers == null ? null : peers,
        "provider": provider == null ? null : providerValues.reverse[provider],
    };
}

enum Provider { ETTV_2_HD, ETTV_EVOLVE, EZTV, ETTV_ASAP, ETTV_KILLERS, ETTV_BATV, ETTV_FUM, THE_1080_P, YOUTUBE }

final providerValues = new EnumValues({
    "ETTV 2HD": Provider.ETTV_2_HD,
    "ETTV ASAP": Provider.ETTV_ASAP,
    "ETTV BATV": Provider.ETTV_BATV,
    "ETTV EVOLVE": Provider.ETTV_EVOLVE,
    "ETTV FUM": Provider.ETTV_FUM,
    "ETTV KILLERS": Provider.ETTV_KILLERS,
    "EZTV": Provider.EZTV,
    "1080p": Provider.THE_1080_P,
    "Youtube": Provider.YOUTUBE,
});

class Watched {
    bool watched;

    Watched({
        this.watched,
    });

    factory Watched.fromJson(Map<String, dynamic> json) => new Watched(
        watched: json["watched"] == null ? null : json["watched"],
    );

    Map<String, dynamic> toJson() => {
        "watched": watched == null ? null : watched,
    };
}

class Images {
    String poster;
    String fanart;
    String banner;

    Images({
        this.poster,
        this.fanart,
        this.banner,
    });

    factory Images.fromJson(Map<String, dynamic> json) => new Images(
        poster: json["poster"] == null ? null : json["poster"],
        fanart: json["fanart"] == null ? null : json["fanart"],
        banner: json["banner"] == null ? null : json["banner"],
    );

    Map<String, dynamic> toJson() => {
        "poster": poster == null ? null : poster,
        "fanart": fanart == null ? null : fanart,
        "banner": banner == null ? null : banner,
    };
}

class Rating {
    int percentage;
    int watching;
    int votes;
    int loved;
    int hated;

    Rating({
        this.percentage,
        this.watching,
        this.votes,
        this.loved,
        this.hated,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => new Rating(
        percentage: json["percentage"] == null ? null : json["percentage"],
        watching: json["watching"] == null ? null : json["watching"],
        votes: json["votes"] == null ? null : json["votes"],
        loved: json["loved"] == null ? null : json["loved"],
        hated: json["hated"] == null ? null : json["hated"],
    );

    Map<String, dynamic> toJson() => {
        "percentage": percentage == null ? null : percentage,
        "watching": watching == null ? null : watching,
        "votes": votes == null ? null : votes,
        "loved": loved == null ? null : loved,
        "hated": hated == null ? null : hated,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

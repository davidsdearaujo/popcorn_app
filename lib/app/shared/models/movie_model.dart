// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

import 'dart:convert';

import '../models/category_enum.dart';

List<MovieModel> movieModelFromJson(String str) => new List<MovieModel>.from(json.decode(str).map((x) => MovieModel.fromJson(x)));

String movieModelToJson(List<MovieModel> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class MovieModel {
    String id;
    String imdbId;
    String title;
    String year;
    String synopsis;
    String runtime;
    double released;
    String trailer;
    Certification certification;
    Torrents torrents;
    List<String> genres;
    Images images;
    Rating rating;
    int numSeasons;
    CategoryEnum category;

    MovieModel({
        this.id,
        this.imdbId,
        this.title,
        this.year,
        this.synopsis,
        this.runtime,
        this.released,
        this.trailer,
        this.certification,
        this.torrents,
        this.genres,
        this.images,
        this.rating,
        this.numSeasons,
        this.category,
    });

    factory MovieModel.fromJson(Map<String, dynamic> json) => new MovieModel(
        id: json["_id"] == null ? null : json["_id"],
        imdbId: json["imdb_id"] == null ? null : json["imdb_id"],
        title: json["title"] == null ? null : json["title"],
        year: json["year"] == null ? null : json["year"],
        synopsis: json["synopsis"] == null ? null : json["synopsis"],
        runtime: json["runtime"] == null ? null : json["runtime"],
        released: json["released"] == null ? null : double.parse(json["released"].toString()),
        trailer: json["trailer"] == null ? null : json["trailer"],
        certification: json["certification"] == null ? null : certificationValues.map[json["certification"]],
        torrents: json["torrents"] == null ? null : Torrents.fromJson(json["torrents"]),
        genres: json["genres"] == null ? null : new List<String>.from(json["genres"].map((x) => x)),
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        numSeasons: json["num_seasons"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "imdb_id": imdbId == null ? null : imdbId,
        "title": title == null ? null : title,
        "year": year == null ? null : year,
        "synopsis": synopsis == null ? null : synopsis,
        "runtime": runtime == null ? null : runtime,
        "released": released == null ? null : released,
        "trailer": trailer == null ? null : trailer,
        "certification": certification == null ? null : certificationValues.reverse[certification],
        "torrents": torrents == null ? null : torrents.toJson(),
        "genres": genres == null ? null : new List<dynamic>.from(genres.map((x) => x)),
        "images": images == null ? null : images.toJson(),
        "rating": rating == null ? null : rating.toJson(),
    };
}

enum Certification { R, PG_13, PG, G }

final certificationValues = new EnumValues({
    "G": Certification.G,
    "PG": Certification.PG,
    "PG-13": Certification.PG_13,
    "R": Certification.R
});

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

class Torrents {
    Map<String, En> en;

    Torrents({
        this.en,
    });

    factory Torrents.fromJson(Map<String, dynamic> json) => new Torrents(
        en: json["en"] == null ? null : new Map.from(json["en"]).map((k, v) => new MapEntry<String, En>(k, En.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "en": en == null ? null : new Map.from(en).map((k, v) => new MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class En {
    String url;
    int seed;
    int peer;
    int size;
    String filesize;
    Provider provider;

    En({
        this.url,
        this.seed,
        this.peer,
        this.size,
        this.filesize,
        this.provider,
    });

    factory En.fromJson(Map<String, dynamic> json) => new En(
        url: json["url"] == null ? null : json["url"],
        seed: json["seed"] == null ? null : json["seed"],
        peer: json["peer"] == null ? null : json["peer"],
        size: json["size"] == null ? null : json["size"],
        filesize: json["filesize"] == null ? null : json["filesize"],
        provider: json["provider"] == null ? null : providerValues.map[json["provider"]],
    );

    Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "seed": seed == null ? null : seed,
        "peer": peer == null ? null : peer,
        "size": size == null ? null : size,
        "filesize": filesize == null ? null : filesize,
        "provider": provider == null ? null : providerValues.reverse[provider],
    };
}

enum Provider { YTS, YIFY }

final providerValues = new EnumValues({
    "YIFY": Provider.YIFY,
    "YTS": Provider.YTS
});

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

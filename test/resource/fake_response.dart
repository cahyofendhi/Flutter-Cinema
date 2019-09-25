const fakeResponseMovieList = """{
  "page": 1,
  "total_results": 10000,
  "total_pages": 500,
  "results": [
    {
      "popularity": 352.048,
      "id": 429617,
      "video": false,
      "vote_count": 3791,
      "vote_average": 7.7,
      "title": "Spider-Man: Far from Home",
      "release_date": "2019-06-28",
      "original_language": "en",
      "original_title": "Spider-Man: Far from Home",
      "genre_ids": [28, 12, 878],
      "backdrop_path": "/6ihyJWRLEngSnlW8HKeDOH3AfSQ.jpg",
      "adult": false,
      "overview":
          "Peter Parker dan teman-temannya melakukan perjalanan musim panas ke Eropa. Namun, mereka hampir tidak dapat beristirahat - Peter harus setuju untuk membantu Nick Fury mengungkap misteri makhluk yang menyebabkan bencana alam dan kehancuran di seluruh benua.",
      "poster_path": "/rjbNpRMoVvqHmhmksbokcyCr7wn.jpg"
    }
  ]
}""";

const fakeResponseMovieDetail = """{
    "adult": false,
    "backdrop_path": "/6X2YjjYcs8XyZRDmJAHNDlls7L4.jpg",
    "belongs_to_collection": null,
    "budget": 0,
    "genres": [
        {
            "id": 35,
            "name": "Comedy"
        },
        {
            "id": 80,
            "name": "Crime"
        },
        {
            "id": 18,
            "name": "Drama"
        }
    ],
    "homepage": "http://www.foxsearchlight.com/theoldmanandthegun",
    "id": 429203,
    "imdb_id": "tt2837574",
    "original_language": "en",
    "original_title": "The Old Man & the Gun",
    "overview": "The true story of Forrest Tucker, from his audacious escape from San Quentin at the age of 70 to an unprecedented string of heists that confounded authorities and enchanted the public. Wrapped up in the pursuit are a detective, who becomes captivated with Forrest’s commitment to his craft, and a woman, who loves him in spite of his chosen profession.",
    "popularity": 325.687,
    "poster_path": "/a4BfxRK8dBgbQqbRxPs8kmLd8LG.jpg",
    "production_companies": [
        {
            "id": 51513,
            "logo_path": "/eWhUrhDH1DapiMCnK7I9f5HPDjd.png",
            "name": "Condé Nast Entertainment",
            "origin_country": "US"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
    ],
    "release_date": "2018-09-27",
    "revenue": 11277120,
    "runtime": 93,
    "spoken_languages": [
        {
            "iso_639_1": "en",
            "name": "English"
        }
    ],
    "status": "Released",
    "tagline": "This story is mostly true.",
    "title": "The Old Man & the Gun",
    "video": false,
    "vote_average": 6.3,
    "vote_count": 532
}""";

const fakeResponseMovieSimilar = """{
    "page": 1,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/tcheoA2nPATCm2vvXw2hVQoaEFD.jpg",
            "genre_ids": [
                27,
                53
            ],
            "id": 346364,
            "original_language": "en",
            "original_title": "It",
            "overview": "In a small town in Maine, seven children known as The Losers Club come face to face with life problems, bullies and a monster that takes the shape of a clown called Pennywise.",
            "poster_path": "/9E2y5Q7WlCVNEhP5GiVTjhEhx1o.jpg",
            "release_date": "2017-09-06",
            "title": "It",
            "video": false,
            "vote_average": 7.2,
            "vote_count": 11824,
            "popularity": 27.893
        }
    ],
    "total_pages": 407,
    "total_results": 8125
}""";

const fakeResponseMovieCredit = """{
    "id": 474350,
    "cast": [
        {
            "cast_id": 24,
            "character": "Bill Denbrough",
            "credit_id": "5acfcb829251417b72001543",
            "gender": 2,
            "id": 5530,
            "name": "James McAvoy",
            "order": 0,
            "profile_path": "/oPIfGm3mf4lbmO5pWwMvfTt5BM1.jpg"
        }
    ],
    "crew": [
        {
            "credit_id": "59e2c83ac3a36846dd004c65",
            "department": "Directing",
            "gender": 2,
            "id": 1113116,
            "job": "Director",
            "name": "Andy Muschietti",
            "profile_path": "/vWiAwINWnwr3sZWdLJ7pt6LrUkb.jpg"
        }
    ]
}""";

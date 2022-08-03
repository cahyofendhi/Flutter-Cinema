class MediaCredit {
  int? id;
  List<Cast>? cast;
  List<Crew>? crew;

  MediaCredit({this.id, this.cast, this.crew});

  factory MediaCredit.fromJson(Map<String, dynamic> json) => MediaCredit(
        id: json['id'],
        cast: json['cast'] != null
            ? List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x)))
            : [],
        crew: json['crew'] != null
            ? List<Crew>.from(json["crew"].map((x) => Crew.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'cast': this.cast != null
            ? this.cast!.map((v) => v.toJson()).toList()
            : null,
        'crew': this.crew != null
            ? this.crew!.map((v) => v.toJson()).toList()
            : null,
      };
}

class Cast {
  int? castId;
  String? character;
  String? creditId;
  int? gender;
  int? id;
  String? name;
  int? order;
  String? profilePath;

  Cast(
      {this.castId,
      this.character,
      this.creditId,
      this.gender,
      this.id,
      this.name,
      this.order,
      this.profilePath});

  Cast.fromJson(Map<String, dynamic> json) {
    castId = json['cast_id'] ?? 0;
    character = json['character'] ?? '';
    creditId = json['credit_id'] ?? 0;
    gender = json['gender'] ?? 1;
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    order = json['order'] ?? 0;
    profilePath = json['profile_path'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cast_id'] = this.castId;
    data['character'] = this.character;
    data['credit_id'] = this.creditId;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['name'] = this.name;
    data['order'] = this.order;
    data['profile_path'] = this.profilePath;
    return data;
  }
}

class Crew {
  String? creditId;
  String? department;
  int? gender;
  int? id;
  String? job;
  String? name;
  String? profilePath;

  Crew(
      {this.creditId,
      this.department,
      this.gender,
      this.id,
      this.job,
      this.name,
      this.profilePath});

  Crew.fromJson(Map<String, dynamic> json) {
    creditId = json['credit_id'];
    department = json['department'];
    gender = json['gender'];
    id = json['id'];
    job = json['job'];
    name = json['name'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['credit_id'] = this.creditId;
    data['department'] = this.department;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['job'] = this.job;
    data['name'] = this.name;
    data['profile_path'] = this.profilePath;
    return data;
  }
}

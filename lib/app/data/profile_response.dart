class ProfileResponse {
  bool? success;
  String? message;
  List<Profiles>? profiles;

  ProfileResponse({this.success, this.message, this.profiles});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['profiles'] != null) {
      profiles = <Profiles>[];
      json['profiles'].forEach((v) {
        profiles!.add(new Profiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.profiles != null) {
      data['profiles'] = this.profiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profiles {
  int? id;
  String? name;
  String? address;
  String? noHp;
  Null? fotoprofile;
  String? email;
  String? emailVerifiedAt;
  int? isAdmin;
  String? createdAt;
  String? updatedAt;

  Profiles(
      {this.id,
      this.name,
      this.address,
      this.noHp,
      this.fotoprofile,
      this.email,
      this.emailVerifiedAt,
      this.isAdmin,
      this.createdAt,
      this.updatedAt});

  Profiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    noHp = json['no_hp'];
    fotoprofile = json['fotoprofile'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    isAdmin = json['isAdmin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['no_hp'] = this.noHp;
    data['fotoprofile'] = this.fotoprofile;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['isAdmin'] = this.isAdmin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

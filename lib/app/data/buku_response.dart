class BukuResponse {
  bool? success;
  String? message;
  List<Bukus>? bukus;

  BukuResponse({this.success, this.message, this.bukus});

  BukuResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['bukus'] != null) {
      bukus = <Bukus>[];
      json['bukus'].forEach((v) {
        bukus!.add(new Bukus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.bukus != null) {
      data['bukus'] = this.bukus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bukus {
  int? id;
  String? judul;
  int? jumlah;
  int? idPenulis;
  int? idPenerbit;
  int? idKategori;
  String? tahunTerbit;
  String? harga;
  String? foto;
  String? sinopsis;
  String? createdAt;
  String? updatedAt;
  Penulis? penulis;
  Penerbit? penerbit;
  Kategori? kategori;

  Bukus(
      {this.id,
      this.judul,
      this.jumlah,
      this.idPenulis,
      this.idPenerbit,
      this.idKategori,
      this.tahunTerbit,
      this.harga,
      this.foto,
      this.sinopsis,
      this.createdAt,
      this.updatedAt,
      this.penulis,
      this.penerbit,
      this.kategori});

  Bukus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    jumlah = json['jumlah'];
    idPenulis = json['id_penulis'];
    idPenerbit = json['id_penerbit'];
    idKategori = json['id_kategori'];
    tahunTerbit = json['tahun_terbit'];
    harga = json['harga'];
    foto = json['foto'];
    sinopsis = json['sinopsis'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    penulis =
        json['penulis'] != null ? new Penulis.fromJson(json['penulis']) : null;
    penerbit = json['penerbit'] != null
        ? new Penerbit.fromJson(json['penerbit'])
        : null;
    kategori = json['kategori'] != null
        ? new Kategori.fromJson(json['kategori'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['judul'] = this.judul;
    data['jumlah'] = this.jumlah;
    data['id_penulis'] = this.idPenulis;
    data['id_penerbit'] = this.idPenerbit;
    data['id_kategori'] = this.idKategori;
    data['tahun_terbit'] = this.tahunTerbit;
    data['harga'] = this.harga;
    data['foto'] = this.foto;
    data['sinopsis'] = this.sinopsis;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.penulis != null) {
      data['penulis'] = this.penulis!.toJson();
    }
    if (this.penerbit != null) {
      data['penerbit'] = this.penerbit!.toJson();
    }
    if (this.kategori != null) {
      data['kategori'] = this.kategori!.toJson();
    }
    return data;
  }
}

class Penulis {
  int? id;
  String? namaPenulis;
  String? createdAt;
  String? updatedAt;

  Penulis({this.id, this.namaPenulis, this.createdAt, this.updatedAt});

  Penulis.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaPenulis = json['nama_penulis'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_penulis'] = this.namaPenulis;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Penerbit {
  int? id;
  String? namaPenerbit;
  String? alamat;
  String? createdAt;
  String? updatedAt;

  Penerbit(
      {this.id,
      this.namaPenerbit,
      this.alamat,
      this.createdAt,
      this.updatedAt});

  Penerbit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaPenerbit = json['nama_penerbit'];
    alamat = json['alamat'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_penerbit'] = this.namaPenerbit;
    data['alamat'] = this.alamat;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Kategori {
  int? id;
  String? namaKategori;
  String? createdAt;
  String? updatedAt;

  Kategori({this.id, this.namaKategori, this.createdAt, this.updatedAt});

  Kategori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKategori = json['nama_kategori'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_kategori'] = this.namaKategori;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

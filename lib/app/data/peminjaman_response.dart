class PeminjamanResponse {
  bool? success;
  List<Peminjamans>? peminjamans;

  PeminjamanResponse({this.success, this.peminjamans});

  PeminjamanResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['peminjamans'] != null) {
      peminjamans = <Peminjamans>[];
      json['peminjamans'].forEach((v) {
        peminjamans!.add(Peminjamans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = this.success;
    if (this.peminjamans != null) {
      data['peminjamans'] = this.peminjamans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Peminjamans {
  int? id;
  String? nomorPeminjaman;
  int? idUser;
  int? idBuku;
  String? jumlah;
  String? tanggalPinjam;
  String? batasPinjam;
  String? tanggalKembali;
  String? status;
  Buku? buku;
  User? user;

  Peminjamans({
    this.id,
    this.nomorPeminjaman,
    this.idUser,
    this.idBuku,
    this.jumlah,
    this.tanggalPinjam,
    this.batasPinjam,
    this.tanggalKembali,
    this.status,
    this.buku,
    this.user,
  });

  Peminjamans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomorPeminjaman = json['nomor_peminjaman'];
    idUser = json['id_user'];
    idBuku = json['id_buku'];
    jumlah = json['jumlah'];
    tanggalPinjam = json['tanggal_pinjam'];
    batasPinjam = json['batas_pinjam'];
    tanggalKembali = json['tanggal_kembali'];
    status = json['status'];
    buku = json['buku'] != null ? Buku.fromJson(json['buku']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['nomor_peminjaman'] = this.nomorPeminjaman;
    data['id_user'] = this.idUser;
    data['id_buku'] = this.idBuku;
    data['jumlah'] = this.jumlah;
    data['tanggal_pinjam'] = this.tanggalPinjam;
    data['batas_pinjam'] = this.batasPinjam;
    data['tanggal_kembali'] = this.tanggalKembali;
    data['status'] = this.status;
    if (this.buku != null) {
      data['buku'] = this.buku!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Buku {
  int? id;
  String? judul;
  String? foto;

  Buku({
    this.id,
    this.judul,
    this.foto,
  });

  Buku.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['judul'] = this.judul;
    data['foto'] = this.foto;
    return data;
  }
}

class User {
  int? id;
  String? name;

  User({
    this.id,
    this.name,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

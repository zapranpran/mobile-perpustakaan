class PeminjamanResponse {
  bool? success;
  String? message;
  List<Peminjamans>? peminjamans;

  PeminjamanResponse({this.success, this.message, this.peminjamans});

  PeminjamanResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['peminjamans'] != null) {
      peminjamans = <Peminjamans>[];
      json['peminjamans'].forEach((v) {
        peminjamans!.add(new Peminjamans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.peminjamans != null) {
      data['peminjamans'] = this.peminjamans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Peminjamans {
  int? id;
  String? nomorPeminjaman;
  String? namaPeminjam;
  int? idBuku;
  String? jumlah;
  String? tanggalPinjam;
  String? batasPinjam;
  String? tanggalKembali;
  String? status;
  String? createdAt;
  String? updatedAt;
  Buku? buku;

  Peminjamans(
      {this.id,
      this.nomorPeminjaman,
      this.namaPeminjam,
      this.idBuku,
      this.jumlah,
      this.tanggalPinjam,
      this.batasPinjam,
      this.tanggalKembali,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.buku});

  Peminjamans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomorPeminjaman = json['nomor_peminjaman'];
    namaPeminjam = json['nama_peminjam'];
    idBuku = json['id_buku'];
    jumlah = json['jumlah'];
    tanggalPinjam = json['tanggal_pinjam'];
    batasPinjam = json['batas_pinjam'];
    tanggalKembali = json['tanggal_kembali'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    buku = json['buku'] != null ? new Buku.fromJson(json['buku']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomor_peminjaman'] = this.nomorPeminjaman;
    data['nama_peminjam'] = this.namaPeminjam;
    data['id_buku'] = this.idBuku;
    data['jumlah'] = this.jumlah;
    data['tanggal_pinjam'] = this.tanggalPinjam;
    data['batas_pinjam'] = this.batasPinjam;
    data['tanggal_kembali'] = this.tanggalKembali;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.buku != null) {
      data['buku'] = this.buku!.toJson();
    }
    return data;
  }
}

class Buku {
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

  Buku(
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
      this.updatedAt});

  Buku.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
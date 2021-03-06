---
date: 2018-01-14
description: Kadang-kadang code menggunakan Java agak menyusahkan programmer. Adakah cara yang lebih tersusun untuk sesuatu masalah semasa membina struktur code? Jom lihat design pattern!
---

# Design Pattern

Sebelum kita lihat dengan lebih mendalam mengenai `design pattern`, kita lihat
kembali ke tutorial sebelum ini iaitu [tutorial convenience
library](../quality/convenience-library.md). Lihat code yang paling terakhir,
yang ini:

```java
...
final Pengguna kassim = new Pengguna(
        "Kassim",
        25,
        "Lelaki",
        "123, Jalan 1",
        "Kampung Dusun",
        "kassimkgdusun@gmail.com",
        "012-1234567",
        "01-1234567",
        "CIMB Bank",
        "123456ABC",
        "ABC123456",
        Timestamp.from(now()),
        null);
...
```

Kalau lihat code tersebut, parameter untuk constructor terlalu banyak. Contoh
kalau code tersebut ditulis oleh orang lain, adakah anda yakin kedudukan data
tersebut memang betul ada di tempat yang betul.

Sekali pandang memang tak salah, tetapi tak ada ke cara yang lebih elok?

## Builder

Perkenalkan `Builder`!

Oleh sebab kita sudah diperkenalkan dengan Lombok, kita akan menggunakan Lombok
untuk membuat Builder. Tambah sahaja _annotation_ `@Builder` untuk class
`Pengguna`:

```java
@Data
@AllArgsConstructor
@Builder
public class Pengguna {
    private String nama;
    private int umur;
    private String jantina;
    private String alamat1;
    private String alamat2;
    private String email;
    ...
```

Cara untuk menggunakan builder adalah seperti berikut:

```java
final Pengguna kassim = Pengguna.builder()
        .nama("Kassim")
        .umur(25)
        .jantina("Lelaki")
        .alamat1("123, Jalan 1")
        .alamat2("Kampung Dusun")
        .email("kassimkgdusun@gmail.com")
        .telefonBimbit("012-1234567")
        .telefonRumah("01-1234567")
        .namaBank("CIMB Bank")
        .noAkaunBank("123456ABC")
        .noAkaunKwsp("ABC123456")
        .waktuDaftar(Timestamp.from(now()))
        .waktuKemaskini(null)
        .build();
```

Sekarang barulah jelas data-data tersebut dimasukkan ke mana.

Jika anda ingin lihat bagaimana code untuk builder, guna sahaja Delombok seperti
yang kita sudah lihat di tutorial sebelum ini.

Balik ke topik design pattern. Builder ialah salah satu daripada design pattern.
Design pattern bermaksud cara-cara untuk menulis atau menyusun code untuk
masalah yang ramai sudah hadapi.

Jika anda masih baru dalam programming, anda mungkin biasa melihat code dalam
tutorial mula dari `main()` kemudian menjalankan code berikutnya satu per satu
sehinggalah habis.

Dalam situasi sebenar, struktur code bukannya sebegitu, tetapi ada di
merata-rata tempat. Jadi, design pattern boleh digunakan sebagai panduan untuk
menjadikan code lebih teratur.

## Design Pattern dalam Java

Setiap _design pattern_ ada gelarannya.

Dalam tutorial sebelum-sebelum ini, kita sudah lihat beberapa _design pattern_
dalam Java; antaranya DAO dan Service, _dependency injection_, _module_, _object
pool_, dan _facade_.

Saya memang tidak mengharapkan anda untuk menghafal semua _design pattern_ yang
ada. Yang saya boleh cadangkan adalah anda boleh cari senarai _design pattern_
dalam mana-mana website, kemudian setiap hari atau setiap minggu jenguk-jenguk
website tersebut dan tengok satu atau dua _design pattern_.

Website untuk _design pattern_ yang saya selalu tengok adalah yang ini:

[java-design-patterns.com](http://java-design-patterns.com/patterns/)

Di website tersebut, anda juga boleh tapis _design pattern_ mengikut tahap
kesukaran. Jika anda baru bermula, klik sahaja pada `difficulty-beginner`.

## Kritik

Ada beberapa golongan yang mengkritik design pattern.

Bagi sesetengah orang, design pattern menandakan kelemahan sesuatu programming
language. Contoh untuk design pattern Builder, dalam sesetengah programming
language lain tidak perlu membuat builder, hanya perlu menggunakan parameterized
constructor untuk menyelesaikan masalah yang sama.

Design pattern hanyalah panduan, anda boleh pilih untuk tidak menggunakan design
pattern jika anda tidak mahu.

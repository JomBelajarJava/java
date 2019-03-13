---
date: 2018-01-04
description: Kebanyakan programmer tidak suka menggunakan Java kerana Java memang verbose. Jadi gunakan convenience library untuk mengurangkan bilangan code Java.
---

# Convenience Library

Dalam tutorial sebelum-sebelum ini, saya ada memperkenalkan beberapa library
Java antaranya [Guice](https://github.com/google/guice),
[Vavr](https://github.com/vavr-io/vavr), dan
[Guava](https://github.com/google/guava). Semua library tersebut boleh
dikategorikan sebagai `convenience library`.

_Convenience_ bermaksud 'kemudahan'. Jadi, `convenience library` bermaksud
library yang memudahkan kita untuk program menggunakan Java.

Kebanyakan programmer tidak suka menggunakan Java kerana perlu menulis banyak
syntax hanya untuk melakukan benda yang simple. Oleh itu, beberapa library dibina
bagi mengurangkan bilangan code yang perlu ditulis. Pada pendapat saya, semakin
kurang code yang perlu ditulis semakin kurang kesilapan yang akan berlaku kerana
manusia mudah melakukan kecuaian.

Antara `convenience library` yang saya sudah perkenalkan:

* Google Guava - Selain _immutable collections_, ada kemudahan lain yang ada
  dalam library Guava. Anda boleh lihat documentation di GitHub.

* Google Guice - Jika kita tidak menggunakan _framework_ untuk membuat
  _dependency injection_, kita perlu tulis sendiri class untuk _injection_.

* Vavr - Kepada sesiapa yang ada pengalaman menggunakan Java 8 akan tahu syntax
  yang baru masih ada kelemahannya. Jadi Vavr memudahkan lagi penggunaan syntax
  Java 8. Sangat digalakkan kepada yang minat _functional programming_ tetapi
  terpaksa menggunakan Java.

Sekarang saya akan memperkenalkan satu lagi _convenience library_ yang betul-betul
akan mengurangkan bilangan code Java, iaitu
[Project Lombok](https://projectlombok.org/).

## Project Lombok

`Lombok` ialah library untuk menghasilkan _constructor_, _getter_, _setter_,
toString(), hashCode() dan sebagainya hanya dengan menggunakan _annotation_.
Lombok akan _generate_ code yang diperlukan sebelum Java compile program kita.

Untuk menggunakan `Lombok`, tambah _dependency_ di `pom.xml` (Maven):

```xml
<dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    <version>1.16.18</version>
    <scope>provided</scope>
</dependency>
```

Jika anda menggunakan IDE seperti IntelliJ, anda boleh download plugin untuk
`Lombok` supaya IDE tersebut faham _annotation_ Lombok. Rujuk documentation
Project Lombok.

Katakanlah kita perlu membuat class untuk menyimpan semua maklumat mengenai
Pengguna seperti nama, umur, jantina, alamat, email, telefon, no akaun bank, dan
sebagainya, _field_ tersebut akan kelihatan seperti ini:

```java
import java.sql.Timestamp;

public class Pengguna {
    private String nama;
    private int umur;
    private String jantina;
    private String alamat1;
    private String alamat2;
    private String email;
    private String telefonBimbit;
    private String telefonRumah;
    private String namaBank;
    private String noAkaunBank;
    private String noAkaunKwsp;
    private Timestamp waktuDaftar;
    private Timestamp waktuKemaskini;
}
```

Cuba bayangkan berapa banyak _getter_ dan _setter_ yang perlu ditulis hanya
untuk class ini.

Untuk menggunakan `Lombok`, tambah sahaja _annotation_. Contoh untuk
menghasilkan _getter_, _setter_, dan toString(), anda hanya perlu menambah
_annotation_ `@Data`. Untuk menghasilkan _constructor_, tambah
`@AllArgsConstructor`. Contoh seperti berikut:

```java
import lombok.AllArgsConstructor;
import lombok.Data;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
public class Pengguna {
    private String nama;
    private int umur;
    private String jantina;
    private String alamat1;
    private String alamat2;
    private String email;
    private String telefonBimbit;
    private String telefonRumah;
    private String namaBank;
    private String noAkaunBank;
    private String noAkaunKwsp;
    private Timestamp waktuDaftar;
    private Timestamp waktuKemaskini;
}
```

dan segala-galanya sudah siap.

Untuk test class ini, kita boleh cuba seperti ini:

```java
import java.sql.Timestamp;

import static java.time.Instant.now;

public class Main {
    public static void main(final String[] args) {
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

        System.out.println(kassim);

        kassim.setUmur(26);

        System.out.println(kassim);
    }
}
```

## Delombok

Jika anda ingin melihat bagaimana Lombok _generate_ code untuk sesuatu class,
anda boleh menggunakan Delombok.

Jika anda menggunakan IntelliJ, anda boleh klik kanan pada _annotation_ Lombok,
kemudian `Refactor` > `Delombok`, dan pilih _annotation_ yang anda mahu
Delombok-kan.

Feature ini juga boleh digunakan jika team anda tidak pandai atau enggan
menggunakan Lombok.

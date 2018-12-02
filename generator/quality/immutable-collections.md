---
date: 2017-12-31
description: Final sahaja tidak mencukup. Tutorial ini kita tambah pula immutable collections untuk tidak mengubah variable dan kandungan variable tersebut.
---

# Immutable Collections

Dalam tutorial `final`, variable tidak akan berubah apabila diletakkan keyword
_final_, tetapi bagaimana pula untuk Collections seperti List, Map, dan Set?

Kita boleh buat sedikit eksperimen seperti ini:

```java
final List<String> cubaan = new ArrayList<>(Arrays.asList("satu", "dua", "tiga"));
cubaan.add("empat");

System.out.println(cubaan);
```

Jika anda cuba code di atas, program akan print keempat-empat string tersebut.
Maksudnya nilai variable tersebut berubah. Jadi, apa yang berlaku?

Sebenarnya dalam Java, apa yang berlaku apabila kita letak final untuk object
ialah cuma _reference_ kepada object yang tidak berubah tetapi kandungan object
masih boleh berubah.

Ini contoh yang akan membuatkan program keluar error untuk Collections:

```java
final List<String> cubaan = new ArrayList<>(Arrays.asList("satu", "dua", "tiga"));
cubaan = new ArrayList<>();
```

Jadi, sekarang kita akan lihat bagaimana untuk mencapai `const correctness`
untuk Collections.

## Unmodifiable Collections

Cara yang paling senang adalah dengan menggunakan method `unmodifiableXXX()`
yang ada dalam `java.util.Collections`. Contoh untuk List:

```java
final List<String> namaKucingJantan = Collections.unmodifiableList(Arrays.asList("Atan", "Boboi", "Tom"));
namaKucingJantan.add("Lisa");
```

Code di atas akan mengeluarkan error kerana kita tidak boleh _modify_ List
tersebut.

Walaupun cara ini mudah, tetapi ada sedikit isu kerana method
`unmodifiableXXX()` hanya memberi _view_, bukannya Collection yang betul-betul
Collection. Kalau ada _reference_ lain yang _refer_ ke List yang asal, List
tersebut masih boleh diubah. Contoh:

```java
final List<String> listAsal = new ArrayList<>(Arrays.asList("satu", "dua", "tiga"));
final List<String> listBaru = Collections.unmodifiableList(listAsal);
listAsal.add("empat");

System.out.println(listBaru);
```

Bagi mengatasi masalah ini, kita perlu menggunakan library yang ada `immutable
collections`.

## Immutable Collections

Antara library yang saya biasa guna yang ada `immutable collections` ialah
[Vavr](https://github.com/vavr-io/vavr) dan
[Google Guava](https://github.com/google/guava). Saya akan cadangkan Vavr
untuk sesiapa yang biasa dengan _functional programming_, jadi untuk tutorial
ini saya akan gunakan Google Guava.

## Google Guava

Seperti biasa, kita perlu dapatkan library Guava terlebih dahulu. Jadi tambah
ini ke file `pom.xml` jika anda menggunakan Maven (atau apa saja cara yang anda
tahu untuk menambah library):

```xml
<dependency>
    <groupId>com.google.guava</groupId>
    <artifactId>guava</artifactId>
    <version>23.6-jre</version>
</dependency>
```

Guava juga ada versi untuk Android dengan menukar version ke `23.6-android`.
Rujuk documentation di GitHub.

Contoh penggunaan `immutable collections` dengan Guava adalah seperti ini (ini
akan menghasilkan error):

```java
final List<String> cubaan = ImmutableList.of("satu", "dua", "tiga");
cubaan.add("empat");
```

Ini pula contoh untuk menggabungkan _immutable list_ menggunakan method
`concat()` dari class `Iterables`:

```java
final List<String> namaKucingJantan = ImmutableList.of("Atan", "Boboi", "Tom");
final List<String> namaKucingBetina = ImmutableList.of("Lisa", "Tasha", "Mimi");

final Iterable<String> namaKucing = Iterables.concat(namaKucingJantan, namaKucingBetina);

System.out.println(namaKucing);
```

Kalau perasan, hasil dari _concat_ ialah interface `Iterable<T>`. Jika anda
ingin menggunakan method-method yang ada pada interface `List<T>` contohnya
method `size()`, anda boleh menggunakan method yang ada pada library Guava.
Contohnya:

```java
final List<String> namaKucingJantan = ImmutableList.of("Atan", "Boboi", "Tom");
final List<String> namaKucingBetina = ImmutableList.of("Lisa", "Tasha", "Mimi");

final Iterable<String> namaKucing = Iterables.concat(namaKucingJantan, namaKucingBetina);
final int bilanganNamaKucing = Iterables.size(namaKucing);

System.out.println(bilanganNamaKucing);
```

Apa-apa rujuk JavaDoc Google Guava.

# Final

## Pengenalan

`final` ialah keyword yang digunakan untuk memastikan sesuatu variable tidak
berubah.

Dalam tutorial database saya ada menggunakan keyword `final` untuk setiap
variable yang ada. Teknik ini adalah salah satu cara bagi mengurangkan _bug_
(software tak jalan mengikut kehendak kita). Dalam C++, teknik ini dipanggil
`const correctness`. Pada pendapat saya, cara ini adalah satu-satunya cara untuk
membuat software yang berkualiti tanpa menulis `software testing`.

## Contoh

Kita lihat antara contoh bagaimana final boleh membantu kita semasa programming.

## Lebih hampir dengan matematik

Katakanlah jika tidak menggunakan final, kita tulis operasi matematik seperti ini:

```java
int x = 5;
        
x = x + 2;
```

Bagi yang pernah programming, memang akan tahu nilai x sekarang ialah 7. Tetapi
jika anda tunjuk `x = x + 2` kepada ahli matematik, mereka akan kata itu salah
kerana bagi mereka simbol `=` bermaksud `sama dengan`.

Apabila kita tambah `final` pada x, program kita akan keluar error, menandakan
sekarang program kita mempunyai pandangan yang sama dengan ahli matematik.

Untuk membetulkan program di atas, kita perlu meletakkan variable yang baru:

```java
final int x = 5;

final int y = x + 2;
```

Tunjuk balik kepada ahli matematik, mereka akan faham nilai x dan y adalah
berlainan.

## Memaksa kita menulis nama variable yang lebih bermakna

Menggunakan contoh yang sama di atas, kita tukar nama variable daripada `x` ke
`lima`:

```java
int lima = 5;

lima = lima + 2;
```

Sekarang dah nampak program kita jadi merepek.

Apabila kita menggunakan keyword final, program akan memaksa kita menggunakan
variable yang baru, jadi:

```java
final int lima = 5;

final int tujuh = lima + 2;
```

Kita boleh sahaja tulis benda yang sama tanpa menggunakan keyword final, tetapi
manusia mudah melakukan kecuaian. Dengan menggunakan final, program akan
mengeluarkan error semasa compile, jadi kesilapan tidak akan berlaku apabila
pengguna sedang menggunakan software kita.

## Memaksa kita mengasingkan functionality

Apabila anda sudah biasa menggunakan final, anda akan perasan sikit sahaja
variable yang betul-betul kita gunakan sebagai variable. Contohnya variable
untuk counter atau jumlah. Variable untuk counter atau jumlah memang tidak boleh
dijadikan final, oleh itu kita perlu asingkan operasi untuk mengubah variable
counter/jumlah ke method/function yang lain.

Contoh:

```java
private static int jumlahkan(final int... nombor) {
    int jumlah = 0;

    for (int i = 0; i < nombor.length; i++) {
        jumlah += nombor[i];
    }
    return jumlah;
}

public static void main(final String[] args) {
    final int jumlahDuit = jumlahkan(34, 56, 123, 56, 100);

    System.out.println(jumlahDuit);
}
```

Ini akan menjadikan setiap method/function pendek, ringkas dan simple. Cara ini
boleh dilakukan dengan Java 7. Dengan Java 8, ada syntax untuk membuat benda
yang sama dengan lebih menarik.

## Kaitan dengan functional programming

Programming language ada beberapa kategori. Contoh Java ialah _object-oriented_.
Kategori lain ialah _functional_, contohnya Clojure, Erlang, dan Haskell. Dalam
programming language yang _functional_, variable adalah final secara default.
Itu sebab saya menggunakan ahli matematik sebagai contoh kerana functional
programming adalah berasaskan _function_ dalam matematik.

Java 8 ada memperkenalkan beberapa syntax baru. Syntax baru tersebut sebenarnya
mengambil inspirasi daripada functional programming. Oleh itu, jika anda
biasakan diri dengan keyword final, itu merupakan langkah pertama untuk memahami
functional programming.

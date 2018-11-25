# Inheritance

Tujuan kita membuat inheritance adalah untuk mengguna semula class
yang sedia ada, dan membuat sedikit pengubahsuaian tanpa mengubahsuai
class yang asal.

Kita gunakan class Kucing sebagai class yang asal, dan kita ubahsuai
class tersebut kepada class KucingParsi. Class Kucing adalah
seperti berikut:

```java
package kucing;

public class Kucing {

    private String nama;
    private int umur;

    public Kucing() {
        nama = "Comel";
        umur = 5;
    }

    public void mengiau() {
        System.out.println("Meow");
    }

    public void minum() {
        System.out.println("Slrpp, slrppp");
    }
}
```

Kemudian kita buat class baru bernama KucingParsi. Untuk membuat
inheritance, kita gunakan keyword `extends` seperti berikut:

```java
package kucing;

public class KucingParsi extends Kucing {

}
```

Sekarang KucingParsi secara automatik sudah ada semua code yang ada di
dalam class Kucing. Buktinya kita boleh cuba create object daripada
class KucingParsi:

```java
package kucing;

public class Main {
    public static void main(String[] args) {
        KucingParsi kucingSaya = new KucingParsi();
        kucingSaya.minum();
    }
}
```

Kita boleh tambah method seperti biasa pada class KucingParsi
seperti ini:

```java
package kucing;

public class KucingParsi extends Kucing {
    public void makan() {
        System.out.println("Makan...");
    }
}
```

## Method overriding

Kita juga boleh ubahsuai method yang sedia ada. Cara ini dipanggil
`method overriding`. Kita boleh override method `minum()`
seperti berikut:

```java
package kucing;

public class KucingParsi extends Kucing {

    public void makan() {
        System.out.println("Makan...");
    }

    @Override
    public void minum() {
        System.out.println("Slrplrprlprlprrpl");
        System.out.println("Slrrrrrrrrrrrrp");
    }
}
```

## Superclass vs subclass

Setelah membuat inheritance, class yang asal dinamakan sebagai
'superclass', manakala class yang baru dinamakan sebagai
'subclass'. Oleh itu,

-   Kucing ialah _superclass_ kepada KucingParsi
-   KucingParsi ialah _subclass_ daripada Kucing

## Keyword `super`

Kegunaan keyword `super` adalah sama dengan keyword `this`. Bezanya
ialah keyword `super` merujuk kepada superclass. Contohnya, apabila
constructor class Kucing mempunyai parameter seperti berikut:

```java
package kucing;

public class Kucing {

    private String nama;
    private int umur;

    public Kucing(String nama, int umur) {
        this.nama = nama;
        this.umur = umur;
    }

    ...
```

maka kita boleh menggunakan keyword `super` untuk menghantar data dari
_subclass_ ke _superclass_ seperti ini:

```java
package kucing;

public class KucingParsi extends Kucing {

    public KucingParsi(String nama, int umur) {
        super(nama, umur);
    }

    ...
```

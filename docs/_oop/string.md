---
date: 2015-07-01
description: String sebenarnya ialah class. Class String menggabungkan beberapa character. Sama seperti class yang lain, class String juga mempunyai methods.
---

# String

Kalau perasan jenis data String ditulis bermula dengan huruf besar,
berbanding jenis data yang lain seperti `int`, `double`, dan `boolean`.
Ini kerana String sebenarnya ialah class.

String merupakan gabungan daripada beberapa character (huruf, nombor,
simbol). Jadi, class String dibuat untuk menggabungkan character
tersebut.

Sama seperti class yang lain, String juga mempunyai method yang boleh kita
gunakan.

## length

Kita boleh menggunakan method `length()` untuk mendapatkan panjang
sesuatu String atau dalam erti kata lain, untuk mendapatkan bilangan
_character_ yang ada dalam sesuatu String:

```java
package tutorialjava;

public class Main {
    public static void main(String[] args) {
        String cikgu = "Cikgu suka main bola, hari-hari cikgu main bola";
        int bilanganCharacter = cikgu.length();

        System.out.println(bilanganCharacter);
    }
}
```

Character yang dikira termasuklah tempat kosong (_blank_).

## charAt

Method `charAt()` boleh digunakan untuk mendapatkan character daripada
String. Contohnya,

```java
package tutorialjava;

public class Main {
    public static void main(String[] args) {
        String cikgu = "Cikgu suka main bola, hari-hari cikgu main bola";

        char hurufPertama = cikgu.charAt(0);
        char hurufKedua = cikgu.charAt(1);

        System.out.println(hurufPertama);
        System.out.println(hurufKedua);
    }
}
```

Dalam programming, kiraan biasanya dibuat bermula dari 0 seperti ini:

```
0, 1, 2, 3, 4, 5…
```

bukannya,

```
1, 2, 3, 4, 5…
```

## toLowerCase/toUpperCase

Kita boleh menggunakan method `toLowerCase()` untuk menjadikan String
tersebut kepada huruf kecil semuanya. Method `toUpperCase()` pula untuk
menjadikan String kepada huruf besar.

```java
package tutorialjava;

public class Main {
    public static void main(String[] args) {
        String cikgu = "Cikgu suka main bola, hari-hari cikgu main bola";
        String cikguHurufBesar = cikgu.toUpperCase();

        System.out.println(cikguHurufBesar);
    }
}
```

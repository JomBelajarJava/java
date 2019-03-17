---
date: 2015-06-27
description: Programming dan matematik memang tidak dapat dipisahkan. Sesuatu program akan terus membuat pengiraan jika mana-mana simbol matematik digunakan.
---

# Matematik

Programming dan matematik memang tidak dapat dipisahkan.

Jika kita tulis operasi matematik seperti tambah, tolak, darab, dan
bahagi, program akan terus mendapatkan jawapan untuk operasi tersebut.
Jadi, kita tidak perlu bersusah payah menggunakan kalkulator untuk
mendapatkan jawapan.

Code berikut adalah contoh penggunaan operasi matematik dalam
programming. Kita juga perlu beritahu kepada komputer untuk memaparkan
jawapan dengan menggunakan `System.out.println()`, jika tidak komputer
hanya mengira sahaja tanpa menulis jawapan.

```java
public class Matematik {
    public static void main(String[] args) {
        // Java akan terus kira jawapan kepada operasi Matematik berikut
        System.out.println(3 + 4);
        System.out.println(5 - 7);
        System.out.println(8 * 7);
        System.out.println(2 * 3 + 5);

        // Dalam Java, kita mesti beritahu sama ada kita nak perpuluhan atau
        // tak. Kalau tak, Java akan bagi jawapan TANPA baki.
        System.out.println(9 / 2);

        // Guna modulus, '%' untuk dapatkan baki
        System.out.println(9 % 2);

        // Letak perpuluhan kalau nak jawapan dalam bentuk perpuluhan
        System.out.println(9.0 / 2);
    }
}
```

## Perbandingan

Kita juga boleh membuat perbandingan antara nombor. Contohnya,

```java
public class Matematik {
    public static void main(String[] args) {
        // Tanda == digunakan untuk melihat sama ada nombor adalah sama.
        // Jadi di sini, program akan memaparkan true.
        System.out.println(3 == 3);

        // != untuk nombor yang berbeza. Di sini, program akan memaparkan false.
        System.out.println(3 != 3);

        // > untuk nombor yang lebih besar daripada nombor yang lain.
        System.out.println(5 > 4);

        // >= untuk nombor yang lebih besar atau sama dengan nombor yang lain.
        System.out.println(5 >= 5);

        // < untuk nombor yang lebih kecil daripada nombor yang lain.
        System.out.println(5 < 7);

        // <= untuk nombor yang lebih kecil atau sama dengan nombor yang lain.
        System.out.println(7 <= 7);
    }
}
```

Perbandingan akan menghasilkan nilai `true` atau `false` menandakan sama ada
betul ataupun tidak.

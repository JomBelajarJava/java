---
date: 2015-06-27
description: Variable ialah tempat untuk menyimpan sesuatu data. Program yang lebih menarik boleh dibuat dengan menggunakan variable. Lihat cara penggunaannya di sini.
---

# Variable

Variable ialah tempat untuk menyimpan data.

Contohnya, jika kita buat sesuatu pengiraan dan sudah mendapat jawapan.
Kemudian kita mahu menggunakan jawapan tersebut di tempat lain, tetapi
kita tidak mahu membuat pengiraan semula. Jadi, kita boleh menggunakan
variable untuk menyimpan jawapan tersebut dan terus guna di tempat yang
kita mahu.

Untuk membuat variable, kita tulis jenis data kemudian nama variable
tersebut. Sebagai contoh,

```java
int nombor;
```

Untuk menyimpan data dalam variable tersebut, tulis nama variable,
kemudian tulis simbol `=` diikuti dengan data. Contoh,

```java
nombor = 5;
```

Kita juga boleh terus memasukkan data sebaik sahaja kita membuat
variable,

```java
int nombor = 5;
```

Berikut adalah contoh program menggunakan variable untuk menyimpan
pelbagai jenis data, dan cara untuk menggunakannya:

```java
public class ContohVariable {

    public static void main(String[] args) {

        // 'int' adalah jenis data yang kita nak simpan, int bermaksud
        // integer(nombor bulat). 'nomborBulat' adalah nama kepada variable
        // tersebut, kita boleh namakan apa-apa sahaja.
        int nomborBulat = 5;
        System.out.println(nomborBulat);

        // 'double' adalah jenis data untuk nombor perpuluhan
        double nomborPerpuluhan = 6.7345;
        System.out.println(nomborPerpuluhan);

        // 'char' adalah jenis data untuk character (huruf, nombor, simbol
        // dan sebagainya)
        char huruf = 'z';
        System.out.println(huruf);

        // 'boolean' adalah jenis data untuk simpan true atau false sahaja
        boolean betulAtauSalah = false;
        System.out.println(betulAtauSalah);

        // String adalah jenis data untuk gabungan beberapa character
        String email = "Email saya ialah [email protected]";
        System.out.println(email);
    }
}
```

## Contoh penggunaan variable

Variable boleh digunakan dalam operasi matematik:

```java
public class ContohPenggunaanVariable {

    public static void main(String[] args) {

        int a = 10;
        int b = 15;
        int c = a + b;
        System.out.println(c);  // akan papar 25
    }
}
```

Variable hanya boleh menyimpan satu data pada satu masa. Apabila kita
masukkan data yang lain pada variable yang sama, data yang asal akan
digantikan dengan data yang baru:

```java
public class ContohPenggunaanVariable {

    public static void main(String[] args) {

        int x = 5;
        x = 10;
        System.out.println(x);  // akan papar 10
    }
}
```

Kita boleh menggunakan data yang asal untuk digunakan dalam mana-mana
operasi, kemudian masukkan kembali ke variable yang sama. Contoh:

```java
public class ContohPenggunaanVariable {
    public static void main(String[] args) {

        int x = 5;
        x = x + 1;
        System.out.println(x);  // akan papar 6
    }
}
```

Cara yang sama, cuma lebih ringkas:

```java
public class ContohPenggunaanVariable {
    public static void main(String[] args) {

        int x = 5;
        x += 1;
        System.out.println(x);  // sama, akan papar 6
    }
}
```

Juga cara yang sama, tetapi cara ini hanya boleh bertambah atau
berkurang satu sahaja:

```java
public class ContohPenggunaanVariable {
    public static void main(String[] args) {

        int x = 5;
        x++;
        System.out.println(x);  // juga sama, akan papar 6
    }
}
```

## Tujuan kita perlu menulis jenis data

Kita perlu menulis jenis data kerana ada sesetengah operasi yang boleh
digunapakai oleh lebih dari satu jenis data. Contohnya, jika kita tambah
dua nombor, kita akan dapat jumlahnya. Tetapi jika kita tambah dua
string, kita menggabungkan dua string tersebut.

```java
public class ContohPenggunaanVariable {
    public static void main(String[] args) {

        int nombor1 = 10;
        int nombor2 = 10;
        System.out.println(nombor1 + nombor2);  // akan papar 20
    }
}
```

Berbeza dengan ini,

```java
public class ContohPenggunaanVariable {
    public static void main(String[] args) {

        String nombor1 = "10";
        String nombor2 = "10";
        System.out.println(nombor1 + nombor2);  // akan papar 1010
    }
}
```

Ataupun gabungan daripada yang berlainan jenis,

```java
public class ContohPenggunaanVariable {
    public static void main(String[] args) {

        int duit = 150;
        String ayat = "Saya ada RM ";
        System.out.println(ayat + duit);  // "Saya ada RM 150"
    }
}
```

---
date: 2019-03-16
description: Dalam dunia sebenar, sesuatu perkara biasanya mempunyai lebih daripada satu syarat. Gunakan operasi logik untuk menghubungkan beberapa syarat.
---

# Logik

Dalam dunia sebenar biasanya terdapat beberapa syarat untuk sesuatu perkara.
Programming language yang lengkap mesti boleh menggambarkan lebih daripada satu
syarat dalam program. Satu cara adalah dengan menggunakan beberapa if statement.
Satu cara lagi adalah dengan menggunakan operasi logik.

Berikut ialah operasi logik yang kita boleh gunakan dalam Java:

- `!` - untuk operasi NOT
* `&&` - untuk operasi AND
- `||` - untuk operasi OR

## NOT (!)

Operasi `!` untuk menidakkan atau menterbalikkkan syarat. Contohnya,

```java
    int gaji = 5000;
    boolean miskin = gaji < 10000;
    boolean perluBayarCukai = !miskin;

    System.out.println("Perlu bayar cukai? " + perluBayarCukai);
```

Code di atas bermaksud syarat perlu bayar cukai ialah tidak miskin. Maka kita
boleh menetapkan syarat untuk miskin kemudian guna operasi `!` untuk menyatakan
syarat tidak miskin.

## AND (&&)

Secara teorinya, operasi `&&` adalah untuk syarat yang perlu mematuhi **semua**
syarat yang ditetapkan. Contohnya,

```java
    int fatPercentage = 75;
    int carbohydrate = 15;

    boolean isHighFat = fatPercentage > 70;  // in %
    boolean isLowCarb = carbohydrate < 50;  // in gram

    boolean isKetoDiet = isHighFat && isLowCarb;

    System.out.println("Adakah ini diet keto? " + isKetoDiet);
```

Code di atas bermaksud syarat diet keto ialah tinggi lemak dan rendah
karbohidrat. Jadi kita boleh menggunakan operasi `&&` untuk hubungan
syarat-syarat tersebut.

Secara teknikal pula, program akan membaca dari kiri ke kanan. Apabila satu
syarat adalah `false`, syarat-syarat di sebelah kanan tidak akan dinilai dan
program akan terus memberi `false` kepada syarat tersebut.

## OR (||)

Secara teorinya, operasi `||` adalah untuk syarat yang perlu mematuhi **paling
kurang satu** syarat. Contohnya,

```java
    boolean batuk = false;
    boolean selsema = true;
    boolean migrain = false;
    boolean keracunan = false;

    boolean cuti = batuk || selsema || migrain || keracunan;

    System.out.println("Dapat cuti? " + cuti);
```

Code di atas bermaksud syarat untuk mendapat cuti adalah apabila terkena satu
atau lebih daripada penyakit tersebut. Jadi, kita boleh menggunakan operasi
`||`.

Secara teknikal pula, sama seperti operasi `&&` program akan membaca dari kiri
ke kanan. Apabila satu syarat adalah `true`, syarat-syarat di sebelah kanan
tidak akan dinilai.

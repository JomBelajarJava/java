---
date: 2015-07-05
description: Array merupakan data structure yang paling simple yang boleh kita gunakan. Array digunakan untuk menyimpan lebih daripada satu data dengan cara tersusun.
---

# Array

Sebelum ini, kita menggunakan variable untuk menyimpan data. Walau
bagaimanapun variable hanya boleh menyimpan satu data sahaja pada satu
masa. Jika kita mahu menyimpan lebih daripada satu data, kita boleh
menggunakan `array`.

Cara untuk membuat array adalah seperti berikut:

```java
package datastructure;

public class ContohArray {
    public static void main(String[] args) {
        int[] nomborBilik = new int[5];
    }
}
```

Nombor 5 tersebut bermaksud array `nomborBilik` hanya boleh menyimpan 5
data sahaja.

Untuk memasukkan data ke dalam array, kita tulis nama array tersebut
serta kedudukannya:

```java
package datastructure;

public class ContohArray {
    public static void main(String[] args) {
        int[] nomborBilik = new int[5];
        nomborBilik[0] = 101;
        nomborBilik[1] = 202;
        nomborBilik[2] = 303;
        nomborBilik[3] = 404;
        nomborBilik[4] = 505;
    }
}
```

Perhatikan kedudukan di dalam array bermula dengan 0, bukannya 1.

Untuk mengakses kembali data di dalam array, sama juga tulis nama
array serta kedudukannya:

```java
package datastructure;

public class ContohArray {
    public static void main(String[] args) {
        int[] nomborBilik = new int[5];
        nomborBilik[0] = 101;
        nomborBilik[1] = 202;
        nomborBilik[2] = 303;
        nomborBilik[3] = 404;
        nomborBilik[4] = 505;

        System.out.println(nomborBilik[3]);
    }
}
```

Cara lain untuk membuat array adalah dengan menggunakan kurungan `{}`:

```java
package datastructure;

public class ContohArray {
    public static void main(String[] args) {
        int[] nomborBilik = {101, 202, 303, 404, 505};
        System.out.println(nomborBilik[3]);
    }
}
```

Hati-hati semasa menggunakan array kerana saiz array tidak boleh
berubah. Sama juga jika menggunakan kurungan `{}`.

## Multidimensional array

Ada sesetengah data memerlukan lebih daripada satu dimensi, contohnya
data spreadsheet seperti Excel yang menggunakan _row_ dan _column_.
Jadi, kita boleh menggunakan _multidimensional array_.

```java
package datastructure;

public class ContohArray {
    public static void main(String[] args) {
        String[][] jadual = new String[2][3];
        jadual[0][0] = "Sabtu";
        jadual[0][1] = "bangun pagi";
        jadual[0][2] = "gosok gigi";
        jadual[1][0] = "Ahad";
        jadual[1][1] = "bangun pagi";
        jadual[1][2] = "tidur balik";

        System.out.println(jadual[1][1]);
    }
}
```

Sama seperti _array_ biasa, kita juga boleh menggunakan kurungan `{}`
untuk membuat _multidimensional array_:

```java
package datastructure;

public class ContohArray {
    public static void main(String[] args) {
        String[][] jadual = { {"Sabtu", "bangun pagi", "gosok gigi"},
                              {"Ahad", "bangun pagi", "tidur balik"} };

        System.out.println(jadual[1][1]);
    }
}
```

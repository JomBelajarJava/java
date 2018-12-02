---
date: 2015-07-06
description: List sama dengan array yang menggunakan indeks. Bezanya ialah List boleh berubah saiz. Antara class yang menggunakan List ialah ArrayList dan LinkedList.
---

# List

Antara class yang menggunakan interface List ialah `ArrayList` dan
`LinkedList`. Cara penggunaannya adalah seperti berikut:

```java
package datastructure;

import java.util.ArrayList;
import java.util.List;

public class ContohList {
    public static void main(String[] args) {

        List<String> names = new ArrayList<>();
        names.add("Abu");
        names.add("Ali");
        names.add("Atan");

        System.out.println("List yang asal:");

        for (String name : names) {
            System.out.println(name);
        }

        names.remove(1);

        System.out.println("Selepas buang nama di indeks 1:");

        for (String name : names) {
            System.out.println(name);
        }
    }
}
```

Java 7 dan ke atas membenarkan _diamond interface_ seperti ini:

```java
List<String> names = new ArrayList<>();
```

Jika anda menggunakan Java 6 atau ke bawah, anda mungkin perlu menulis begini:

```java
List<String> names = new ArrayList<String>();
```

Contoh di atas menggunakan method `add()` untuk menambah data ke dalam
List, dan method `remove()` untuk membuang data daripada List. Untuk
lihat method lain yang boleh digunakan, sila rujuk Java API.

[Klik untuk lihat List di Java API](https://docs.oracle.com/javase/8/docs/api/java/util/List.html)

Cara lain untuk membuat List adalah dengan mengambil data daripada array
menggunakan method `Arrays.asList()`:

```java
package datastructure;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ContohList {
    public static void main(String[] args) {
        String[] nameArray = {"Abu", "Ali", "Atan"};

        List<String> names = new ArrayList<>(Arrays.asList(nameArray));

        System.out.println("List yang asal:");

        for (String name : names) {
            System.out.println(name);
        }

        names.remove(1);

        System.out.println("Selepas buang nama di indeks 1:");

        for (String name : names) {
            System.out.println(name);
        }
    }
}
```

Untuk menggunakan `LinkedList`, tukar sahaja `ArrayList` kepada
`LinkedList`, contohnya,

```java
List<String> names = new LinkedList<>();
```

Inilah kelebihan apabila menggunakan _program to interface_.

## ArrayList vs LinkedList

Kita lihat cara penggunaan kedua-dua class tersebut adalah sama. Yang
membezakan ialah apa yang berlaku di dalam class tersebut.

Secara umumnya, class ArrayList adalah lebih baik. Jika program kita
banyak melibatkan _add_ atau _remove_ pada awal indeks, barulah
digalakkan menggunakan LinkedList. Itupun jika program tersebut tidak
banyak mengakses data daripada LinkedList tersebut. Kesimpulannya,
jika kita mahu menggunakan LinkedList, kita perlu lihat perbandingan
performance program kita menggunakan kedua-duanya terlebih dahulu.

Jika malas fikir banyak, guna sahaja ArrayList.

Tips untuk meningkatkan performance ArrayList adalah dengan menentukan
saiznya terlebih dahulu sesuai dengan data. Contohnya gunakan saiz 300
jika anda membuat program untuk check perkataan dari sebuah esei:

```java
List<String> words = new ArrayList<>(300);
```

Secara default, saiz ArrayList ialah 10.

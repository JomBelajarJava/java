---
date: 2015-07-05
description: Kita lihat satu lagi jenis loop yang boleh digunakan, iaitu for each loop. Loop ini hanya boleh digunakan untuk data structure bagi memudahkan programmer.
---

# For each loop

Jika kita menggunakan sesebuah _data structure_, kebiasaannya akan ada
proses yang kita perlu buat kepada semua data di dalam _data structure_
tersebut. Untuk mengakses semua data, kita boleh menggunakan loop
seperti berikut:

```java
package datastructure;

public class ContohForEachLoop {
    public static void main(String[] args) {
        String[] names = {"John", "Jack", "Jill", "Jackson"};

        for (int i = 0; i < names.length; i++) {
            System.out.println(names[i]);
        }
    }
}
```

Satu lagi cara adalah dengan menggunakan `for each loop`:

```java
package datastructure;

public class ContohForEachLoop {
    public static void main(String[] args) {
        String[] names = {"John", "Jack", "Jill", "Jackson"};

        for (String name : names) {
            System.out.println(name);
        }
    }
}
```

For each loop akan akses semua data tanpa perlu meletakkan nombor
indeks. Ini bagi memudahkan programmer lain. Jika nampak for each loop
sahaja sudah tahu bahawa _loop_ tersebut akan akses semua data dalam
sesebuah data structure.

Antara kelemahannya ialah for each loop tidak boleh akses dua data
pada satu masa. Contoh jika menggunakan loop biasa:

```java
package datastructure;

public class ContohForEachLoop {
    public static void main(String[] args) {
        String[] names = {"John", "Jack", "Jill", "Jackson"};

        for (int i = 0; i < names.length - 1; i++) {
            System.out.println(names[i] + " " + names[i + 1]);
        }
    }
}
```

---
date: 2015-07-06
description: Set digunakan untuk menyimpan data yang lain daripada yang lain. Jika ada data yang sama, Set akan mengambil satu sahaja daripada data tersebut.
---

# Set

Set boleh digunakan untuk menyimpan data yang unik. Jika ada yang sama, Set akan
tetap menyimpan satu sahaja. Class yang menggunakan interface `Set` antaranya
ialah `HashSet`, `TreeSet`, dan `LinkedHashSet`.

## HashSet

HashSet digunakan jika kita tidak kisah bagaimana kedudukan data di
dalam Set. Dari segi performance, HashSet adalah yang terbaik.

Contoh penggunaannya:

```java
package datastructure;

import java.util.HashSet;
import java.util.Set;

public class ContohSet {
    public static void main( args) {
        Set<String> kuih = new HashSet<>();
        kuih.add("karipap");
        kuih.add("donat");
        kuih.add("kuih lapis");
        kuih.add("karipap");

        for (String k : kuih) {
            System.out.println(k);
        }
    }
}
```

Hasilnya hanya satu `karipap` sahaja yang ada dalam Set tersebut
walaupun kita masukkan dua. Perhatikan juga kedudukan kuih tidak
mengikut urutan seperti yang kita masukkan.

## TreeSet

TreeSet akan menyusun data di dalamnya mengikut nilai data tersebut,
contohnya jika nombor akan mengikut urutan angka naik, jika String akan
mengikut huruf:

```java
package datastructure;

import java.util.Set;
import java.util.TreeSet;

public class ContohSet {
    public static void main(String[] args) {
        Set<Integer> nombor = new TreeSet<>();
        nombor.add(10);
        nombor.add(10);
        nombor.add(5);
        nombor.add(12);

        for (Integer k : nombor) {
            System.out.println(k);
        }
    }
}
```

Dari segi performance, TreeSet adalah yang paling lambat.

## LinkedHashSet

LinkedHashSet pula menyusun data mengikut urutan sebagaimana
urutan kita memasukkan data:

```java
package datastructure;

import java.util.LinkedHashSet;
import java.util.Set;

public class ContohSet {
    public static void main(String[] args) {
        Set<Integer> nombor = new LinkedHashSet<>();
        nombor.add(10);
        nombor.add(10);
        nombor.add(5);
        nombor.add(12);

        for (Integer k : nombor) {
            System.out.println(k);
        }
    }
}
```

Dari segi performance, LinkedHashSet hampir sama laju dengan
HashSet.

## Buang duplicate

Set boleh digunakan untuk membuang duplicate daripada _data structure_
yang lain.

Contoh membuang duplicate dalam array:

```java
package datastructure;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class ContohSet {
    public static void main(String[] args) {
        Integer[] nombor = {1, 1, 1, 1, 2, 3, 4, 4, 4, 5, 6, 6, 6, 6, 7};

        Set<Integer> setNombor = new HashSet<>(Arrays.asList(nombor));

        Integer[] nomborTanpaDuplicate = setNombor.toArray(new Integer[0]);

        for (Integer n : nomborTanpaDuplicate) {
            System.out.println(n);
        }
    }
}
```

> Parameter untuk method `toArray()` di atas hanya untuk menentukan jenis data
> sahaja. Rujuk
> [toArray()](https://docs.oracle.com/javase/7/docs/api/java/util/Set.html#toArray(T[]%29)
> untuk maklumat lanjut.

Contoh membuang duplicate dalam List:

```java
package datastructure;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ContohSet {
    public static void main(String[] args) {
        List<String> listNama = new ArrayList<>();
        listNama.add("ali");
        listNama.add("ali");
        listNama.add("ali");

        Set<String> setNama = new HashSet<>(listNama);

        listNama.clear();
        listNama.addAll(setNama);

        for (String nama : listNama) {
            System.out.println(nama);
        }
    }
}
```

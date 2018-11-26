# Map

Map digunakan untuk menghubungkan antara satu data (_key_) dengan data
yang lain (_value_). Array dan List menggunakan indeks untuk
menentukan data yang mana satu, manakala Map menggunakan key yang
kita letak untuk merujuk data yang mana.

Antara class yang menggunakan interface `Map` ialah `HashMap`,
`TreeMap`, dan `LinkedHashMap`. Kalau perasan nama ketiga-tiga class
tersebut lebih kurang sama dengan nama untuk class Set. Ini bermaksud
fungsi ketiga-tiga class Map tersebut sama sahaja dengan class Set.

Contoh penggunaan Map:

```java
package datastructure;

import java.util.HashMap;
import java.util.Map;

public class ContohMap {

    public static void main(String[] args) {
        Map<String, Double> harga = new HashMap<>();
        harga.put("burger_ayam", 2.0);
        harga.put("burger_ayam_special", 3.6);
        harga.put("burger_ayam_double_special", 5.4);

        System.out.printf("Harga burger ayam: RM %.2f", harga.get("burger_ayam"));
        System.out.println();
    }
}
```

Berpandukan Java API, interface Map adalah seperti berikut:

```java
public interface Map<K,V>
```

Ini bermaksud kita perlu letakkan dua jenis data untuk _generics_ K
(_key_) dan V (_value_). Oleh itu, code di atas bermaksud _key_ kita
ialah jenis `String` dan _value_ kita ialah jenis `Double`.

Method yang boleh digunakan ialah,

-   `put()` – untuk memasukkan data
-   `get()` – untuk mengakses data menggunakan _key_

## Cara untuk mendapatkan semua key

Kita boleh menggunakan method `keySet()` untuk mendapatkan senarai
_key_ yang ada dalam sesebuah Map:

```java
package datastructure;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class ContohMap {

    public static void main(String[] args) {
        Map<String, Double> harga = new HashMap<>();
        harga.put("burger_ayam", 2.0);
        harga.put("burger_ayam_special", 3.6);
        harga.put("burger_ayam_double_special", 5.4);

        System.out.println("Senarai burger:");

        Set<String> senaraiBurger = harga.keySet();

        for (String burger : senaraiBurger) {
            System.out.println(burger);
        }
    }
}
```

dan boleh digunakan seperti berikut:

```java
package datastructure;

import java.util.HashMap;
import java.util.Map;

public class ContohMap {
    public static void main(String[] args) {
        Map<String, Double> harga = new HashMap<>();
        harga.put("burger_ayam", 2.0);
        harga.put("burger_ayam_special", 3.6);
        harga.put("burger_ayam_double_special", 5.4);

        for (String key : harga.keySet()) {
            System.out.printf("Harga %s : RM %.2f", key, harga.get(key));
            System.out.println();
        }
    }
}
```

Jika mahu ikut susunan seperti mana yang kita masukkan, tukar sahaja
dari `HashMap` ke `LinkedHashMap`.

## MultiMap

`MultiMap` ialah Map yang membenarkan satu _key_ merujuk beberapa
_value_. Interface _Map_ yang biasa hanya membenarkan satu _key_ untuk
merujuk satu _value_ sahaja. Java tidak menyediakan MultiMap tetapi
dengan sedikit _trick_, kita boleh membuat MultiMap menggunakan Map
yang biasa.

_Trick_ tersebut adalah dengan menggunakan mana-mana _data structure_
sebagai _value_, contohnya:

```java
package datastructure;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ContohMap {
    public static void main(String[] args) {
        Map<String, List<String>> haiwan = new HashMap<>();

        haiwan.put("karnivor", new ArrayList<>());
        haiwan.get("karnivor").add("harimau");
        haiwan.get("karnivor").add("singa");

        haiwan.put("omnivor", new ArrayList<>());
        haiwan.get("omnivor").add("beruang");
        haiwan.get("omnivor").add("ayam");

        for (String karnivor : haiwan.get("karnivor")) {
            System.out.println(karnivor);
        }
    }
}
```

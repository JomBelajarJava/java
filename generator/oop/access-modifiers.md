---
date: 2015-06-30
description: Access modifiers menentukan dari mana boleh akses sesuatu method atau field. Ini bertujuan untuk mengelakkan method atau field tidak digunakan dengan betul.
---

# Access modifiers

`Access modifiers` ialah keyword yang digunakan untuk menentukan sama
ada class, fields, atau methods boleh diakses ataupun tidak.
Keyword tersebut ialah `public`, `private`, dan `protected`.

## Public

Apabila keyword `public` digunakan bermakna class, fields, atau
methods tersebut boleh digunakan di mana-mana sahaja.

## Private

Keyword `private` pula hanya boleh digunakan oleh code di dalam class
itu sahaja. Keyword `private` biasanya diletakkan pada fields. Sebagai
contoh:

```java
package kucing;

public class Kucing {

  private String nama;
  private int umur;

  public Kucing() {
    nama = "Tiada nama";
    umur = 0;
  }

  public String getNama() { return nama; }

  public int getUmur() { return umur; }

  public void setNama(String n) { nama = n; }

  public void setUmur(int u) {
    if (u < 0) {
      System.out.println("Error, umur tidak boleh negatif!");
    } else {
      umur = u;
    }
  }

  public void mengiau() { System.out.println("Meow"); }

  public void minum() { System.out.println("Slrrp, slrrp"); }

}
```

Selepas meletakkan keyword `private`, maka kita tidak boleh compile code
berikut:

```java
package kucing;

public class Main {
  public static void main(String[] args) {
    Kucing kucingSaya = new Kucing();
    System.out.println(kucingSaya.nama); // error di sini
  }
}
```

Antara kelebihan menggunakan `private` adalah bagi memastikan code tidak
boleh mengubah fields secara langsung (_direct_) kerana data untuk
fields tersebut perlu dipastikan terlebih dahulu melalui setter.

## Tiada modifier

Jika kita tidak meletakkan modifier, hanya code dalam class dan
package yang sama sahaja yang boleh akses.

## Protected

Keyword `protected` hampir sama dengan yang tiada modifier, dengan
tambahan code di dalam subclass di package lain juga boleh akses.
Lihat topik `inheritance` untuk mengetahui dengan lebih lanjut mengenai
subclass.

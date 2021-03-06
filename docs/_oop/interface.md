---
date: 2015-06-30
description: Interface meletakkan syarat-syarat yang perlu ada pada class yang menggunakan interface tersebut. Interface ini ibarat kontrak antara dua komponen.
---

# Interface

Dalam sesetengah projek, ada masa code ditulis oleh beberapa orang
programmer. Contohnya, seorang mungkin buat class Kucing, dan seorang
lagi menggunakan class Kucing di method `main()`. Jadi, mereka
perlulah tahu apa yang boleh dilakukan oleh class Kucing. Oleh itu,
`interface` digunakan untuk menentukan apa yang patut ada pada class
Kucing.

Untuk membuat interface, klik kanan pada package `kucing`, kemudian
klik `New Java Interface`. Kita boleh namakan apa-apa sahaja, jadi
kita namakan interface ini sebagai `HaiwanBergerak`. Selepas klik
`Finish`, Netbeans akan menghasilkan file berikut:

```java
package kucing;

public interface HaiwanBergerak {

}
```

Untuk menambah fungsi HaiwanBergerak, kita boleh buat seperti sewaktu
menghasilkan method. Cuma bezanya method di interface tidak ada
curly braces, `{}`. Contohnya,

```java
package kucing;

public interface HaiwanBergerak {
    void jalan();
    void lari();
    void lompat();
}
```

Dengan ini, mana-mana class yang menggunakan interface
HaiwanBergerak wajib menambah method `jalan()`, `lari()`, dan `lompat()`.

## implements

Keyword `implements` boleh diletakkan pada class untuk menggunakan
sesuatu interface. Contohnya,

```java
package kucing;

public class Kucing implements HaiwanBergerak {
    private String nama;
    private int umur;

    public Kucing(String nama, int umur) {
        this.nama = nama;
        this.umur = umur;
    }
}
```

Kemudian kita wajib menambah method pada class Kucing mengikut
method yang ada pada interface HaiwanBergerak, seperti berikut:

```java
package kucing;

public class Kucing implements HaiwanBergerak {
    private String nama;
    private int umur;

    public Kucing(String nama, int umur) {
        this.nama = nama;
        this.umur = umur;
    }

    @Override
    public void jalan() {

    }

    @Override
    public void lari() {

    }

    @Override
    public void lompat() {

    }
}
```

`@Override` ditambah bertujuan untuk memberitahu compiler bahawa kita
tahu apa yang kita tengah buat. Kemudian, kita boleh tambah code dalam
methods tersebut bergantung kepada apa yang kita mahu:

```java
package kucing;

public class Kucing implements HaiwanBergerak {
    private String nama;
    private int umur;

    public Kucing(String nama, int umur) {
        this.nama = nama;
        this.umur = umur;
    }

    @Override
    public void jalan() {
        System.out.println("Jalan...");
    }

    @Override
    public void lari() {
        System.out.println("Lari!");
    }

    @Override
    public void lompat() {
        System.out.println("Lompat!");

    }
}
```

Kita juga boleh menggunakan lebih daripada satu interface pada satu
class, contohnya:

```java
package kucing;

public class Kucing implements HaiwanBergerak, HaiwanBeranak {
    private String nama;
    private int umur;

    public Kucing(String nama, int umur) {
        this.nama = nama;
        this.umur = umur;
    }

    @Override
    public void jalan() {
        System.out.println("Jalan...");
    }

    @Override
    public void lari() {
        System.out.println("Lari!");
    }

    @Override
    public void lompat() {
        System.out.println("Lompat!");
    }

    @Override
    public void beranak() {
        System.out.println("Beranak!!!!!");
    }
}
```

Antara kelebihan menggunakan IDE seperti Netbeans ialah IDE boleh
menambah methods daripada interface tersebut secara automatik.

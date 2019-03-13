---
date: 2015-07-01
description: Polymorphism membolehkan class yang sama superclass menggunakan method yang sama. Ini memudahkan programmer untuk memanipulasi class tersebut.
---

# Polymorphism

Istilah `polymorphism` diambil daripada konsep biologi yang menyatakan
setiap spesies boleh mempunyai beberapa bentuk, contohnya spesies
harimau ada harimau belang, jaguar, cheetah, dan sebagainya.

Setiap harimau tersebut mempunyai ciri-ciri dan tingkahlaku yang
tersendiri tetapi melakukan benda yang sama, contohnya harimau belang
menghendap di sebalik semak dahulu sebelum menerkam mangsa, cheetah
gunakan kepantasan untuk menangkap mangsa, tetapi kedua-duanya bertujuan
untuk menangkap mangsa.

Dalam programming, kita boleh menggunakan konsep ini untuk memudahkan
kita. Kita akan menggunakan tiga class ini (Harimau, HarimauBelang,
dan Cheetah) untuk lihat penggunaan polymorphism:

```java
package harimau;

public class Harimau {

    public Harimau() {

    }

    public void tangkapMangsa() {
        System.out.println("Saya terus tangkap saja.");
    }
}
```

```java
package harimau;

public class HarimauBelang extends Harimau {

    @Override
    public void tangkapMangsa() {
        System.out.println("Saya menyorok dahulu, kemudian terkam mangsa.");
    }

}
```

```java
package harimau;

public class Cheetah extends Harimau {

    @Override
    public void tangkapMangsa() {
        System.out.println("Saya laju, saya kejar, saya ngap mangsa.");
    }

}
```

Kita boleh menggunakan nama superclass untuk merujuk kepada
subclass. Jadi, kita boleh create object seperti berikut:

```java
package harimau;

public class Main {
    public static void main(String[] args) {
        Harimau harimau1 = new Harimau();
        Harimau harimau2 = new HarimauBelang();
        Harimau harimau3 = new Cheetah();
    }
}
```

Dengan adanya konsep polymorphism, kita boleh menggunakan method
yang sama tetapi melakukan kerja yang berbeza seperti berikut:

```java
package harimau;

public class Main {
    public static void main(String[] args) {
        Harimau harimau1 = new Harimau();
        Harimau harimau2 = new HarimauBelang();
        Harimau harimau3 = new Cheetah();

        harimau1.tangkapMangsa();
        harimau2.tangkapMangsa();
        harimau3.tangkapMangsa();
    }
}
```

Antara kelebihan menggunakan polymorphism ialah kita boleh menggunakan
loop untuk melakukan method yang sama, contohnya jika kita ada lebih
daripada seribu jenis Harimau.

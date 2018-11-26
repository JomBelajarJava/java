# Object

Setelah berjaya membuat class Kucing, barulah kita boleh membuat
`object` untuk class tersebut.

Menggunakan project yang sama dengan sebelum ini, klik kanan pada
package `kucing` dan klik `New Java Class`. Kita boleh namakan
apa-apa sahaja, jadi kita letakkan `Main` sebagai nama class. Selepas
klik `Finish`, Netbeans akan menghasilkan file berikut:

```java
package kucing;

public class Main {

}
```

Dalam Java, mula-mula sekali program akan run method `main()`. Jadi,
kita tambah method `main()` tersebut dalam class `Main`, seperti
berikut:

```java
package kucing;

public class Main {
    public static void main(String[] args) {

    }
}
```

Sekarang barulah kelihatan sama seperti program yang pernah kita lihat.

## Create object

Untuk membuat `object`, kita tentukan `class`, nama untuk
`object` tersebut, dan keyword `new`. Contohnya,

```java
package kucing;

public class Main {
    public static void main(String[] args) {
        Kucing kucingSaya = new Kucing();
    }
}
```

Selepas create object, kita boleh mengakses fields untuk object
tersebut dengan menggunakan titik noktah:

```java
package kucing;

public class Main {

    public static void main(String[] args) {
        Kucing kucingSaya = new Kucing();
        kucingSaya.nama = "Tompok";
        kucingSaya.umur = 5;
    }
}
```

Kita juga boleh menggunakan methods dari object tersebut menggunakan
titik noktah dan diakhiri dengan kurungan:

```java
package kucing;

public class Main {

    public static void main(String[] args) {

        Kucing kucingSaya = new Kucing();
        kucingSaya.nama = "Tompok";
        kucingSaya.umur = 5;
        kucingSaya.mengiau();
    }
}
```

Untuk create lebih dari satu object, kita boleh gunakan nama yang lain
untuk object tersebut, contohnya `kucingKawanSaya` seperti berikut:

```java
package kucing;

public class Main {

    public static void main(String[] args) {

        Kucing kucingSaya = new Kucing();
        kucingSaya.nama = "Tompok";
        kucingSaya.umur = 5;
        kucingSaya.mengiau();

        Kucing kucingKawanSaya = new Kucing();
        kucingKawanSaya.nama = "Comel";
        kucingKawanSaya.umur = 6;
        kucingKawanSaya.minum();
    }
}
```

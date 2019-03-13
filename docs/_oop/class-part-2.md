---
date: 2015-06-29
description: Pengenalan kepada class masih belum selesai. Di sini kita lihat penggunaan sesuatu yang dipanggil sebagai constructor, setter, dan getter.
---

# Class (part 2)

Kita kembali kepada class Kucing untuk menambah sesuatu pada
class tersebut, iaitu `constructor`, `setter`, dan `getter`. Kita juga
akan melihat pengenalan kepada `parameter`.

## Constructor

Constructor ialah method yang mempunyai nama yang sama dengan nama
class. Tujuannya adalah untuk melaksanakan sesuatu code sebaik
sahaja kita create object daripada class tersebut. Kebiasaannya
kita letak proses untuk memasukkan data ke dalam fields di dalam
constructor, contohnya:

```java
package kucing;

public class Kucing {
    String nama;
    int umur;

    /*
     * Inilah yang dinamakan constructor.
     */
    public Kucing() {
        nama = "Tiada nama";
        umur = 0;
    }

    public void mengiau() {
        System.out.println("Meow");
    }

    public void minum() {
        System.out.println("Slrrp, slrrp");
    }
}
```

Ini untuk mengelakkan error, contohnya jika kita mengakses fields
walaupun fields tersebut tidak mempunyai data.

Untuk melihat fungsi constructor, kita boleh create object daripada
class Kucing:

```java
package kucing;

public class Main {
    public static void main(String[] args) {
        Kucing kucingSaya = new Kucing();

        System.out.println(kucingSaya.nama);
    }
}
```

Lihat, kita tidak perlu memasukkan data ke dalam fields seperti
sebelum ini. Program secara automatik akan memasukkan data ke
dalam fields bergantung kepada apa yang kita tentukan di dalam
constructor.

## Setter

`Setter` ialah method yang digunakan untuk memasukkan data ke dalam
fields.

```java
package kucing;

public class Kucing {
    String nama;
    int umur;

    public Kucing() {
        nama = "Tiada nama";
        umur = 0;
    }

    /*
     * Ini contoh setter.
     */
    public void setNama(String n) {
        nama = n;
    }

    public void mengiau() {
        System.out.println("Meow");
    }

    public void minum() {
        System.out.println("Slrrp, slrrp");
    }
}
```

`String n` yang berada di dalam kurungan `setNama()` ialah
`parameter`. Parameter ialah data yang diperlukan untuk menggunakan
method tersebut. Contoh kegunaan setter adalah seperti berikut:

```java
package kucing;

public class Main {
    public static void main(String[] args) {
        Kucing kucingSaya = newKucing();
        kucingSaya.setNama("Tompok");
    }
}
```

Antara kelebihan menggunakan `setter` ialah kita dapat memastikan data
yang dimasukkan adalah data yang betul. Contohnya umur tidak boleh
menjadi negatif, jadi kita boleh pastikan nombor yang dimasukkan bukan
nombor negatif seperti berikut:

```java
package kucing;

public class Kucing {
    ...

    public void setUmur(int u) {
        if (u < 0) {
            System.out.println("Error, umur tidak boleh negatif!");
        } else {
            umur = u;
        }
    }
    ...
}
```

## Getter

`Getter` pula ialah method untuk mengakses data. Berbeza dengan method sebelum
ini, kita perlu menukar keyword `void` kepada jenis data yang kita ingin akses.
Contohnya, jika kita mahu mengakses data dari field `nama`, kita perlu tukar
`void` kepada `String`:

```java
package kucing;

public class Kucing {
    String nama;
    int umur;

    ...
    public String getNama() {
        return nama;
    }

    public int getUmur() {
        return umur;
    }
    ...
}
```

Keyword `return` digunakan untuk mengakses data tersebut atau dalam
erti kata lain _memulangkan_ data.

Kita boleh menggunakan getter seperti berikut:

```java
package kucing;

public class Main {
    public static void main(String[] args) {
        Kucing kucingSaya = new Kucing();
        System.out.println(kucingSaya.getNama());
    }
}
```

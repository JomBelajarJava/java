# Class (part 3)

Kita kembali lagi ke class Kucing, dan kita akan membuat sesuatu yang
dipanggil sebagai `constructor overloading` dan `method overloading`.
Kita juga akan melihat pengenalan kepada keyword `this`.

## Constructor overloading

Constructor overloading bermaksud kita letakkan lebih dari satu
constructor untuk class tersebut, dengan syarat parameter mereka
berlainan. Contohnya,

```java
package kucing;

public class Kucing {

    private String nama;
    private int umur;

    public Kucing() {
        nama = "Tiada nama";
        umur = 0;
    }

    public Kucing(String n, int u) {
        nama = n;
        umur = u;
    }

    ...
```

Jadi, kita boleh tentukan constructor mana yang hendak digunakan
semasa create object:

```java
package kucing;

public class Main {
    public static void main(String[] args) {
        Kucing kucingSaya = new Kucing();
        Kucing kucingKawanSaya = new Kucing("Comel", 10);

        System.out.println(kucingSaya.getNama());
        System.out.println(kucingKawanSaya.getNama());
    }
}
```

## Method overloading

Method overloading juga sama, kita boleh letakkan lebih dari satu
method yang mempunyai nama yang sama, dengan syarat parameter mereka
berlainan. Contohnya method `setNama()`,

```java
    ...

    public void setNama() {
        nama = "Tiada nama";
    }

    public void setNama(String n) {
        nama = n;
    }

    ...
```

dan kita boleh memilih untuk menggunakan method yang mana berdasarkan
parameter yang kita letakkan:

```java
package kucing;

public class Main {

    public static void main(String[] args) {
        Kucing kucingSaya = new Kucing();

        kucingSaya.setNama("Comel");
        System.out.println(kucingSaya.getNama());

        kucingSaya.setNama();
        System.out.println(kucingSaya.getNama());
    }
}
```

## Keyword '`this`'

Keyword `this` digunakan untuk merujuk object daripada class
tersebut. Antara kegunaannya adalah untuk menentukan variable yang
mana kita mahu gunakan. Contohnya apabila nama parameter adalah sama
dengan nama field, seperti berikut:

```java
    ...

    private String nama;
    private int umur;

    public Kucing() {
        nama = "Tiada nama";
        umur = 0;
    }

    public Kucing(String nama, int umur) {
        this.nama = nama;
        this.umur = umur;
    }

    ...
}
```

Satu lagi kegunaannya adalah untuk menghantar data dari parameter ke
constructor yang lain, contohnya:

```java
package kucing;

public class Kucing {

    private String nama;
    private int umur;

    public Kucing() {
        this("Tiada nama", 0);  // akan hantar ke Kucing(String nama, int umur)
    }

    public Kucing(String nama, int umur) {
        this.nama = nama;
        this.umur = umur;
    }

    ...
}
```

Oleh itu, kita boleh tulis semula class Kucing menggunakan keyword
`this`, seperti berikut:

```java
package kucing;

public class Kucing {

    private String nama;
    private int umur;

    public Kucing() {
        this("Tiada nama", 0);
    }

    public Kucing(String nama, int umur) {
        this.nama = nama;
        this.umur = umur;
    }

    public String getNama() {
        return nama;
    }

    public int getUmur() {
        return umur;
    }

    public void setNama() {
        nama = "Tiada nama";
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public void setUmur(int umur) {
        if (umur < 0) {
            System.out.println("Error, umur tidak boleh negatif!");
        } else {
            this.umur = umur;
        }
    }

    public void mengiau() {
        System.out.println("Meow");
    }

    public void minum() {
        System.out.println("Slrrp, slrrp");
    }
}
```

---
date: 2015-06-28
description: Class menentukan ciri-ciri (fields) dan tingkah laku (methods). Lihat cara untuk membuat sesuatu class dalam Java menggunakan Netbeans.
---

# Class (part 1)

Buka Netbeans (atau mana-mana IDE yang anda guna), kemudian buat `New
project`. Namakan project tersebut apa-apa sahaja yang anda mahu.

Untuk membuat `class`, klik kanan pada `Source Packages` dan klik
`New Java Class`. Kita namakan class tersebut sebagai
`Kucing`, dan nama package sebagai `kucing`. Selepas tekan
`Finish`, Netbeans akan menghasilkan file berikut:

```java
package kucing;

public class Kucing {

}
```

## Fields

`Fields` ialah variable yang kita letakkan pada class, seperti
berikut:

```java
package kucing;

public class Kucing {
    String nama;
    int umur;
}
```

`Fields` inilah yang dikatakan ciri-ciri kepada sesuatu class. Jadi,
ciri-ciri untuk class Kucing sekarang ialah nama dan umur.

## Methods

`Methods` menentukan tingkah laku yang boleh dilakukan oleh class
tersebut. Contohnya,

```java
package kucing;

public class Kucing {
    String nama;
    int umur;

    public void mengiau() {
        System.out.println("Meow");
    }

    public void minum() {
        System.out.println("Slrrp, slrrp");
    }
}
```

Jadi, tingkah laku yang boleh dilakukan oleh class Kucing sekarang ialah
mengiau dan minum.

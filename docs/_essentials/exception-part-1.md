---
date: 2015-07-02
description: Exception ialah sesuatu yang dilancarkan setiap kali error berlaku. Secara default, Java telah pun menguruskan penggunaan Exception tersebut.
---

# Exception (part 1)

Java menggunakan exception untuk mengendalikan error. Apabila
error berlaku, exception ini dilancarkan untuk menghentikan proses
yang mempunyai error.

Cara mudah untuk menghasilkan error adalah dengan membahagikan satu
nombor dengan kosong:

```java
package essential;

public class BahagiKosong {
    public static void main(String[] args) {
        int a = 1 / 0;
    }
}
```

Apabila kita run code tersebut, program akan memaparkan teks
menjelaskan tentang error tersebut, iaitu `ArithmeticException: / by
zero`.

## try-catch

Apabila exception berlaku, biasanya program akan terus tutup dan code
selepasnya tidak akan dilaksanakan. Contohnya,

```java
package essential;

public class BahagiKosong {
    public static void main(String[] args) {
        int a = 1 / 0;
        System.out.println("ini selepas bahagi kosong");
    }
}
```

Jika kita mahu run code selepasnya, kita mesti handle exception itu
secara manual. Untuk handle exception, kita boleh menggunakan
`try-catch` seperti berikut:

```java
package essential;

public class BahagiKosong {
    public static void main(String[] args) {
        try {
            int a = 1 / 0;
        } catch (ArithmeticException e) {
            System.out.println("tidak boleh bahagi kosong!");
        }

        System.out.println("ini selepas bahagi kosong");
    }
}
```

## finally

Satu tambahan kepada `try-catch` ialah `finally`. Code di dalam
`finally` akan wajib dilaksanakan. Ini bertujuan jika ada exception
lain yang tidak disangkakan berlaku.

```java
package essential;

public class BahagiKosong {
    public static void main(String[] args) {
        try {
            int a = 1 / 0;
        } catch (ArithmeticException e) {
            System.out.println("tidak boleh bahagi kosong!");
        } finally {
            System.out.println("ini confirm dilaksanakan");
        }

        System.out.println("ini selepas bahagi kosong");
    }
}
```

## throws

Kita boleh menggunakan `throws` jika kita tidak mahu handle exception pada waktu
itu, mungkin kerana tidak mahu code serabut. Contoh jika kita throws exception
daripada suatu method, maka kita boleh catch di method yang lain.

```java
package essential;

public class BahagiKosong {
    private static int bahagiKosong() throws ArithmeticException {
        return 1 / 0;
    }

    public static void main(String[] args) {
        try {
            int a = bahagiKosong();
        } catch (ArithmeticException e) {
            System.out.println("tidak boleh bahagi kosong!");
        }
    }
}
```

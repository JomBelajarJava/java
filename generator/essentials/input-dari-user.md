# Input dari user

Antara keperluan yang patut ada pada sesuatu program ialah program itu
mestilah interaktif. Sesuatu program interaktif mestilah boleh mengambil
input untuk diproses. Beberapa cara untuk mendapatkan input dari user
termasuklah:

-   daripada command line interface (command prompt/terminal)
-   menggunakan graphical user interface (GUI)

## Scanner

Sebelum kita ambil input dari user, kita lihat class `Scanner` terlebih
dahulu. Class Scanner boleh digunakan untuk memisahkan sesuatu ayat
(atau _string_) kepada beberapa perkataan (atau _token_). Contohnya,

```java
package essential;

import java.util.Scanner;

public class Input {

    public static void main(String[] args) {
        String cikgu = "Cikgu suka main bola, hari-hari cikgu main bola";

        Scanner scan = new Scanner(cikgu);

        while (scan.hasNext()) {
            System.out.println(scan.next());
        }
    }
}
```

Token tersebut boleh ditukar ke jenis data yang lain bergantung kepada
method yang digunakan, contohnya `nextInt()` tukarkan token kepada
integer, seperti berikut:

```java
package essential;

import java.util.Scanner;

public class Input {

    public static void main(String[] args) {

        String cikgu = "12 tambah 23";

        Scanner scan = new Scanner(cikgu);

        int nomborPertama = scan.nextInt();

        String operasi = scan.next();

        int nomborKedua = scan.nextInt();

        System.out.println(nomborPertama + nomborKedua);
    }
}
```

## System.in

Untuk mendapatkan input daripada user melalui command line, kita letak
`System.in` pada Scanner seperti berikut:

```java
package essential;

import java.util.Scanner;

public class Input {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
    }
}
```

Kemudian apabila kita menggunakan salah satu method `next()`, program
akan tunggu input daripada kita. Contohnya,

```java
package essential;

import java.util.Scanner;

public class Input {

    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);

        int nomborPertama, nomborKedua;

        System.out.println("Kalkulator!! Tambah sahaja...");

        System.out.print("Masukkkan nombor pertama: ");
        nomborPertama = scan.nextInt();

        System.out.print("Masukkan nombor kedua: ");
        nomborKedua = scan.nextInt();

        System.out.println("Jawapan: " + (nomborPertama + nomborKedua));
    }
}
```

Method `next()` hanya mengambil satu token sahaja, jika mahu mengambil
seluruh input, gunakan method `nextLine()`, contohnya:

```java
package essential;

import java.util.Scanner;

public class Input {

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        String nama;

        System.out.println("Hi, siapa nama awak?");
        nama = scan.nextLine();

        System.out.println("Hi, " + nama + ". Selamat berkenalan!");
    }
}
```

> Tips: Dalam Netbeans, tekan `Ctrl+Shift+I` untuk import class secara
> automatik.

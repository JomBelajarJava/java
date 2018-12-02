---
date: 2015-07-20
description: Kita boleh mengambil input daripada file menggunakan FileReader. Penggunaan FileReader boleh dibantu oleh BufferedReader untuk lebih efisyen.
---

# Input dari file

Kebanyakan program seperti Notepad, Photoshop, dan Word membenarkan user
untuk _save_ kerja mereka di dalam komputer. Kemudian user boleh sambung
semula dengan menggunakan file yang di-save tersebut. Java juga ada
menyediakan class untuk mengambil input daripada file. Jadi, kita
akan lihat cara penggunaan class tersebut.

Sebelum itu, kita perlu buat file terlebih dahulu dengan menggunakan
mana-mana text editor. Kita tulis apa-apa sahaja yang kita mahu di
dalam file tersebut. Selepas itu, kita save file tersebut
sebagai `cubaan.txt` atau apa-apa sahaja yang anda mahu. Kemudian kita
letakkan file tersebut di dalam folder project Netbeans.

## FileReader

Kita boleh menggunakan class `FileReader` untuk mengambil input daripada
file. Untuk menggunakan class `FileReader`, kita perlu handle
exception untuk mengelakkan error, contohnya jika file tersebut
tidak wujud. Method `read()` boleh digunakan untuk mendapatkan
character_daripada file. Selepas digunakan, class `FileReader` perlu
ditutup semula menggunakan method `close()`.

```java
package essential;

import java.io.FileReader;
import java.io.IOException;

public class InputDariFile {

    public static void main(String[] args) throws IOException {

        FileReader reader = null;

        try {
            reader = new FileReader("cubaan.txt");
            int input = reader.read();
            System.out.println(input);
        } finally {
            reader.close();
        }
    }
}
```

Selepas _run_, kita akan dapat satu nombor. Nombor ini ialah nombor
ASCII kerana komputer menyimpan data dalam bentuk nombor.

[Klik untuk lihat senarai nombor ASCII](http://www.asciitable.com)

Untuk menukar nombor tersebut kepada character, kita boleh menggunakan
method `Character.toChars()`:

```java
package essential;

import java.io.FileReader;
import java.io.IOException;

public class InputDariFile {

    public static void main(String[] args) throws IOException {

        FileReader reader = null;

        try {
            reader = new FileReader("cubaan.txt");
            int input = reader.read();
            System.out.println(Character.toChars(input));
        } finally {
            reader.close();
        }
    }
}
```

dan kita akan mendapat character pertama yang kita tulis dalam file.

Untuk mendapatkan semua character, kita boleh menggunakan loop:

```java
package essential;

import java.io.FileReader;
import java.io.IOException;

public class InputDariFile {

    public static void main(String[] args) throws IOException {

        FileReader reader = null;

        try {
            reader = new FileReader("cubaan.txt");

            int input;

            while ((input = reader.read()) != -1) {
                System.out.print(Character.toChars(input));
            }
        } finally {
            reader.close();
        }
    }
}
```

Loop tersebut akan berhenti apabila nombor yang dipulangkan bersamaan
-1 yang bermaksud tiada character lagi yang wujud.

## BufferedReader

Sebelum ini kita lihat class FileReader mengambil satu character
pada satu masa. Cara ini sebenarnya tidak efisyen. Jadi, Java
menyediakan class `BufferedReader` untuk membuatkan proses mengambil
input lebih efisyen.

```java
package essential;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class InputDariFile {

    public static void main(String[] args) throws IOException {

        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new FileReader("cubaan.txt"));

            String input = reader.readLine();
            System.out.println(input);
        } finally {
            reader.close();
        }
    }
}
```

Class FileReader masih digunakan cuma kali ini dibantu oleh class
BufferedReader. Method `readLine()` akan terus mengambil sepanjang
baris dalam file tersebut sebagai string.

Kita boleh menggunakan loop jika file tersebut mempunyai lebih
daripada satu baris:

```java
package essential;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class InputDariFile {
    public static void main(String[] args) throws IOException {

        BufferedReader reader = null;

        try {
            reader = new BufferedReader(new FileReader("cubaan.txt"));
            String input;

            while ((input = reader.readLine()) != null) {
                System.out.println(input);
            }
        } finally {
            reader.close();
        }
    }
}
```

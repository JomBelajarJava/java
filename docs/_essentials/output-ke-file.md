---
date: 2015-07-04
description: Kita juga boleh menhasilkan output ke file menggunakan FileWriter. FileWriter juga boleh dibantu oleh BufferedWriter untuk lebih efisyen.
---

# Output ke file

Selain boleh mengambil input daripada file, program juga boleh output ke
file menggunakan class `FileWriter`. Sama seperti input, output juga
mempunyai class untuk menjadikan output lebih efisyen menggunakan
`BufferedWriter`.

## FileWriter

Apabila kita menggunakan FileWriter, program akan create file walaupun
file tersebut tidak wujud pada asalnya. Jika file tersebut telah wujud,
FileWriter akan _overwrite_ file tersebut. Sama seperti FileReader,
kita mesti handle exception untuk class FileWriter:

```java
package essential;

import java.io.FileWriter;
import java.io.IOException;

public class OutputKeFile {
    public static void main(String[] args) throws IOException {
        FileWriter writer = null;

        try {
            writer = new FileWriter("dingdong.txt");
        } finally {
            writer.close();
        }
    }
}
```

Kita boleh menggunakan method `write()` untuk menulis character atau
string ke file:

```java
package essential;

import java.io.FileWriter;
import java.io.IOException;

public class OutputKeFile {
    public static void main(String[] args) throws IOException {
        String cikgu = "Cikgu suka main bola, hari-hari cikgu main bola";

        FileWriter writer = null;

        try {
            writer = new FileWriter("dingdong.txt");
            writer.write(cikgu);
            writer.write(cikgu);  // tulis sekali lagi
        } finally {
            writer.close();
        }
    }
}
```

Perhatikan program hanya tulis output dalam satu baris.

Untuk tulis dalam  baris baru, kita tambah `\r\n` pada string tersebut:

```java
package essential;

import java.io.FileWriter;
import java.io.IOException;

public class OutputKeFile {
    public static void main(String[] args) throws IOException {
        String cikgu = "Cikgu suka main bola, hari-hari cikgu main bola";

        FileWriter writer = null;

        try {
            writer = new FileWriter("dingdong.txt");
            writer.write(cikgu + "\r\n");
            writer.write(cikgu);
        } finally {
            writer.close();
        }
    }
}
```

## Tambah string pada file yang asal

Kita boleh menggunakan constructor `FileWriter(String fileName, boolean
append)` untuk menentukan sama ada untuk menambah ke file yang asal
ataupun tidak. Letak `true` pada parameter `boolean append` untuk
menambah pada file yang asal:

```java
package essential;

import java.io.FileWriter;
import java.io.IOException;

public class OutputKeFile {
    public static void main(String[] args) throws IOException {
        String cikgu = "Cikgu suka main bola, hari-hari cikgu main bola";

        FileWriter writer = null;

        try {
            writer = new FileWriter("dingdong.txt", true);
            writer.write(cikgu + "\r\n");
            writer.write(cikgu);
        } finally {
            writer.close();
        }
    }
}
```

Program akan sentiasa menambah string tersebut ke dalam file setiap kali
kita run code tersebut.

## BufferedWriter

BufferedWriter boleh digunakan untuk menjadikan program lebih efisyen.
BufferedWriter digunakan untuk membantu FileWriter:

```java
package essential;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class OutputKeFile {
    public static void main(String[] args) throws IOException {
        String cikgu = "Cikgu suka main bola, hari-hari cikgu main bola";

        BufferedWriter writer = null;

        try {
            writer = new BufferedWriter(new FileWriter("dingdong.txt"));
            writer.write(cikgu);
            writer.newLine();
            writer.write(cikgu, 11, 9);  // offset 11 huruf, ambil 9 huruf
        } finally {
            writer.close();
        }
    }
}
```

Kita boleh menggunakan method `newLine()` untuk membuat baris baru. Kita juga
boleh menetapkan hanya sebahagian daripada string untuk keluar sebagai output.
Rujuk [BufferedWriter#write(String,int,int)][BufferedWriter docs] untuk maklumat
lanjut.

[BufferedWriter docs]: https://docs.oracle.com/javase/7/docs/api/java/io/BufferedWriter.html#write(java.lang.String,%20int,%20int)

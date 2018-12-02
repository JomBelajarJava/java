---
date: 2015-07-04
description: Kita kembali kepada Exception untuk lihat satu cara yang lebih mudah jika melibatkan input dan output. Cara tersebut adalah dengan try-with-resources.
---

# Exception (part 2)

Semasa membuat input/output, kita mesti membuat _exception handling_.
Jika perasan, semua class yang terlibat dengan input/output perlu
ditutup selepas digunakan. Contohnya menggunakan method `close()`
seperti berikut:

```java
package essential;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class InputDariFile {

    public static void main(String[] args) throws IOException {

        BufferedReader reader =null;

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

Bagi mengelakkan programmer lupa untuk menutup semula class tersebut,
Java menyediakan satu lagi jenis _exception handling_ iaitu
`try-with-resources`.

## try-with-resources

Dalam `try-with-resources`, class yang digunakan untuk input/output
diletakkan di dalam kurungan selepas `try`:

```java
package essential;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class InputDariFile {
    public static void main(String[] args) {
        try (BufferedReader reader = new BufferedReader(new FileReader("cubaan.txt"))) {

            String input;

            while ((input = reader.readLine()) != null) {
                System.out.println(input);
            }
        } catch (IOException ex) {
            Logger.getLogger(InputDariFile.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
```

Jadi, Java akan tutup secara automatik class BufferedReader selepas
digunakan walaupun kita tidak meletakkan method `close()`.

Keyword `catch`, `finally`, dan `throws` masih boleh digunakan seperti
biasa.

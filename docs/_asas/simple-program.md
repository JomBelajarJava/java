---
date: 2015-06-26
description: 1000 langkah bermula dari satu langkah pertama. Lihat cara untuk membuat program pertama anda menggunakan Java, iaitu program Hello World!.
---

# Simple Program

> "1000 langkah bermula dari satu langkah pertama"

Kita akan mula programming dengan membuat program yang sangat simple,
iaitu memaparkan perkataan "Hello, World!".

Buka text editor (Notepad/Vim/Emacs), kemudian tulis code
berikut:

```java
public class HelloWorld {
  public static void main(String[] args) {
    System.out.println("Hello, World!");
  }
}
```

dan save sebagai `HelloWorld.java`.

## Compile

Compile ialah proses untuk menukar code kita kepada bahasa yang difahami
oleh komputer. Untuk compile code Java, buka command line interface
(command prompt untuk Windows, terminal untuk Linux), dan tulis:

```
javac C:\Users\NamaAnda\Desktop\FolderAnda\HelloWorld.java
```

Path tersebut bergantung kepada di mana anda save HelloWorld.java di
komputer anda.

Selepas compile, akan ada file `HelloWorld.class` di dalam folder yang
sama untuk `HelloWorld.java`, yang bermaksud anda telah berjaya compile
program tersebut.

## Execute

Setelah berjaya compile, kita sudah boleh execute program HelloWorld,
dengan cara tulis seperti di bawah di command line interface.

```
java C:\Users\NamaAnda\Desktop\FolderAnda\HelloWorld
```

dan kita akan nampak teks "Hello, World!" pada command line interface.

Perhatikan untuk execute, kita hanya tulis ‘java’ tanpa huruf c, berbeza
dengan compile, iaitu `javac`.

Tahniah! Anda telah berjaya menulis, compile, dan execute program
pertama anda.

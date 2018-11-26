# JDBC

*JDBC* ialah _interface_ yang kita boleh guna untuk menyambungkan aplikasi Java
dengan database. Benda yang diperlukan untuk membuat connection JDBC ialah url,
nama dan password untuk database tersebut.

Contoh url untuk database H2 ialah seperti,

```
jdbc:h2:~/tempat/letak/db
```

Contoh untuk Windows,

```
jdbc:h2:C:/tempat/letak/db
```

Contoh menggunakan database client/server,

```
jdbc:mysql://websitesaya.com:9001/nama_database
```

## Setup projek

Kita akan membuat projek menggunakan Maven. Di sini, saya menggunakan IDE
IntelliJ Community Edition (Free). Jadi, buka IntelliJ. Kemudian, klik `Create
New Project`. Di sebelah kiri, pilih `Maven` dan klik `Next`.

`GroupId` ialah nama package untuk menentukan bahawa projek tersebut ialah milik
kita, biasanya kita letak mengikut nama domain. Jika anda tidak memiliki domain,
suka hati anda nak letak apa. Jadi, saya akan letak `com.jombelajarjava` sebagai
`GroupId`. `ArtifactId` pula ialah nama package untuk projek kita. Jadi, saya
akan letakkan `tutorialh2`. Setelah selesai, klik `Next`.

Di skrin berikutnya, tentukan di mana anda ingin letak folder untuk projek anda.
Kemudian, klik `Finish`.

Setelah selesai, IntelliJ akan membina projek Maven dan anda akan nampak file
XML seperti ini,

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.jombelajarjava</groupId>
    <artifactId>lalala</artifactId>
    <version>1.0-SNAPSHOT</version>


</project>
```

File ini bernama `pom.xml`. File inilah tempat untuk kita menentukan config untuk projek Maven.

Untuk menambah library database H2, tambah config ini di `pom.xml`:

```xml
<dependencies>
    <dependency>
        <groupId>com.h2database</groupId>
        <artifactId>h2</artifactId>
        <version>1.4.196</version>
    </dependency>
</dependencies>
```

File `pom.xml` kemudiannya akan kelihatan seperti ini:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.jombelajarjava</groupId>
    <artifactId>tutorialh2</artifactId>
    <version>1.0-SNAPSHOT</version>

    <dependencies>
        <dependency>
            <groupId>com.h2database</groupId>
            <artifactId>h2</artifactId>
            <version>1.4.196</version>
        </dependency>
    </dependencies>

</project>
```

Anda boleh check version library tersebut di
[Maven Central](https://search.maven.org).

Jika anda menggunakan IntelliJ, IntelliJ akan tanya sama ada anda ingin download
library H2 tersebut.

## Class Main

Code Java untuk projek Maven kebiasaannya diletakkan di dalam folder
`src/main/java`. Jadi, right click folder tersebut, kemudian `New` dan klik
`Java Class`. Letakkan nama class termasuk nama package, contoh yang saya akan
guna, `com.jombelajarjava.H2Application`.

Class `H2Application` kita jadikan sebagai class untuk aplikasi. Di sini kita
akan letakkan config untuk database. Kita juga akan meletakkan code untuk mula
membina database dalam method `init()`. Oleh itu, class `H2Application` pada
awalnya akan kelihatan seperti ini:

```java
package com.jombelajarjava;

class H2Application {
    private static final String DATABASE_URL = "jdbc:h2:~/tutorialh2/db";
    private static final String NAME = "root";
    private static final String PASSWORD = "root";

    H2Application() {
        init();
    }

    private void init() {

    }
}
```

Perhatian, dalam situasi sebenar, elakkan meletakkan nama dan password dalam
code. Biasanya kita perlu dapatkan maklumat tersebut daripada _environment
variable_ ataupun file yang berasingan supaya lebih selamat.

Selepas ini, dalam folder yang sama, create class `Main` untuk kita letakkan
`main()` method untuk run aplikasi tersebut. Class `Main` akan menjadi seperti
ini,

```java
package com.jombelajarjava;

public class Main {
    public static void main(String[] args) {
        H2Application app = new H2Application();
    }
}
```

## Menggunakan database

Untuk menggunakan database daripada aplikasi Java, kita perlu membuat dua
langkah ini:

1. Membuat connection ke database.
2. Menjalankan code SQL.

Untuk membuat connection, kita boleh menggunakan class `DriverManager`. Sebagai
contoh, kita akan buat dalam method `init()` yang sedia ada, seperti ini:

```java
private void init() {
    Connection conn;
    try {
        conn = DriverManager.getConnection(DATABASE_URL, NAME, PASSWORD);
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
```

Selepas selesai dengan panggilan database, kita perlu menutup semula connection
tersebut dengan menggunakan method `close()`.

Untuk menjalankan code SQL daripada connection tersebut, kita boleh menggunakan
method `createStatement()` atau `prepareStatement()`. Daripada statement
tersebut kita boleh jalankan code SQL menggunakan method `executeUpdate()` atau
`executeQuery()`. Contoh:

```java
private void init() {
    Connection conn;
    Statement stmt;
    try {
        conn = DriverManager.getConnection(DATABASE_URL, NAME, PASSWORD);
        stmt = conn.createStatement();
        stmt.executeUpdate(
            "CREATE TABLE IF NOT EXISTS KUCING (" +
                "ID IDENTITY, " +
                "NAMA VARCHAR(100) NOT NULL, " +
                "JANTINA ENUM('jantan', 'betina'), " +
                "TARIKH_LAHIR DATE NOT NULL" +
            ")");
        stmt.close();
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
```

Statement juga sama seperti Connection, perlu ditutup menggunakan method
`close()` setelah digunakan.

## try-with-resources

Jika kita lihat code tersebut agak menyusahkan kerana perlu `close()` setiap
masa. Jika anda masih ingat, dalam tutorial
[Exception](../essentials/exception-part-2.md) lepas kita ada belajar
`try-with-resources`. Jadi, kita akan menggunakannya di sini. Code terbaru
kemudiannya akan menjadi seperti ini:

```java
private void init() {
    try (Connection conn = DriverManager.getConnection(DATABASE_URL, NAME, PASSWORD);
         Statement stmt = conn.createStatement()) {
        stmt.executeUpdate(
            "CREATE TABLE IF NOT EXISTS KUCING (" +
                "ID IDENTITY, " +
                "NAMA VARCHAR(100) NOT NULL, " +
                "JANTINA ENUM('jantan', 'betina'), " +
                "TARIKH_LAHIR DATE NOT NULL" +
            ")");
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
```

Jika anda menggunakan IntelliJ, IntelliJ akan complain kerana
`try-with-resources` ialah feature Java 7 dan ke atas. Untuk selesaikannya,
tekan `Alt+Enter` kemudian pilih `Set language level to 7`. IntelliJ akan
menambah config pada `pom.xml` secara automatik. Anda boleh nampak config baru
dalam file `pom.xml`, iaitu

```xml
<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <configuration>
                <source>1.7</source>
                <target>1.7</target>
            </configuration>
        </plugin>
    </plugins>
</build>
```

Sekarang barulah kita boleh run aplikasi kita.

## Run code

Semasa development, kita boleh saja terus run menggunakan IntelliJ tanpa
menggunakan Maven. Jadi kita run seperti biasa, klik kanan pada class `Main`
kemudian klik `Run 'Main.main()'`. Setelah selesai, H2 akan create table
`KUCING`.

## H2 Console

Antara feature yang saya suka pada H2 ialah H2 Console. Jika anda pernah
menggunakan database seperti MySQL, anda mungkin perlu setup phpMyAdmin untuk
melihat kandungan database tersebut di browser.

Dengan H2, kita hanya perlu run library JAR H2 untuk mendapatkan fungsi yang
sama. Jadi, cari file JAR yang di download oleh Maven. Di komputer saya (Linux),
lokasi tersebut ialah

```
~/.m2/repository/com/h2database/h2/1.4.196
```

Setelah `cd` ke lokasi tersebut, kita boleh run H2 Console menggunakan command

```
java -jar h2-1.4.196.jar
```

Browser akan automatik terbuka dengan GUI ke database H2. Masukkan URL, nama,
dan password yang sama untuk lihat kandungan database kita dan anda akan dapat
lihat kita ada table `KUCING` yang kita create sebelum ini.

Anda boleh lihat di
[sini](http://www.h2database.com/html/tutorial.html#tutorial_starting_h2_console)
cara untuk buka H2 Console jika anda menggunakan Windows.

# Migration

_Migration_ bermaksud penghijrahan, sama ada secara perbuatan atau rohani. Dari segi rohani, hijrah boleh bermaksud berubah daripada jahat kepada baik, atau daripada baik kepada lebih baik. Kata kunci yang perlu difokus ialah 'berubah'.

Untuk database, migration bermaksud mengubah bentuk database kepada bentuk yang lain. Kadang kala kita perlu membuat database migration mungkin atas sebab kesilapan, atau mungkin atas sebab untuk menambah baik aplikasi.

Sebelum ini, operasi database yang kita gunakan untuk membuat table ada di dalam method `init()`. Sekarang kita akan asingkan operasi tersebut ke tempat yang khas untuk database migration.

## Flyway

Dalam Java, ada beberapa library untuk membuat database migration, antaranya [Liquibase](http://www.liquibase.org) dan [Flyway](https://flywaydb.org). Flyway lebih mudah untuk setup, manakala Liquibase lebih sesuai untuk team yang ramai. Untuk tutorial ini, kita akan menggunakan Flyway.

## Setup

Database migration hanya dilakukan untuk mengubah database sahaja. Setelah selesai, proses tersebut tidak perlu lagi berlaku semasa ingin menjalankan aplikasi.

Oleh itu, untuk menambah Flyway ke aplikasi, kita tambah library Flyway sebagai plugin, bukannya dependency:

```xml
<plugin>
    <groupId>org.flywaydb</groupId>
    <artifactId>flyway-maven-plugin</artifactId>
    <version>4.2.0</version>
</plugin>
```

Database migration perlu membuat sambungan ke database untuk membuat operasi database. Sama seperti sebelum ini, untuk membuat sambungan ke database, kita perlu memberi url database, nama dan password:

```xml
<plugin>
    <groupId>org.flywaydb</groupId>
    <artifactId>flyway-maven-plugin</artifactId>
    <version>4.2.0</version>
    <configuration>
        <url>jdbc:h2:./db</url>
        <user>root</user>
        <password>root</password>
    </configuration>
</plugin>
```

Anda boleh lihat cara lain di [sini](https://flywaydb.org/documentation/maven/).

## File migration

Semasa melakukan migration, Flyway akan membaca query daripada file. File tersebut secara default perlu diletakkan di `src/main/resources/db/migration/`.

Nama file tersebut adalah seperti ini:

```
V1__tajuk_migration.sql
```

Bermula dengan huruf `V`, kemudian angka untuk version, kemudian *DUA* underscore, dan diakhiri dengan tajuk untuk migration tersebut.

Contoh yang kita akan buat,

```
V1__init.sql
```

Init bermaksud permulaan.

Kandungannya adalah sama seperti operasi database dalam method `init()`:

```sql
CREATE TABLE IF NOT EXISTS KUCING (
  ID IDENTITY,
  NAMA VARCHAR(100) NOT NULL,
  JANTINA ENUM('jantan', 'betina'),
  TARIKH_LAHIR DATE NOT NULL
)
```

Setelah selesai, anda boleh padam terus method `init()` kerana tidak perlu digunakan lagi.

## Migrate

Oleh sebab kita menggunakan Maven, untuk menjalankan migration kita boleh menggunakan command:

```
mvn flyway:migrate
```

Setelah selesai, semua operasi database dalam file `V1` sepatutnya sudah berjaya. Anda boleh melihat sendiri kandungan database anda.

## Schema version

Maklumat mengenai database migration akan diletakkan dalam table `schema_version`. Anda boleh lihat kandungan table tersebut untuk melihat database anda sedang berada dalam version berapa.

## Alter table

Sekarang kita akan saja-saja update table Kucing untuk melihat kegunaan sebenar database migration.

Katakanlah untuk enum `Jantina`, kita tidak mahu enum tersebut menggunakan huruf kecil kerana menyusahkan dan tidak selari dengan enum Java. Oleh itu, kita perlu mengubah table Kucing.

Untuk mengubah table Kucing, kita boleh menggunakan operasi `ALTER TABLE`. Jadi, create file dengan nama `V2__uppercase_enum_jantina.sql` dengan kandungan seperti berikut:

```sql
ALTER TABLE KUCING
  ALTER COLUMN JANTINA ENUM('JANTAN', 'BETINA')
```

Kemudian, jalankan migration menggunakan command `mvn flyway:migrate`.

Setelah selesai, bolehlah kita update code Java untuk enum Jantina seperti berikut:

```java
public enum Jantina {
    JANTAN, BETINA;

    public static Jantina fromChar(final char firstChar) {
        for (Jantina jantina : Jantina.values()) {
            if (String.valueOf(jantina.toString().charAt(0)).equalsIgnoreCase(String.valueOf(firstChar))) {
                return jantina;
            }
        }
        return null;
    }

    public static Jantina fromString(final String text) {
        return Jantina.valueOf(text.toUpperCase(Locale.ENGLISH));
    }
}
```

Sekarang code tersebut lebih pendek berbanding sebelum ini.

Anda boleh melihat code yang lengkap di [sini](https://github.com/JomBelajarJava/contoh-code-java/tree/master/database/tutorialh2-flyway).

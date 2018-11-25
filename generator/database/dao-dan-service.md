# DAO dan Service

Sebelum kita tulis lebih banyak SQL query, kita akan lihat bagaimana untuk
menyusun code kita dengan lebih teratur. Cara ini memang biasa digunakan dalam
industri.

## Data Access Object (DAO)

DAO ialah class yang kita boleh gunakan untuk membuat operasi melibatkan
database. Class ini akan memisahkan code aplikasi dengan code database, jadi
apabila kita ingin membuat operasi database, kita hanya perlu memanggil method
yang ada dalam DAO.

Kelebihan menggunakan class DAO ialah kita boleh mengubah code database tanpa
perlu menyentuh code aplikasi. Contoh apabila kita mahu tukar dari H2 ke
[PostgreSQL](https://www.postgresql.org), atau dari hanya JDBC ke
[jOOQ](https://www.jooq.org).

## Service

Service pula ialah class untuk kita letakkan lojik bisnes (_business logic_),
maksudnya mana-mana code yang kita perlu tulis untuk menentukan apa yang patut
berlaku dengan data, proses apa yang perlu digunakan, dan sebagainya. Disebabkan
aplikasi yang kita akan buat agak simple, lojik bisnes yang kita akan buat
hanyalah untuk menggunakan method dari class DAO.

## Model

Kita boleh menyusun data dari setiap table dalam database menggunakan class.
Class ini disebut sebagai _model layer_. Dalam tutorial sebelum ini, kita ada
membuat table bernama Kucing yang mempunyai id, nama, jantina, dan tarikh lahir.
Jadi, kita boleh menyusun semua data tersebut dalam sebuah class bernama Kucing.
Di sini saya letakkan class tersebut di dalam package
`com.jombelajarjava.kucing`.

Class tersebut akan kelihatan seperti ini:

```java
package com.jombelajarjava.kucing;

import java.time.LocalDate;

public class Kucing {

    private final Long id;
    private final String nama;
    private final Jantina jantina;
    private final LocalDate tarikhLahir;

    public Kucing(final String nama, final Jantina jantina, final LocalDate tarikhLahir) {
        this(0L, nama, jantina, tarikhLahir);
    }

    public Kucing(final Long id, final String nama, final Jantina jantina, final LocalDate tarikhLahir) {
        this.id = id;
        this.nama = nama;
        this.jantina = jantina;
        this.tarikhLahir = tarikhLahir;
    }

    public Kucing cloneWithId(final Long id) {
        return new Kucing(id, nama, jantina, tarikhLahir);
    }

    public Long getId() {
        return id;
    }

    public String getNama() {
        return nama;
    }

    public Jantina getJantina() {
        return jantina;
    }

    public LocalDate getTarikhLahir() {
        return tarikhLahir;
    }

}
```

Jika anda menggunakan IDE, IDE akan complain mengenai `LocalDate` kerana package
`java.time` adalah daripada Java 8. Jadi, kita update sahaja `pom.xml` untuk
menggunakan Java 8, seperti ini,

```xml
<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <configuration>
                <source>1.8</source>
                <target>1.8</target>
            </configuration>
        </plugin>
    </plugins>
</build>
```

## Enum

Jika anda perasan, dalam class `Kucing` ada jenis data bernama `Jantina`. Kita
boleh membuat jenis data rekaan sendiri menggunakan `enum`. Untuk membuat enum,
tulis sahaja seperti ini,

```java
package com.jombelajarjava.kucing;

import java.util.Locale;

public enum Jantina {
    JANTAN, BETINA
}
```

Walaupun enum di atas nampak ok, tetapi jika kita lihat kembali dalam database,
enum untuk Jantina menggunakan huruf kecil. Jadi kita perlu mengubahsuai enum
tersebut supaya menggunakan huruf kecil apabila di-print.

```java
package com.jombelajarjava.kucing;

import java.util.Locale;

public enum Jantina {
    JANTAN("jantan"), BETINA("betina");

    private final String text;

    Jantina(final String text) {
        this.text = text;
    }

    @Override
    public String toString() {
        return text;
    }
}
```

## Interface KucingDAO

Sebelum kita menulis DAO untuk akses database, kita akan membuat interface
terlebih dahulu untuk merancang apa yang perlu ada pada class DAO nanti. Dengan
membuat interface, kita juga boleh memberitahu programmer lain dalam team (jika
ada) method yang akan ada dalam class DAO nanti tanpa perlu menunggu kita
menyiapkan class DAO tersebut.

Interface DAO untuk Kucing kelihatan seperti ini:

```java
package com.jombelajarjava.kucing;

import java.util.List;

public interface KucingDao {
    List<Kucing> findAll();
    List<Kucing> findById(Long id);
    List<Kucing> findByNama(String nama);
    Kucing insertKucing(Kucing kucing);
    Kucing updateKucing(Kucing kucing);
    boolean deleteKucing(Kucing kucing);
}
```

Perhatikan jenis data yang return daripada method `insert`, `update`, dan
`delete`. Ada sesetengah orang lebih suka hanya return `int`, ada yang hanya
return `void`. Semua boleh. Di sini saya return balik object untuk `insert` dan
`update`, dan boolean untuk check jika telah berjaya `delete`.

## Class SimpleKucingDAO

Sekarang kita boleh _implement_ interface KucingDao. Jika anda menggunakan IDE,
selepas menulis

```java
public class SimpleKucingDao implements KucingDao {
    
}
```

IDE boleh terus tambah method daripada KucingDao secara automatik. Contoh dalam
IntelliJ, boleh tekan `Alt+Enter`. Kemudian tambah constructor untuk mengambil
data yang diperlukan untuk membuat sambungan ke database.

```java
package com.jombelajarjava.kucing;

import java.sql.*;
import java.util.List;

public class SimpleKucingDao implements KucingDao {

    private final String url;
    private final String name;
    private final String password;

    public SimpleKucingDao(final String url, final String name, final String password) {
        this.url = url;
        this.name = name;
        this.password = password;
    }

    @Override
    public List<Kucing> findAll() {
        return null;
    }

    @Override
    public List<Kucing> findById(final Long id) {
        return null;
    }

    @Override
    public List<Kucing> findByNama(final String nama) {
        return null;
    }

    @Override
    public Kucing insertKucing(final Kucing kucing) {
          return null;
    }

    @Override
    public Kucing updateKucing(final Kucing kucing) {
        return null;
    }

    @Override
    public boolean deleteKucing(final Kucing kucing) {
        return false;
    }
}
```

Jika anda lihat di industri, kadang kala class DAO dinamakan sebagai
`KucingDaoImpl` atau `IKucingDao`. Isu ini pun ada perbincangan dan debat,
masing-masing mempunyai pandangan dan hujah masing-masing. Ada yang suka, ada
yang tak suka.

Secara peribadi, saya tak suka sebab bila lihat standard library Java, tidak ada
satu pun class yang menggunakan `Impl`.Kalau ada satu class sahaja yang
implement interface DAO tersebut, saya lebih suka menamakannya
`DefaultKucingDao` contohnya. Jadi, tidak ada salah tidak ada betul. Ikut sahaja
apa yang digunakan dalam syarikat.

## Class PendaftaranService

Selepas wujud DAO, kita boleh membuat service untuk memanggil method daripada
DAO tersebut,

```java
package com.jombelajarjava.daftar;

import com.jombelajarjava.kucing.Kucing;
import com.jombelajarjava.kucing.KucingDao;

import java.util.List;

public class PendaftaranService {

    private final KucingDao kucingDAO;

    public PendaftaranService(final KucingDao kucingDAO) {
        this.kucingDAO = kucingDAO;
    }

    public List<Kucing> searchAll() {
        return kucingDAO.findAll();
    }

    public List<Kucing> searchById(final Long id) {
        return kucingDAO.findById(id);
    }

    public List<Kucing> searchByNama(final String nama) {
        return kucingDAO.findByNama(nama);
    }

    public Kucing add(final Kucing kucing) {
        return kucingDAO.insertKucing(kucing);
    }

    public Kucing edit(final Kucing kucing) {
        return kucingDAO.updateKucing(kucing);
    }

    public boolean remove(final Kucing kucing) {
        return kucingDAO.deleteKucing(kucing);
    }
}
```

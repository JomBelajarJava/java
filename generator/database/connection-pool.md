---
date: 2017-09-27
description: Tutorial Java untuk membuat connection pool menggunakan library HikariCP untuk menjadikan aplikasi lebih efisyen
---

# Connection Pool

_Pool_ dalam English bermaksud 'kolam'. Biasanya orang menyimpan ikan yang ditangkap ke dalam kolam untuk diguna/dimakan di kemudian hari. Jadi, _connection pool_ bermaksud 'kolam connection database', supaya kita boleh menggunakan connection yang sudah disambung untuk membuat operasi database berkali-kali.

Penyambungan ke database yang kita buat sebelum ini sebenarnya kurang efisyen terutamanya untuk aplikasi yang berjalan lama seperti web kerana kita perlu membuat penyambungan ke database semula tiap kali kita melakukan operasi database.

## HikariCP

Kita boleh menulis sendiri code untuk membuat connection pool, tapi tak perlulah. Kita guna saja library yang telah banyak membuat research untuk menjadikan connection pool lebih efisyen. Saya perkenalkan, [HikariCP](https://github.com/brettwooldridge/HikariCP).

HikariCP digunakan secara _default_ jika anda menggunakan _web framework_ seperti [Spring Boot](https://projects.spring.io/spring-boot), [Play Framework](https://www.playframework.com) atau [Luminus](http://www.luminusweb.net).

## Setup

HikariCP ialah library Java, jadi kita tambah sahaja di file `pom.xml`:

```xml
<dependency>
    <groupId>com.zaxxer</groupId>
    <artifactId>HikariCP</artifactId>
    <version>2.6.2</version>
</dependency>
```

Untuk membuat sambungan ke database menggunakan HikariCP, tambah code berikut di constructor H2Application:

```java
HikariConfig config = new HikariConfig();
config.setJdbcUrl(DATABASE_URL);
config.setUsername(NAME);
config.setPassword(PASSWORD);
```

Tambah field untuk `DataSource`:

```java
private final DataSource dataSource;
```

dan initialize field tersebut menggunakan config yang telah dibuat:

```java
dataSource = new HikariDataSource(config);
```

## getConnection()

Untuk membuat operasi database, kita boleh menggunakan method `getConnection()` daripada `DataSource`.

Sebagai contoh, sebelum ini di dalam method `init()`, kita menggunakan `DriverManager` untuk mendapatkan `Connection`. Jadi, ganti sahaja code

```java
DriverManager.getConnection(DATABASE_URL, NAME, PASSWORD)
```

ke

```java
dataSource.getConnection()
```

## Update DAO

Untuk menggunakan `DataSource` yang sama, hantar sahaja field tersebut melalui constructor untuk DAO.

Tukar constructor SimpleKucingDao daripada

```java
public SimpleKucingDao(final String url, final String name, final String password) {
    this.url = url;
    this.name = name;
    this.password = password;
}
```

ke

```java
public SimpleKucingDao(final DataSource dataSource) {
    this.dataSource = dataSource;
}
```

Kemudian hantar `dataSource` sebagai argument di constructor H2Application:

```java
pendaftaranService = new PendaftaranService(new SimpleKucingDao(dataSource));
```

Setelah selesai, bolehlah ganti semua code yang menggunakan `DriverManager` ke `DataSource`.

Code yang lengkap boleh dilihat di [sini](https://github.com/JomBelajarJava/contoh-code-java/tree/master/database/tutorialh2-hikaricp).

---
date: 2018-01-02
description: Tutorial untuk membuat inversion of control. Memperkenalkan dependency injection framework seperti Guice untuk memudahkan dependency injection.
---

# Dependency Injection

Dalam tutorial database, saya ada sentuh sedikit mengenai `dependency
injection`. Maksud `dependency injection` memang susah sikit nak terangkan tanpa
contoh.

Jadi sebelum mula tutorial ini, sila lihat code di
[sini](https://github.com/JomBelajarJava/contoh-code-java/tree/master/codequality/tutorialguice-sebelum)
terlebih dahulu.

Dalam code tersebut, kita ada dua servis (atau module), servis untuk User dan
servis untuk Greeting. Dalam _implementation_, servis Greeting memerlukan servis
User. Maksudnya servis User adalah *dependency* kepada servis Greeting. Apabila
kita memberi servis User kepada servis Greeting menggunakan keyword **new**, itu
dinamakan sebagai *dependency injection*.

## Inversion of control

Dalam code tersebut, saya memberi class servis User kepada servis Greeting dalam
file
[Main.java](https://github.com/JomBelajarJava/contoh-code-java/blob/master/codequality/tutorialguice-sebelum/src/main/java/Main.java).
Ini pula dinamakan `inversion of control`. Maksudnya cara saya memberi
_dependency_ bukannya terletak dalam constructor servis Greeting, tetapi di
tempat lain.

## Dependency injection framework

Kalau anda lihat kembali code untuk membuat `dependency injection`, barangkali
anda terfikir bagaimana jika sesuatu servis memerlukan terlalu banyak servis lain.
Code tersebut nanti mungkin akan menjadi terlampau panjang dan serabut.

Ya, dalam situasi sebenar memang akan ada servis yang bergantung kepada banyak
servis lain. Untuk menyelesaikan masalah ini, kita boleh menggunakan `dependency
injection framework`.

Antara dependency injection framework ialah
[Guice](https://github.com/google/guice),
[Dagger](https://github.com/google/dagger), dan
[Spring](https://github.com/spring-projects/spring-framework). Untuk tutorial
ini, kita akan menggunakan Guice sebagai contoh.

## Google Guice

Google Guice hanyalah sebuah library, jadi kita tambah sahaja library tersebut.
Jika menggunakan Maven, tambah ini ke file `pom.xml`:

```xml
<dependency>
    <groupId>com.google.inject</groupId>
    <artifactId>guice</artifactId>
    <version>4.1.0</version>
</dependency>
```

Dengan menggunakan Guice, kita boleh membahagikan setiap servis sebagai module.
Untuk membuat module menggunakan Guice, buat satu class dan _extends_ class
tersebut dengan `AbstractModule`. Contoh untuk `UserModule`:

```java
public class UserModule extends AbstractModule {
    @Override
    protected void configure() {

    }
}
```

Dalam method `configure()`, kita boleh letak bagaimana rupa _dependency_ untuk
module tersebut. Contoh:

```java
public class UserModule extends AbstractModule {
    @Override
    protected void configure() {
        bind(UserService.class).to(UserServiceImpl.class);
        bind(UserLocaleRepository.class).to(UserLocaleRepositoryImpl.class);
    }
}
```

Di sini bermaksud, apabila program jumpa interface `UserService`, program itu
perlu memberi class `UserServiceImpl`. Apabile jumpa interface
`UserLocaleRepository`, program itu perlu memberi `UserLocaleRepositoryImpl`.

Setelah selesai dengan module, pergi ke class yang memerlukan _dependency_ iaitu
`UserServiceImpl`. Kemudian tambah _annotation_ `@Inject` di atas _constructor_.
Contoh:

```java
@Inject
public UserServiceImpl(final UserLocaleRepository userLocaleRepository) {
    this.userLocaleRepository = userLocaleRepository;
}
```

Apabila ditambah `@Inject`, class tersebut akan memberitahu Guice bahawa dia
memerlukan Guice untuk inject _dependency_ yang ada di parameter _constructor_
tersebut. Kemudian Guice pun akan mencari `dependency` yang diperlukan daripada
module.

Setelah selesai dengan `UserModule`, buat benda yang sama dengan `GreetingModule`.

Setelah selesai, kita boleh tukar code di `Main.java`.

Untuk menggunakan servis dengan Guice, kita boleh menggunakan method
`createInjector()` kemudian sertakan module-module yang kita perlukan. Sebagai
contoh:

```java
final Injector injector = Guice.createInjector(new UserModule(), new GreetingModule());
```

Untuk mendapatkan servis, gunakan method `getInstance()` daripada injector
seperti berikut:

```java
final GreetingService greetingService = injector.getInstance(GreetingService.class);
```

Anda boleh lihat code yang pernuh di
[sini](https://github.com/JomBelajarJava/contoh-code-java/tree/master/codequality/tutorialguice-selepas).

Sebagai latihan, anda boleh _refactor_ (menukar) code untuk tutorial database
menggunakan `dependency injection framework`. Satu benda yang saya tidak sentuh
di sini ialah `provider`. Anda boleh menggunakan `provider` untuk database
connection. Rujuk documentation cara untuk menggunakan `provider`.

## Dagger

Jika anda ingin menggunakan `dependency injection framework` untuk aplikasi
Android, anda boleh menggunakan Dagger.

## Spring

Bagi yang rajin mengambil tahu tentang Java pasti ada terdengar atau terbaca
mengenai Spring. Spring pada mulanya hanyalah `dependency injection framework`
tetapi makin lama makin berkembang ke `web application framework`.

Jika anda menggunakan [Spring
Boot](https://github.com/spring-projects/spring-boot), anda tidak perlu pun menulis module atau injector seperti Guice. Semuanya
hanya menggunakan _annotation_.

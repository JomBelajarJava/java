---
date: 2017-07-22
description: CRUD ialah akronim untuk Create, Read, Update dan Delete. Keempat-empat operasi tersebut ialah operasi yang biasa digunakan dengan database.
---

# CRUD

CRUD ialah akronim (_acronym_) untuk `Create`, `Read`, `Update` dan `Delete`.
Keempat-empat operasi tersebut ialah operasi yang biasa digunakan dengan
database.

- Create - mencipta/membuat/memasukkan data
- Read - membaca/mengambil data
- Update - mengolah/mengemaskini data
- Delete - membuang/memadam data

Jadi setiap kali membuat project yang melibatkan database, anda boleh terus
sahaja menyediakan keempat-empat operasi tersebut.

## CRUD dalam KucingDao

Berbalik ke aplikasi kita sebelum ini, operasi CRUD kita adalah seperti berikut:

| Operasi | Method dalam KucingDao              |
| ------- | ----------------------------------- |
| Create  | insertKucing()                      |
| Read    | findAll(), findById(), findByNama() |
| Update  | updateKucing()                      |
| Delete  | deleteKucing()                      |

## Insert

Saya akan membuat contoh untuk membuat operasi `Insert` dalam SimpleKucingDao.
Caranya sama sahaja seperti membuat table, tetapi kita perlu menjadikan SQL
query tersebut boleh mengambil data daripada code Java. Caranya adalah dengan
menggunakan `PreparedStatement`:

```java
    @Override
    public Kucing insertKucing(final Kucing kucing) {
        final String insertQuery = "INSERT INTO KUCING(NAMA, JANTINA, TARIKH_LAHIR) VALUES(?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(url, name, password);
             PreparedStatement stmt = conn.prepareStatement(insertQuery)) {
            stmt.setString(1, kucing.getNama());
            stmt.setString(2, kucing.getJantina().toString());
            stmt.setDate(3, Date.valueOf(kucing.getTarikhLahir()));

            stmt.executeUpdate();

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    final Long id = generatedKeys.getLong(1);
                    return kucing.cloneWithId(id);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return kucing;
    }
```

Letakkan tanda soal, `?`, dalam SQL query sebagai tempat untuk kita masukkan
data. Untuk mendapatkan `PreparedStatement`, gunakan method `prepareStatement()`
dari `Connection`.

Kemudian, untuk memasukkan data kita gunakan pelbagai method set yang ada
mengikut jenis data tersebut. Contoh,

```java
stmt.setString(1, kucing.getNama());
```

bermaksud masukkan nama kucing di tempat (tanda soal) pertama.

Dengan menggunakan JDBC, kita boleh mendapatkan kembali ID yang terhasil
daripada proses Insert seperti code di atas, iaitu,

```java
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    final Long id = generatedKeys.getLong(1);
                    return kucing.cloneWithId(id);
                }
            }
```

Selepas mendapatkan ID, saya create object Kucing baru dengan data yang sama
tetapi disertakan dengan ID.

> Anda mungkin tertanya-tanya kenapa saya tidak menggunakan method `setId()`
> misalannya. Kalau tengok kembali pada class Kucing, semua fields saya letakkan
> keyword `final`. Keyword `final` akan menjadikan field tersebut tidak boleh
> berubah. Ada sebabnya, tetapi saya akan jelaskan pada tutorial akan datang.

Code untuk operasi CRUD yang lain saya serahkan kepada pembaca sebagai latihan.

## Ambil input

Sekarang kita sudah boleh membuat code aplikasi untuk berinteraksi dengan
pengguna kemudian memasukkan data ke dalam database.

Initialize `PendaftaranService` dan `Scanner` di constructor `H2Application`:

```java
    private final PendaftaranService pendaftaranService;
    private final Scanner scan;

    H2Application() {
        pendaftaranService = new PendaftaranService(new SimpleKucingDao(DATABASE_URL, NAME, PASSWORD));
        scan = new Scanner(System.in);

        init();
    }
```

> Sebenarnya ada cara yang lebih baik berbanding menggunakan `new` untuk
> menggunakan service dan DAO iaitu dengan menggunakan `dependency injection
> framework`, tetapi ini hanya untuk demo penggunaan database. Jadi, kita buat
> dependency injection menggunakan **new** sahaja.

Kita paparkan arahan aplikasi kepada pengguna dalam method `start()`, kemudian
ambil input:

```java
    void start() {
        System.out.print("Selamat Datang ke Pendaftaran Pet Kucing!\n" +
                "\n" +
                "Tekan nombor mengikut senarai di bawah:\n" +
                "1. Daftar kucing.\n" +
                "2. Tukar maklumat kucing.\n" +
                "3. Padam maklumat kucing.\n" +
                "4. Senaraikan semua kucing.\n" +
                "5. Cari kucing mengikut nama.\n" +
                "\n" +
                "Pilihan: ");

        final int nombor = Integer.parseInt(scan.nextLine().trim());

        switch (nombor) {
            case 1:
                daftarKucing();
                break;
            default:
                break;
        }

        scan.close();
    }
```

Method `daftarKucing()`:

```java
    private void daftarKucing() {
        System.out.print("\nMasukkan nama kucing: ");
        final String nama = scan.nextLine().trim();

        System.out.print("Masukkan jantina kucing ([J/j]antan/[B/b]etina): ");
        final char jantina = scan.nextLine().trim().charAt(0);

        System.out.print("Masukkan tarikh lahir (yyyy-mm-dd): ");
        final LocalDate tarikhLahir = LocalDate.parse(scan.nextLine().trim());

        final Kucing kucing = new Kucing(nama, jantina, tarikhLahir);
        final Long id = pendaftaranService.add(kucing).getId();

        System.out.println("\nPendaftaran selesai.\nID kucing anda: " + id);
    }
```

Perhatikan kita hanya mengambil `char` untuk menentukan `Jantina` sedangkan
class Kucing memerlukan data jenis enum. Oleh itu, kita perlu

- mengubahsuai class Kucing untuk menerima `char` sebagai penentu `Jantina`
- mengubahsuai enum `Jantina` untuk memilih enum mengikut `char`

## Enum Jantina dari character

Tambah method `fromChar()` pada enum `Jantina`:

```java
    public static Jantina fromChar(final char firstChar) {
        for (Jantina jantina : Jantina.values()) {
            if (String.valueOf(jantina.text.charAt(0)).equalsIgnoreCase(String.valueOf(firstChar))) {
                return jantina;
            }
        }
        return null;
    }
```

Method tersebut bermaksud untuk setiap nilai enum `Jantina` yang ada, bandingkan
huruf pertama dengan input tidak kira sama ada huruf besar atau kecil, jika sama
pulangkan nilai enum tersebut.

## Overload contructor Class Kucing

Overload constructor untuk class Kucing:

```java
    public Kucing(final String nama, final char jantina, final LocalDate tarikhLahir) {
        this(nama, Jantina.fromChar(jantina), tarikhLahir);
    }
```

## Demo

Setelah selesai semuanya, gunakan method `start()` untuk menjalankan aplikasi:

```java
package com.jombelajarjava;

public class Main {
    public static void main(String[] args) {
        H2Application app = new H2Application();
        app.start();
    }
}
```

Anda boleh ke [sini](https://github.com/JomBelajarJava/contoh-code-java/tree/master/database/tutorialh2-jdbc) untuk lihat code yang lengkap.

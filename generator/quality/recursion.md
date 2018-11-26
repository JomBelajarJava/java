<!-- 26 November 2018 -->
# Recursion

Recursion ialah apabila kita memanggil sesebuah method dalam method yang sama.
Teknik ini antara bahagian yang memeningkan pelajar universiti. Jika anda sama
pening dengan konsep ini semasa di universiti, anda tidak perlu bimbang kerana
recursion sangat jarang digunakan dalam Java.

Recursion tidak digalakkan dalam Java kerana Java tiada *tail call
optimization*. Jika kita melakukan recursion dengan banyak Java akan
mengakibatkan *stackoverflow error*.

Pendek kata, elakkan recursion.

Jika anda masih degil, mari kita lihat contoh recursion:

```java
public class Main {
    private static int jumlahSampaiSeribu(int nombor) {
        if (nombor == 1000) {
            return nombor;
        }

        return nombor + jumlahSampaiSeribu(nombor + 1);
    }

    public static void main(String[] args) {
        int hasil = jumlahSampaiSeribu(1);
        System.out.println(hasil);
    }
}
```

Apa yang berlaku apabila kita memanggil method `tambahSampaiSeribu()` ialah
panggilan-panggilan tersebut menjadi berangkai, hasilnya menjadi,

```java
return 1 + 2 + 3 + 4... + 1000;
```

Semasa memanggil semula method tersebut, maklumat untuk operasi tambah antara
semua angka-angka masih perlu disimpan dalam memory sehinggalah `nombor`
bersamaan dengan 1000, di mana method recursive tidak lagi dipanggil.

Yang menyebabkan *stackoverflow error* itu berpunca daripada semua data untuk
angka, data untuk operasi apa, dan data untuk method return nilai ke mana,
melebihi muatan *stack memory*. Jika anda tidak dapat *stackoverflow error*,
anda boleh tambahkan nilai daripada seribu ke sejuta misalannya.

## Stack vs Heap Memory

*Stack memory* ialah memory yang digunakan untuk meletakkan maklumat mengenai
program kita, contohnya variable dan maklumat untuk method. *Heap memory* pula
ialah memory yang digunakan untuk meletakkan data-data yang dibina semasa
program sedang berjalan, contohnya semasa membuat object menggunakan **new**.

*Stack memory* biasanya berada di cache CPU, dia laju, tetapi saiznya kecil. Itu
sebabnya kita boleh mendapat *stackoverflow error* semasa membuat recursion.
Program perlu menyimpan maklumat mengenai method yang belum selesai dikira.

## Tail call recursion

*Tail call recursion* ialah recursion untuk membuat benda yang sama tetapi
menggunakan cara yang sedikit berbeza. Ini contohnya,

```java
public class Main {
    private static int jumlahSampaiSeribuTailCall(int nombor, int jumlah) {
        if (nombor == 1000) {
            return nombor + jumlah;
        }

        return jumlahSampaiSeribuTailCall(nombor + 1, nombor + jumlah);
    }

    public static void main(String[] args) {
        int hasil = jumlahSampaiSeribuTailCall(1, 0);
        System.out.println(hasil);
    }
}
```

Bezanya adalah kita terus return panggilan untuk recursive method, tidak lagi
berangkai seperti sebelum ini.

Cara ini mungkin boleh mengurangkan risiko *stackoverflow error* kerana *stack
memory* tidak perlu lagi menyimpan maklumat untuk operasi apa yang perlu
dilakukan. Hanya perlu menyimpan maklumat ke mana method tersebut perlu return.
Walaubagaimanapun, *stackoverflow error* masih boleh berlaku dalam Java jika
method recursive terlalu banyak kali dipanggil.

## Tail call optimization

Ada sesetengah programming language yang mempunyai *tail call optimization*.
Apabila kita membuat *tail call recursion*, program akan automatik menukarnya ke
bentuk `goto` (ataupun dipanggil `jump`). Maka, maklumat untuk method return ke
mana tidak perlu disimpan sekaligus mengelakkan berlakunya *stackoverflow
error*.

Malang sekali, Java tiada *tail call optimization*. Antara programming language
yang mempunyai *tail call optimization* ialah Scheme.

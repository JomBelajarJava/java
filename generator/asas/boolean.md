# Boolean

Salah satu jenis data ialah `boolean`. `Boolean` hanya boleh simpan dua
jenis data sahaja iaitu; `true` atau `false`. Jadi, di mana boleh kita
gunakan `boolean` ini?

Cuba ingat kembali kurungan pada `if statement`, `while loop`, dan `do
while loop` di mana kita buat perbandingan antara dua nombor.
Sebenarnya, apabila kita membuat perbandingan, kita telah menghasilkan
`boolean`. Buktinya:

```java
public class TutorialBoolean {
    public static void main(String[] args) {
        boolean b = 5 > 3;
        System.out.println(b);  // akan papar 'true'
    }
}
```

Jadi, variable `boolean` boleh digunakan di dalam kurungan tersebut,
contohnya:

```java
public class TutorialBoolean {
    public static void main(String[] args) {
        int nombor = 4;
        int baki = nombor % 2;
        boolean tiadaBaki = (baki == 0);

        if (tiadaBaki) {
            System.out.println("nombor genap");
        }
    }
}
```

Cara ini biasa digunakan untuk membuatkan code lebih mudah dibaca tanpa
perlu menggunakan `comment`.

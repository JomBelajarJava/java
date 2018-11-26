# Queue

Queue menggunakan kaedah _first in, first out_ (FIFO) yang bermaksud
data yang mula-mula masuk akan keluar dahulu. Sebagai contoh semasa
beratur di kantin, orang yang mula-mula datang yang akan dapat beli
dahulu, siapa yang lambat kena beratur di belakang.

Class yang menggunakan queue antaranya ialah `LinkedList` dan
`PriorityQueue`.

## LinkedList

Contoh untuk membuat queue menggunakan LinkedList:

```java
package datastructure;

import java.util.LinkedList;
import java.util.Queue;

public class ContohQueue {

    public static void main(String[] args) {

        Queue<String> customers = new LinkedList<>();
        customers.offer("pelanggan pertama");
        customers.offer("pelanggan kedua");
        customers.offer("pelanggan ketiga");

        System.out.println("Ambik order " + customers.poll());
        System.out.println("Next!");
        System.out.println("Ambik order " + customers.poll());

        System.out.println("Alamak makanan sudah habis, siapa pelanggaan seterusnya?");
        System.out.println(customers .peek());
        System.out.println(customers.peek() + " sedang menunggu...");
    }
}
```

Method yang digunakan adalah seperti berikut:

-   `offer()` – untuk memasukkan data ke dalam Queue
-   `poll()` – mengeluarkan data untuk digunakan
-   `peek()` – mengakses data tanpa mengeluarkan data tersebut

## PriorityQueue

Walaupun queue secara umumnya menggunakan kaedah FIFO, PriorityQueue
agak berlainan sedikit. Data di dalam PriorityQueue ditentukan
menggunakan _priority_ (keutamaan). Data yang mempunyai keutamaan yang
tinggi akan didahulukan untuk keluar (diproses).

Contoh situasi sewaktu menaiki kapal terbang. Selepas penumpang diberi
kebenaran untuk masuk, pramugari pun minta warga emas yang naik dahulu,
kemudian penumpang yang ada anak kecil, diikuti oleh penumpang-penumpang
yang lain. Jadi, di sini warga emas mempunyai keutamaan (_priority_)
yang lebih tinggi berbanding penumpang yang lain.

Kita akan gunakan class Penumpang untuk dimasukkan ke dalam
PriorityQueue:

```java
package datastructure;

public class Penumpang {

    String jenis;
    int keutamaan;      // nombor besar bermaksud high priority

    public Penumpang(String jenis, int keutamaan) {
        this.jenis = jenis;
        this.keutamaan = keutamaan;
    }
}
```

Bagi menentukan keutamaan sesuatu class, kita boleh menggunakan class
yang menggunakan interface `Comparator<E>`:

```java
package datastructure;

import java.util.Comparator;

public class KeutamaanPenumpang implements Comparator<Penumpang> {

    @Override
    public int compare(Penumpang o1, Penumpang o2) {
        return o2.keutamaan - o1.keutamaan;
    }

}
```

Untuk interface `Comparator`, jika method `compare()` menghasilkan
nombor negatif bermaksud `o1` lebih diutamakan, jika nombor positif
bermaksud `o2` diutamakan, dan jika `return 0` bermaksud sama
priority.

Kita mahu field `keutamaan` di class Penumpang menjadi _high priority_
jika nombor besar dan _low priority_ jika nombor kecil, jadi kita
tentukan priority dengan cara,

```java
o2.keutamaan – o1.keutamaan;
```

Jika diterbalikkan seperti ini,

```java
o1.keutamaan – o2.keutamaan;
```

bermaksud nombor kecil ialah _high priority_, dan nombor besar ialah
_low priority_. Terpulang kepada anda hendak pilih yang mana.

Cara penggunaan PriorityQueue adalah seperti berikut:

```java
package datastructure;

import java.util.PriorityQueue;
import java.util.Queue;

public class ContohQueue {

    public static void main(String[] args) {

        Queue<Penumpang> airport = new PriorityQueue<>(new KeutamaanPenumpang());
        airport.offer(new Penumpang("lelaki dewasa bujang", 1));
        airport.offer(new Penumpang("wanita bujang", 1));
        airport.offer(new Penumpang("warga emas lelaki", 3));
        airport.offer(new Penumpang("pasangan pengantin", 1));
        airport.offer(new Penumpang("warga emas perempuan", 3));
        airport.offer(new Penumpang("ada anak kecil", 2));

        while (!airport.isEmpty()) {
            System.out.println(airport.poll().jenis);
        }
    }
}
```

Hasilnya Penumpang yang mempunyai keutamaan yang lebih tinggi akan
dikeluarkan dahulu.

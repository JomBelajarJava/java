---
date: 2015-07-07
description: Deque (cara sebutan deck) boleh menggunakan kaedah first in, first out (FIFO) dan last in, first out (LIFO). Secara ringkasnya, Deque ialah Queue + Stack.
---

# Deque

Deque (cara sebutan 'deck') boleh menggunakan kaedah _first in, first
out_ (FIFO) dan _last in, first out_ (LIFO). Cara untuk menggunakan
kaedah FIFO sama sahaja dengan menggunakan queue, jadi kita akan lihat
kaedah LIFO pula. Class yang menggunakan interface `Deque` ialah
`ArrayDeque` dan `LinkedList`.

## ArrayDeque

Kaedah LIFO boleh diibaratkan seperti membuat burger. Kita letak
bahagian-bahagian burger bermula dari bawah ke atas. Apabila kita hendak
lihat daging apa, kita selak roti yang di atas.

Contoh kaedah LIFO menggunakan ArrayDeque:

```java
package datastructure;

import java.util.ArrayDeque;
import java.util.Deque;

public class ContohDeque {
    public static void main(String[] args) {
        Deque<String> burger = new ArrayDeque<>();
        burger.push("roti");
        burger.push("sayur");
        burger.push("daging");
        burger.push("roti");

        System.out.println("Susunan burger:");
        for (String partBurger : burger) {
            System.out.println(partBurger);
        }

        System.out.println("Oops, lupa letak sos!");
        String rotiDiTangan = burger.pop();   // keluarkan roti paling atas
        burger.push("sos + mayonis");   // tambah sos
        burger.push(rotiDiTangan);    // letak balik roti

        System.out.println("Susunan burger yang baru:");
        for (String partBurger : burger) {
            System.out.println(partBurger);
        }
    }
}
```

Method yang digunakan untuk LIFO ialah:

-   `push()` – untuk memasukkan data di hujung/atas
-   `pop()` – keluarkan data di hujung/atas
-   `peek()` – untuk mengakses data di hujung/atas tanpa mengeluarkan data tersebut

Method yang boleh digunakan untuk FIFO pula adalah sama seperti Queue
iaitu `offer()`, `poll()`, dan `peek()`.

## LinkedList

Cara gunanya sama sahaja dengan ArrayDeque. Secara umumnya,
ArrayDeque lebih efisyen berbanding LinkedList.

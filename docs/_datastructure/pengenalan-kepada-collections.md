---
date: 2015-07-05
description: Disebabkan kelemahan array yang tidak boleh berubah saiz, Java menyediakan data structure lain di framework Collections untuk digunakan oleh programmer.
---

# Pengenalan kepada Collections

`Array` merupakan _data structure_ yang paling simple. Antara
kelemahannya ialah saiz yang tidak boleh berubah. Ada cara untuk
mengatasi masalah ini dengan menggunakan teknik-teknik tertentu.
Disebabkan teknik-teknik tersebut selalu digunakan, maka Java
menyediakan framework `Collections` supaya programmer tidak perlu
tulis semula code yang sama.

Teknik-teknik di dalam framework `Collections` berbeza-beza mengikut
interface walaupun di bawah class yang sama. Oleh itu, kita digalakkan
untuk menggunakan interface untuk menentukan teknik mana yang
digunakan. Istilah ini dipanggil sebagai _program to interface_.
Contohnya sebelum ini kita create object daripada class Kucing seperti
ini:

```java
Kucing kucingSaya = new Kucing();
```

Untuk _program to interface_ pula adalah seperti ini:

```java
<interface> <nama object> = new <class>();
```

Contohnya jika class Kucing dengan interface HaiwanBergerak akan jadi
begini:

```java
HaiwanBergerak kucingSaya = new Kucing();
```

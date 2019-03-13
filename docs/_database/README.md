---
date: 2017-07-08
permalink: /:collection
description: Database ialah tempat untuk kita menyimpan data yang berkaitan dengan projek. Setiap projek sepatutnya mempunyai database walaupun projek simple.
---

# Database

Database ialah tempat untuk kita menyimpan data yang berkaitan dengan projek.
Apabila kita menyimpan data dalam variable, array atau data structure, kita
sebenarnya menyimpan data tersebut hanya dalam memory (RAM). Apabila program
kita berhenti, data tersebut akan hilang daripada memory.

Untuk mengekalkan (_persist_) data tersebut supaya tidak hilang, kita boleh
output ke file seperti tutorial sebelum ini. Namun, proses tersebut agak
menyusahkan kerana kita perlu memikirkan bagaimana format untuk file itu nanti.
Oleh itu, kita boleh menggunakan database untuk menyimpan data dengan cara yang
lebih selamat dan tersusun.

## Bila perlu guna database?

Kalau boleh *semua projek*.

Ya, semua projek. Anda mungkin berfikir projek anda nampak simple dan tidak
memerlukan database. Sebaik sahaja anda mula menambah feature pada projek anda,
anda pasti akan menyesal jika tidak menggunakan database.

## Jenis database

*Client/server database* adalah yang biasa digunakan semasa membuat projek
aplikasi web. Contohnya, MySQL dan PostgreSQL.

*Embedded database* pula ialah database yang disertakan sekali dengan aplikasi
seperti aplikasi desktop dan mobile. Contohnya, H2 dan SQLite.

## Tutorial

Untuk tutorial selepas ini, kita akan menggunakan database H2. Disebabkan H2
ialah _embedded database_, kita tidak perlu install database seperti MySQL. Kita
hanya perlu menambah nama library database tersebut di config Maven.

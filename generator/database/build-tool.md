# Build Tool

Sebelum ini kita diperkenalkan dengan beberapa IDE. Jika anda perasan saya tidak
memaksa sesiapa untuk menggunakan IDE tertentu kerana setiap orang mempunyai
citarasa masing-masing. Jadi, jika anda ingin memulakan sesuatu projek yang
melibatkan lebih daripada seorang programmer, setiap programmer mungkin
menggunakan IDE yang berlainan antara satu sama lain. Ini akan mendatangkan
masalah kerana setiap IDE mempunyai cara yang berlainan untuk menguruskan
projek Java. Oleh itu, kita sangat digalakkan untuk menggunakan *build
automation software* atau dikenali sebagai _build tool_.

Setiap programming language mempunyai _build tool_ masing-masing. Untuk Java,
kita boleh menggunakan,

* [Maven](https://maven.apache.org)
* [Gradle](https://gradle.org)
* [sbt](http://www.scala-sbt.org)
* [Ant](http://ant.apache.org)

*Maven* sememangnya biasa digunakan di industri yang menggunakan Java. Kelebihan
Maven berbanding Ant ialah Maven boleh download secara automatik library
yang kita gunakan dalam projek kita hanya dengan menulis nama library tersebut.
Jadi, kita tidak perlu download file JAR secara manual. Ada yang tidak suka
Maven kerana ia menggunakan XML untuk file config (sukar difahami).

*Gradle* lebih kurang sama dengan Maven. Kelebihannya ialah Gradle lebih mudah
untuk membuat custom build script jika anda tahu programming language Groovy.
File config Gradle juga lebih mudah difahami oleh manusia berbanding Maven.

*Sbt* sebenarnya ialah _build tool_ untuk programming language Scala. Disebabkan
Scala ialah programming language yang boleh run di Java Virtual Machine (JVM),
kita juga boleh menggunakannya untuk projek Java. Contoh apabila anda
menggunakan web framework seperti [Play Framework](https://www.playframework.com).

*Ant* ialah _build tool_ yang digunakan secara default jika anda menggunakan IDE
untuk generate projek Java. Seperti yang diberitahu sebelum ini, Ant lebih sukar
untuk projek yang menggunakan banyak library. Cuba elakkan Ant kalau boleh.

Pilihan _build tool_ bergantung kepada team dan projek anda.

Saya akan menggunakan Maven untuk tutorial database selepas ini kerana saya
bercadang untuk menggunakan database H2. H2 sukar digunakan dengan Gradle
kerana H2 ialah _embedded database_ dan saya menghadapi masalah dengan
classpath H2 semasa menggunakan Gradle. Plugin H2 untuk Gradle juga tidak
sematang plugin H2 untuk Maven.

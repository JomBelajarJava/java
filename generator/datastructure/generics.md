# Generics

Cuba lihat mana-mana interface yang ada dalam Collections di Java API.

[Klik untuk buka Java API](https://docs.oracle.com/javase/8/docs/api/java/util/List.html)

Jika perasan interface tersebut meletakkan `<E>` selepas nama
interface, contohnya,

```java
public interface List<E> extends Collection<E>
```

Huruf besar tersebut dinamakan sebagai _generics_. _Generics_ ini
digunakan untuk menentukan class apa yang boleh dimasukkan ke dalam data
structure tersebut. Konsep ini lebih kurang sama seperti parameter.
Contoh data structure untuk menyimpan class String akan kelihatan
begini:

```java
List<String> words = new ArrayList<>();
```

Selain E, huruf lain juga boleh digunakan seperti T, K, N.

## Primitive wrapper class

Hanya class yang boleh diletakkan pada _generics_. Data primitive
seperti `int`, `double`, `boolean`, dan `char` bukan class, jadi Java
menyediakan class _wrapper_ untuk digunakan oleh data primitive. Antara
class _wrapper_ adalah:

-   `Integer` untuk int
-   `Long` untuk long
-   `Double` untuk double
-   `Character` untuk char
-   `Boolean` untuk boolean

Jadi, kita boleh menggunakan class _wrapper_ untuk diletakkan pada
_generics_, contohnya:

```java
List<Integer> numbers = new ArrayList<>();
```

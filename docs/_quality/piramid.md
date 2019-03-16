---
date: 2019-03-16
description: Menggunakan teknik defensive programming (guard statment, pre-conditions) untuk menyelesaikan pyramid of doom.
---

# Piramid

Semasa programming, kita mungkin akan mengalami situasi di mana code kita akan
menjadi nested terlalu dalam. Contohnya method `lastWord()` ini,

```java
public class Application {
    private static void lastWord(String words) {
        if (words != null) {
            String[] tokens = words.split("\\s");

            if (tokens.length > 0) {
                String lastToken = tokens[tokens.length - 1];

                if (lastToken.endsWith(".")) {
                    String lastWord = lastToken.substring(0, lastToken.length() - 1);

                    if (!lastWord.isEmpty()) {
                        System.out.println(lastWord);
                    }
                }
            }
        }
    }

    public static void main(String[] args) {
        lastWord("Cikgu suka main bola. Hari-hari cikgu main bola.");
    }
}
```

Situasi ini dinamakan *pyramid of doom*.

Satu cara untuk tidak menjadikan code terlalu nested adalah dengan menggunakan
*jump statement* (`return`, `continue`, `break`). Kita terbalikkan condition
untuk if statement tersebut, kemudian gunakan *jump statement*.

Contoh untuk code di atas adalah seperti ini,

```java
    private static void lastWord(String words) {
        if (words == null) {
            return;
        }

        String[] tokens = words.split("\\s");
        if (tokens.length == 0) {
            return;
        }

        String lastToken = tokens[tokens.length - 1];
        if (!lastToken.endsWith(".")) {
            return;
        }

        String lastWord = lastToken.substring(0, lastToken.length() - 1);
        if (lastWord.isEmpty()) {
            return;
        }

        System.out.println(lastWord);
    }
```

Teknik ini ada digunakan dalam *defensive programming*, disebut sebagai *guard
statement* atau *pre-conditions*.

Code untuk handle setiap error juga lebih mudah ditambah. Katakanlah kita mahu
beritahu error dalam code yang asal, kita mungkin perlu menulis `if else`
seperti ini,

```java
    private static void lastWord(String words) {
        if (words != null) {
            String[] tokens = words.split("\\s");

            if (tokens.length > 0) {
                String lastToken = tokens[tokens.length - 1];

                if (lastToken.endsWith(".")) {
                    String lastWord = lastToken.substring(0, lastToken.length() - 1);

                    if (!lastWord.isEmpty()) {
                        System.out.println(lastWord);
                    } else {
                        System.out.println("Tiada perkataan terakhir sebelum tanda noktah.");
                    }
                } else {
                    System.out.println("Ayat tidak berakhir dengan titik noktah.");
                }
            } else {
                System.out.println("Tiada perkataan dalam ayat.");
            }
        } else {
            System.out.println("Argument words tidak wujud..");
        }
    }
```

Dengan menggunakan *guard statement*, code akan menjadi lebih teratur seperti
ini,

```java
    private static void lastWord(String words) {
        if (words == null) {
            System.out.println("Argument words tidak wujud..");
            return;
        }

        String[] tokens = words.split("\\s");
        if (tokens.length == 0) {
            System.out.println("Tiada perkataan dalam ayat.");
            return;
        }

        String lastToken = tokens[tokens.length - 1];
        if (!lastToken.endsWith(".")) {
            System.out.println("Ayat tidak berakhir dengan titik noktah.");
            return;
        }

        String lastWord = lastToken.substring(0, lastToken.length() - 1);
        if (lastWord.isEmpty()) {
            System.out.println("Tiada perkataan terakhir sebelum tanda noktah.");
            return;
        }

        System.out.println(lastWord);
    }
```

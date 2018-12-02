---
date: 2015-06-27
description: Ada kala code yang ditulis menggunakan if statement sangat sukar dibaca. Jadi, cara lain untuk membuat pilihan adalah dengan manggunakan switch statement.
---

# Switch statement

`Switch statement` adalah sama dengan `if statement` iaitu untuk
membolehkan program membuat pilihan (_decision making_). `Switch
statement` biasa digunakan jika pilihan terlalu banyak.

```java
public class TutorialSwitch {

    public static void main(String[] args) {

        int bulan = 5;

        switch (bulan) {
        case 1:  System.out.println("Januari"); break;
        case 2:  System.out.println("Februari"); break;
        case 3:  System.out.println("Mac"); break;
        case 4:  System.out.println("April"); break;
        case 5:  System.out.println("Mei"); break;
        case 6:  System.out.println("Jun"); break;
        case 7:  System.out.println("Julai"); break;
        case 8:  System.out.println("Ogos"); break;
        case 9:  System.out.println("September"); break;
        case 10: System.out.println("Oktober"); break;
        case 11: System.out.println("November"); break;
        case 12: System.out.println("Disember"); break;
        default: System.out.println("bulan tidak wujud"); break;
        }
    }
}
```

Kurungan selepas `switch` diletakkan variable yang digunakan untuk
perbandingan. Data selepas `case` diletakkan perbandingan yang ada.
Jadi, `case 1` bermaksud adakah bulan sama dengan 1? Jika ya, code
selepasnya akan dilaksanakan. Akhir sekali, diletakkan `break`
menandakan berakhirnya code yang perlu dilaksanakan.

`default` adalah sama dengan `else` dalam `if statement` iaitu
merupakan pilihan terakhir untuk code tersebut.

Kelebihan menggunakan `switch` adalah untuk memudahkan orang membaca
code tersebut (_readability_). Jika anda mahu, anda boleh tulis semua
code tersebut menggunakan `if statement`.

> P/S: Jangan lupa untuk menulis `break` selepas setiap
> `case` kerana walaupun code tiada error, akan berlaku sesuatu yang
> anda tidak jangkakan. Anda boleh cuba buang `break` untuk lihat apa
> yang berlaku.

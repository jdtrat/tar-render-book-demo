# Hello bookdown 

All chapters start with a first-level heading followed by your chapter title, like the line above. There should be only one first-level heading (`#`) per .Rmd file.

## A section

All chapter sections start with a second-level (`##`) or higher heading followed by your section title, like the sections above and below here. You can have as many as you want within a chapter.

### An unnumbered section {-}

Chapters and sections are numbered by default. To un-number a heading, add a `{.unnumbered}` or the shorter `{-}` at the end of the heading, like in this section.

# Adding a targets dependency


```r
data <- targets::tar_read(data)

print(data)
#>       x   y
#> 1    73  78
#> 2    24  93
#> 3    15  31
#> 4     4  67
#> 5    86  40
#> 6    64  34
#> 7    39  59
#> 8    35  82
#> 9    83  52
#> 10   58  38
#> 11    8  95
#> 12   84  10
#> 13    3  30
#> 14   70  33
#> 15   55  65
#> 16   68   7
#> 17   47  81
#> 18  100  55
#> 19   98  12
#> 20   21  43
#> 21   65  92
#> 22   44   8
#> 23   18  25
#> 24   62  53
#> 25   31  32
#> 26   51  14
#> 27   85  99
#> 28   82   3
#> 29   89  37
#> 30   34  51
#> 31   42  36
#> 32   87  13
#> 33   56  77
#> 34   38  73
#> 35   69  88
#> 36   28  85
#> 37   59 100
#> 38    6  87
#> 39   97  58
#> 40   52  41
#> 41   71  94
#> 42   41  90
#> 43   29  54
#> 44   46  61
#> 45   76  83
#> 46   49  21
#> 47   93  64
#> 48   43  60
#> 49   27  96
#> 50   90  48
#> 51   67   1
#> 52   78  45
#> 53   63  19
#> 54   72   4
#> 55   32  74
#> 56   88  16
#> 57   79  89
#> 58   99  29
#> 59   36  62
#> 60   33  22
#> 61   80  26
#> 62   17  28
#> 63   81  75
#> 64   12   5
#> 65   54  79
#> 66    1  68
#> 67    9  49
#> 68   48  97
#> 69   19  27
#> 70   61  42
#> 71   13  71
#> 72   53   2
#> 73   16  72
#> 74   26  24
#> 75   20  69
#> 76   37  44
#> 77   23  46
#> 78   14  70
#> 79   57  15
#> 80   77   9
#> 81   75  57
#> 82   40  56
#> 83    5  20
#> 84   91  11
#> 85   95  91
#> 86   45  39
#> 87   11  35
#> 88   92  66
#> 89   94  76
#> 90   96  80
#> 91   74  84
#> 92   22   6
#> 93    7  23
#> 94   50  63
#> 95   30  18
#> 96   10  98
#> 97   66  86
#> 98   60  50
#> 99    2  17
#> 100  25  47
```

new line here!

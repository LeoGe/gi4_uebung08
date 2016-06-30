# Symbol Tabelle

| Symbol | Typ | Wert | Global sichtbar? (Ja/Nein) | Weitere Attribute |
|--------|-----|------|----------------------------|-------------------|
| &#160; &nbsp; .text | segment | length: 7D||  
| &#160; &nbsp; printf | far | ?  | Nein  | extern, .text  |  
| &#160; &nbsp; exit | far | ? | Nein | extern, .text  |  
| &#160; &nbsp; main | near | 0000 | Ja | .text |  
| &#160; &nbsp; msg | byte | 0000 | Ja | .data |  
| &#160; &nbsp; schleife | near | 001E | Nein | |  
| &#160; &nbsp; ende | near | 004D | Nein | |  
| &#160; &nbsp; .data | segment | length: 17 ||  
| &#160; &nbsp; msg_len | equ | $-msg | Nein | .data |  
| &#160; &nbsp; CR | equ | 13 | Nein | .data |  
| &#160; &nbsp; LF | equ | 10 | Nein | .data |  

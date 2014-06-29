{Код получен от Сергея Политова}

{Основная процедура:
Установить картинку для символа c.
f должен быть массив скорее array[1..k] of byte, где k --- 
количество строчек пикселей в символе. k вполне фиксировано, только я не помню, чему оно равно. 
(порядка 19-20, наверное)
Каждый символ имеет размер, видимо, 8 x k пикселей --- i-ая строчка определяется битовой записью числа f[i]
типа того. Точно не помню, поэкспериментируйте :)}
procedure setsym(c: byte; var f); assembler;
asm
  push bp
  mov ax, 1110h
  mov bx, 1000h
  mov cx,    1h
  mov dl, c
  xor dh, dh
  les di, f
  mov bp, di
  int 10h
  pop bp
end;

{Сохранить текущий шрифт (все 256 символов, видимо)
oldfnt должен быть видимо глобальная переменная --- pointer на массив символов}
procedure getfnt;
var p: pointer;
begin new(oldfnt);
  asm
    push bp
    mov ax, 1130h
    mov bh, 6
    int 10h
    mov si, bp
    pop bp
    mov word ptr p, si
    mov word ptr p+2, es
  end;
  move(p^,oldfnt^,sizeof(tfnt));
end;

{Восстановить шрифт}
procedure rstfnt;
begin
  setfnt(0,$100,oldfnt^);
  dispose(oldfnt);
end;

procedure curfnt(var p: tfnt); begin move(oldfnt^,p,sizeof(p)); end;

{Установить целый шрифт сразу --- все 256 символов
tfnt --- тип, не знаю какой, попробуйте понять сами (массив картинок или указатель на массив)}
procedure setfnt(s,c: integer; var f: tfnt); assembler;
asm
  push bp
  mov ax, 1110h
  mov bx, 1000h
  mov cx, c
  mov dx, s
  les di, f
  mov bp, di
  int 10h
  pop bp
end;
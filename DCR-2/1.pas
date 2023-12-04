  program dom_laba2;
type arr1d=array[1..10] of int64; stroka=string;
var arr1:arr1d; kk,i,z:int64; strok: stroka; sorti:string;
//input1d//
procedure input1d(var myarr:arr1d);
var i:int64;
begin
  writeln('Введите массив( 10 чисел)');
  for i:=1 to 10 do
    read(myarr[i]);
end;
//sort//
procedure sort(slovo:string;var myarr: arr1d);
var i,j,z,znak:int64; ika:arr1d; sorted: string;
begin
  sorted:='no';
  if slovo='fsmall'then begin
    while sorted='no' do begin
      for i:=1 to 9 do
        if myarr[i]>myarr[i+1] then swap(myarr[i],myarr[i+1]);
      znak:=0;
      for i:=1 to 9 do
        if myarr[i]>myarr[i+1] then znak+=1;
      if znak=0 then sorted:='yes';
    end;
    writeln('sort From small');
    writeln(myarr);
    end;
  if slovo='fbig' then begin
     while sorted='no' do begin
      for i:=1 to 9 do
        if myarr[i]<myarr[i+1] then swap(myarr[i],myarr[i+1]);
      znak:=0;
      for i:=1 to 9 do
        if myarr[i]<myarr[i+1] then znak+=1;
      if znak=0 then sorted:='yes';
    end;
    writeln('sort From big');
    writeln(myarr);
  end; 
end;
//LowCase//
procedure LowCase(var mystr:string);
var j:byte;
begin
  for j:=1 to length(mystr) do
    if mystr[j] in ['A'..'Z','А'..'Я'] then mystr[j]:=chr(ord(mystr[j])+32)
    else if mystr[j]='Ё' then mystr:= 'ё';
  end;
//palindrom?//
function palindrom(mystr:stroka):boolean;
var i:int64;
  begin
 LowCase(mystr);
 palindrom:=True;
 for i:=1 to (length(mystr) div 2) do
   if mystr[i]<>mystr[(length(mystr)-i+1)] then begin 
    palindrom:=False;
    break;
   end;
end;
begin
  writeln('Какую подпрограмму выполнить?');
  Writeln('Введите 1 если: поиск k-ой статистики в массиве.');
  Writeln('Введите 2 если: является ли заданная строка палиндромом (без учета регистра)');
  readln(z);
  case z of
    1:begin
//start//
begin
  input1d(arr1);
  sort('fsmall',arr1); 
  writeln('Введи k-ю статистику');
  readln(kk);
  for i:=1 to 10 do begin
    if arr1[i]=kk then  begin writeln('Статистика ', kk,' [',i,']');
    break;
    end; 
    if i=10 then writeln('Такой статистики нет')
  end;
end;
end;
 2: 
 begin
//start//
begin
  Write('Введи строку: ');
  readln(strok);
  write('palindrom is ');
  writeln(palindrom(strok));
end;
 end;

end;
end.
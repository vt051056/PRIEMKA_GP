unit myfuncs;

interface
Uses Windows,Dialogs,controls, DBGrids, Classes,DB, IniFiles, Forms,
Messages, Variants;
type
 Bit = 0..1;

type
 TBitSet = array[0..7] of Bit;
 
type
  // Определение класса элементов списка полей Grida
  TGridFieldData = class
    private

      Name_Field   : String;     // имя поля
      Position_Field : Integer; // позиция отображения
      Width_Field  : Integer;    // ширина отображения


    public
      // Свойства для чтения значений этих данных
      property Name : String
          read Name_Field;
      property Position : Integer
          read Position_Field;
      property Width : Integer
          read Width_Field;



      constructor Create(const Name_Field   : String;
                         const  Position_Field: Integer;
                         const  Width_Field: Integer

                         );
  end;


function Days_In_Month(Year,Month:integer):integer;//кол-во дней в
                                                 //месяце конкрет. годаж
  {округление до N_R}
procedure Sum_Round(N_R:Extended; var Sum:Extended);

function Round_after_point(V:extended; r:integer):Currency;
function Sum_Round_after_point(N_R:Extended; Sum:Extended):extended;

 {число прописью}
function Text_Numb(Value:extended;L:integer; withoutnamevalut:boolean; var ValueStr:TCaption):TCaption;

 {малая буква в большую}
 function UpCaseAll(Ch: Char): Char;
 function UpCaseSTR(S: TCaption): TCaption;

function GettypeProv(id_uchet_d,id_uchet_k:longint):integer;
function addForvardNull(n_pos:integer; s:string):string;
// определение квартала месяца m
function kvartal(m:integer):integer;

// определение предыдущего месяца с 1-го по последний день
procedure LastMonthPeriod(d:TDateTime; var LastDateFrom,LastDateTo:TDateTime);

// установка порядка и ширины DbGrid1 из секции section_Ini Ini файла
procedure ReadColumnPosFromIni(DbGrid1:TDbGrid; section_Ini:string);
  // сохранить настройки колонок DbGrid1 в секцию  section_Ini  Ini файла
procedure SaveColumnPosToIni(DbGrid1:TDbGrid; section_Ini:string);


//определение пути к стандартным и общим файлам
function GetSpecialPath(CSIDL: word): string;
function compareGridFieldData(Item1 : Pointer; Item2 : Pointer) : Integer;


function GetNBit (X, N: byte): Bit;
function GetBits (X: byte): TBitSet;
function MakeByte (BitSet: TBitSet): byte;

function BasicVariantType(varVar: Variant):string;
const eps=0.00000001;
      maxS='яяяяяяяяяяяя';
      Zerro_Ext=0.0;
      GvMaxCode=2147483647;
      GC_not_def='Не определен';
      CSIDL_COMMON_APPDATA  = $23;     // Папка AppData для всех пользователей.
                                       //(обычно C:\Documents and Settings\All Users\Application Data)

  const
  WM_MY_MESSAGE = WM_USER + 1;

 var work_DB:string;
implementation
uses Sysutils, ShlObj;






function GetNBit (X, N: byte): Bit;
begin
 Result := x shr N and 1;
end;

function GetBits (X: byte): TBitSet;

var
 N: integer;
begin
 for N := 0 to 7 do
   Result[N] := GetNBit(X, N);
end;

function MakeByte (BitSet: TBitSet): byte;

var
 i: integer;
begin
 Result := 0;
 for i := 7 downto 0 do
   Result := Result shl 1 + (BitSet[i] and 1);
end;






function BasicVariantType(varVar: Variant):string;
var
  typeString : string;
  basicType  : Integer;

begin
// Получение основного типа Variant :
  // это означает, исключение массива или косвенных модификаторов
  basicType := VarType(varVar) and VarTypeMask;
  typeString := 'NONE';
  // Установка строки для согласования типа
  case basicType of
    varEmpty     : typeString := 'varEmpty';
    varNull      : typeString := 'varNull';
    varSmallInt  : typeString := 'varSmallInt';
    varInteger   : typeString := 'varInteger';
    varSingle    : typeString := 'varSingle';
    varDouble    : typeString := 'varDouble';
    varCurrency  : typeString := 'varCurrency';
    varDate      : typeString := 'varDate';
    varOleStr    : typeString := 'varOleStr';
    varDispatch  : typeString := 'varDispatch';
    varError     : typeString := 'varError';
    varBoolean   : typeString := 'varBoolean';
    varVariant   : typeString := 'varVariant';
    varUnknown   : typeString := 'varUnknown';
    varByte      : typeString := 'varByte';
    varWord      : typeString := 'varWord';
    varLongWord  : typeString := 'varLongWord';
    varInt64     : typeString := 'varInt64';
    varStrArg    : typeString := 'varStrArg';
    varString    : typeString := 'varString';
    varAny       : typeString := 'varAny';
    varTypeMask  : typeString := 'varTypeMask';
  end;


  Result:= typeString;
end;




constructor TGridFieldData.Create(const Name_Field   : String;
                         const  Position_Field: Integer;
                         const  Width_Field: Integer);
begin
  self.Name_Field   := Name_Field;
  self.Position_Field := Position_Field;
  self.Width_Field:= Width_Field;

end;


// Функция сортировки TList коллекции полей Grida по позиции Position
// --------------------------------------------------------------------------
// Возвращенное целое число имеет следующее значение :
//
//   > 0 : (положительное)	Item1 является меньше чем Item2
//     0 : Item1 равно Item2
//   <0 : (отрицательное) больше чем item2
function compareGridFieldData(Item1 : Pointer; Item2 : Pointer) : Integer;
var
  GridFieldData1, GridFieldData2 : TGridFieldData;
begin
  GridFieldData1 := TGridFieldData(Item1);
  GridFieldData2 := TGridFieldData(Item2);
  if      GridFieldData1.Position > GridFieldData2.Position
  then Result := 1
  else if GridFieldData1.Position = GridFieldData2.Position
  then Result := 0
  else Result := -1;
end;

// установка порядка и ширины DbGrid1 из секции section_Ini Ini файла
procedure ReadColumnPosFromIni(DbGrid1:TDbGrid; section_Ini:string);
var i, i_new, width_new,j:integer;
 S:string;
 ListField : TList;
 GridFieldData:TGridFieldData;
 DataSource1:TDataSource;
 IniFile:TIniFile;
 v_column:TColumn;
 is_visible, is_cbsEllipsis, i_pos_first_comma:integer;
 present_Grid_columns:boolean;
begin
IniFile:=TIniFile.Create(GetSpecialPath(CSIDL_COMMON_APPDATA)+'\'+
   ChangeFileExt(ExtractFileName(Application.ExeName), '.ini'));
// Создание объекта TList для хранения набора полей Grida
  ListField := TList.Create;
 DataSource1:=DbGrid1.DataSource;

with IniFile do
begin
 for i:=0 to DataSource1.DataSet.Fields.Count-1 do
 begin
   if not DataSource1.DataSet.Fields[i].Visible then
   begin
     DataSource1.DataSet.Fields[i].Index:=DataSource1.DataSet.Fields.Count-1;
   end;
 end;


 j:=0;
 for i:=0 to DataSource1.DataSet.Fields.Count-1 do
 begin
   if DataSource1.DataSet.Fields[i].Visible then
   begin
    S:=ReadString(section_Ini,DataSource1.DataSet.Fields[i].FieldName,Format('%d,%d',[j,50]));

    i_pos_first_comma:=Pos(',', S);
    i_new:=StrToInt(Copy(S, 1, i_pos_first_comma - 1));

    delete(S, 1, i_pos_first_comma);
    i_pos_first_comma:=Pos(',', S);
    width_new:= StrToInt(Copy(S, 1, Length(S)));

   GridFieldData := TGridFieldData.Create(DataSource1.DataSet.Fields[i].FieldName,
    i_new, width_new);
   ListField.Add(GridFieldData);
   inc(j);
  end;  // if DataSource1.DataSet.Fields[i].Visible then

 end;   //   for i:=0 to DataSource1.DataSet.Fields.Count-1 do
 Free;
end; // with IniFile do
ListField.Sort(compareGridFieldData);

 DbGrid1.Columns.Clear;

 DbGrid1.DataSource.DataSet:=DataSource1.DataSet;

for i:=0 to ListField.Count-1 do
begin
    GridFieldData :=TGridFieldData(ListField.Items[i]);
    DataSource1.DataSet.FieldbyName(GridFieldData.Name).Index:=GridFieldData.Position;
    DataSource1.DataSet.FieldbyName(GridFieldData.Name).DisplayWidth:=GridFieldData.Width;
    DbGrid1.Columns.Items[i].Width:=GridFieldData.Width;

end; // for i:=0 to ListField.Count-1 do


ListField.Free;


end;   // procedure TF_price.SetColumnPosFromIni;


  // сохранить настройки колонок DbGrid1 в секцию  section_Ini  Ini файла
 procedure SaveColumnPosToIni(DbGrid1:TDbGrid; section_Ini:string);
 var DataSource1:TDataSource;
  IniFile:TIniFile;
  i, j:integer;
  is_visible, is_cbsEllipsis:integer;
 begin
  IniFile:=TIniFile.Create(GetSpecialPath(CSIDL_COMMON_APPDATA)+'\'+
  ChangeFileExt(ExtractFileName(Application.ExeName), '.ini'));
  DataSource1:=DbGrid1.DataSource;
    j:=0;
    for i:=0 to DataSource1.DataSet.Fields.Count-1 do
    begin
      if DataSource1.DataSet.Fields[i].Visible then
      begin
        IniFile.WriteString(section_Ini,DataSource1.DataSet.Fields[i].FieldName,
        Format('%d,%d',[j,DbGrid1.Columns.Items[j].Width]));
        Inc(j);
      end;
    end;
  IniFile.Free;
 end;


//определение пути к стандартным и общим файлам
function GetSpecialPath(CSIDL: word): string;
var s:  string;
begin
  SetLength(s, MAX_PATH);
  if not SHGetSpecialFolderPath(0, PChar(s), CSIDL, true)
  then s := '';
  result := PChar(s);
end;


// определение предыдущего месяца с 1-го по последний день
procedure LastMonthPeriod(d:TDateTime; var LastDateFrom,LastDateTo:TDateTime);
var Year: Word; Month: Word; Day,day1,day2: Word;
begin
  DecodeDate( d, Year, Month, Day);
  Month:=Month-1;
  if Month<1 then
  begin
    Year:=Year-1;
    Month:=12;
  end;

  day1:=1;
  day2:= Days_In_Month(Year,Month);
  LastDateFrom:=EncodeDate(Year, Month, day1);
  LastDateTo:=EncodeDate(Year, Month, day2);
end;


// определение квартала месяца m
function kvartal(m:integer):integer;
var kv,ost:integer;
begin
 kv:=m div 3;
 ost:= m mod 3;
 if(ost>0) then Inc(kv);
 kvartal:=kv;
end;

// добавление ведущих нулей к s до заданной длины n_pos
function addForvardNull(n_pos:integer; s:string):string;
var n_null,i:integer;
begin
 n_null:= n_pos-length(s);
 for i:=1 to n_null do
 begin
  s:='0'+s;
 end;
 addForvardNull:=s;
end;



// тип проводки
// 0 - безтоварная проводка
// 1 - проводка прихода товара
// 2 - проводка расхода товара
// 3 - проводка передачи товара
function GettypeProv(id_uchet_d,id_uchet_k:longint):integer;
begin
 result:=0;
 if (id_uchet_d=0) and (id_uchet_k=0) then result:=0;
 if (id_uchet_d=1) and (id_uchet_k=0) then result:=1;
 if (id_uchet_d=0) and (id_uchet_k=1) then result:=2;
 if (id_uchet_d=1) and (id_uchet_k=1) then result:=3;
end;

{малая буква в большую}
function UpCaseAll(Ch: Char): Char;
begin
 case ch of
  'a'..'z',
  'а'..'я' : UpCaseAll:=Chr(Ord(ch)-32);
 else UpCaseAll:=Ch;
 end;
end;



{малая буква в большую}
function UpCaseSTR(S: TCaption): TCaption;
var i:integer;
begin
 Result:='';
 for i:=1 to Length(S) do
  Result:=Result+UpCaseAll(s[i]);
end;



function Days_In_Month(Year,Month:integer):integer;
const
 DaysInMonth: array[1..12] of Byte =
     (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
 Result:= DaysInMonth[Month] + Byte((Year mod 4 = 0) and (Month = 2));
end;




function Round_after_point(V:extended; r:integer):Currency;
var s:string;
begin
s:= FormatFloat('0.00',V) ;
  v:= StrToFloat(s);
  result:=v;
end;

function Sum_Round_after_point(N_R:Extended; Sum:Extended):extended;
{N_R-????????? ??}
{Sum-??????????? ?????}
var
    pt:integer;
    C:extended;
    D:extended;
    sC,sS,sD:Tcaption;
begin

if abs(Sum)>Eps then
begin
sS:= FormatFloat('0.00000000000',Sum/N_R);    //////FloatToStr(Sum/N_R); 503,125/0,01=50312,5
pt:=Pos('.',sS);                                 // 4
if pt=0 then pt:=Pos(',',sS);
if pt=0 then pt:=Length(sS)+1;
sC:=Copy(sS,1,pt-1);
if sC = '' then sC:='0';   //целая часть           50312
C:=StrToFloat(sC);
D:=Sum/N_R-C;

if C=0 then Sum:=Zerro_Ext{N_R}
else
 begin
  if (D>=0.5)then C:=C+1
  else
   if abs(D-0.5)<=N_R then C:=C+1 ;

  Sum:=C*N_R;
 end;


end
else Sum:=Zerro_Ext;

result:=Sum;
end;



procedure Sum_Round(N_R:Extended; var Sum:Extended);
{N_R-округлять до}
{Sum-округляемая сумма}
var
    pt:integer;
    C:extended;
    D:Extended;
    sC,sS:Tcaption;
begin

if abs(Sum)>Eps then
begin



sS:= FormatFloat('0.00000000000',Sum/N_R);    //////FloatToStr(Sum/N_R);
pt:=Pos('.',sS);
if pt=0 then pt:=Pos(',',sS);
if pt=0 then pt:=Length(sS)+1;
sC:=Copy(sS,1,pt-1);
if sC = '' then sC:='0';
C:=StrToFloat(sC);
D:=Sum/N_R-C;

if C=0 then Sum:=Zerro_Ext{N_R}
else
 begin
  if D>=0.5 then C:=C+1;
  Sum:=C*N_R;
 end;



 // FormatFloat('0.0', float));

end
else Sum:=Zerro_Ext;
end;


function Text_Numb(Value:extended;L:integer;withoutnamevalut:boolean; var ValueStr:TCaption):TCaption;
const c11:array[1..2] of string[15]=
        ('одна','двi');
      c12:array[1..9] of string[15]=
      ('один','два','три','чотири','п`ять','шiсть','сiм',
        'вiсiм','дев`ять');
      c13:array[1..2] of string[15]=
      ('одно','два');

      c2:array[0..9] of string[15]=
      ('десять','одинадцять','дванадцять','тринадцять','чотирнадцять',
       'п`ятнадцять','шiстнадцять','сiмнадцять','вiсiмнадцять',
       'дев`ятнадцять');
      c3:array[2..9] of string[15]=
      ('двадцять','тридцять','сорок','п`ятдесят','шiстдесят','сiмдесят',
      'вiсiмдесят','дев`яносто');
      c4:array[1..9] of string[15]=
      ('сто','двiстi','триста','чотириста','п`ятсот','шiстсот',
      'сiмсот','вiсiмсот','дев`ятсот');
      ccm:array[1..3,1..4] of string[15]=
      (('тисяча','мiльйон','мiльярд','трильйон'),
       ('тисячi','мiльйона','мiльярда','трильйона'),
       ('тисяч','мiльйонiв','мiльярдiв','трильйонiв'));

      c5:array[1..3] of string[15]=('грн.','грн.','грн.');
      c6:string[15]='коп.';
      c7:string[15]='ноль';
      c8:string[15]='женский род';
(*
var   c11:array[1..2] of string[15];
      c12:array[1..9] of string[15];
      c2:array[0..9] of string[15];
      c3:array[2..9] of string[15];
      c4:array[1..9] of string[15];
      ccm:array[1..3,1..4] of string[15];
      c5:array[1..3] of string[15];
      c6:string[15];
*)
var
    J:LongInt;
    m,mk,ls,pk,i3,ic,i,c:integer;
    s,sr,sk,sp,ssl:string;
    sd,kop:string[3];
    vr:array [1..3] of integer;
    {RS:array [0..20] of char;}

Label LB1;

begin
 ValueStr:='';
 s:=FloatToStrF(Value, ffFixed{0.00}, 18, 2);
(*
{массивы заполнить начиная с KodValut из БД MS.DB}
if KodValut > 1 then
begin
 j:=KodValut-1; {начало ресурса в БД}

 for i:=1 to 2 do
  begin
   Inc(j);
   c11[i]:=LoadOnlyMess(J);
  end;
for i:=1 to 2 do
  begin
   inc(j);
   c13[i]:=LoadOnlyMess(J);
  end;
 for i:=1 to 9 do
  begin
   inc(j);
   c12[i]:=LoadOnlyMess(J);
  end;


 for i:=0 to 9 do
  begin
   inc(j);
   c2[i]:=LoadOnlyMess(J);
  end;
 for i:=2 to 9 do
  begin
   inc(j);
   c3[i]:=LoadOnlyMess(J);
  end;
 for i:=1 to 9 do
  begin
   inc(j);
   c4[i]:=LoadOnlyMess(J);
  end;
 For m:=1 to 3 do
 for i:=1 to 4 do
  begin
   inc(j);
   ccm[m,i]:=LoadOnlyMess(J);
  end;

 for i:=1 to 3 do
  begin
   inc(j);
   c5[i]:=LoadOnlyMess(J);
  end;

  inc(j);
  c6:=LoadOnlyMess(J);
  inc(j);
  c7:=LoadOnlyMess(J);
  inc(j);
  c8:=LoadOnlyMess(J);


 {массивы заполнены !!!!!!!!!!!!!!!!}
end;{if KodValut > 1 then}

*)


 ls:=Length(S);
 pk:=Pos('-',s);{поз.карб}
 if pk=0 then pk:=Pos('=',s);
 if (pk=0) then pk:=Pos('.',s);
 if (pk=0) then pk:=Pos(',',s);
 {s=217 -00}
 Dec(pk);
 sk:=Copy(s,pk+1,ls-pk);{концовка-00 }
 sp:=Copy(s,1,pk);{начало 217}
 {s:=Alltrim(sp)+AllTrim(sk);}
{ ls:=Length(S);}
 pk:=Pos('-',s);{поз.карб}
 if pk=0 then pk:=Pos('=',s);
 if (pk=0) then pk:=Pos('.',s);
 if (pk=0) then pk:=Pos(',',s);
 Dec(pk);
 Delete(sk,1,1);
 ValueStr:=sp+','+sk;
 kop:=sk;
 sk:=Copy(s,1,pk);{строка карб без коп}
 i3:=Trunc(pk/3);{кол тройных разрядов}
 ic:=pk-i3*3;
 if ic=2 then sk:='0'+sk;
 if ic=1 then sk:='00'+sk;
 if ic<>0 then Inc(i3);
 sr:='';
 mk:=1;
 for i:=0 to i3-1 do
  begin
   sp:='';
   m:=0;{индекс для опред склонения}
   sd:=Copy(sk,i3*3-(i+1)*3+1,3);{i-тая триада}
   for j:=1 to 3 do val(sd[j],vr[j],c);
   if vr[1]<>0 then
    begin
     sp:=sp+' '+c4[vr[1]];{сотни}
     m:=3;
    end;
   case vr[2] of {десятки}
   0:;
   1: begin
       sp:=sp+' '+c2[vr[3]];{сотни}
       m:=3;
       goto LB1; {десятки и ед готовы}
      end;
   2..9: begin
          sp:=sp+' '+c3[vr[2]];{сотни}
          m:=3;
         end;
   end;{case}

   case vr[3] of {единицы}
   0:;
   1..2: case i of
         0:  begin
              if c8='женский род' then
               sp:=sp+' '+c11[vr[3]];{для женского рода валюты}{одна,две}
              if c8='мужской род' then
               sp:=sp+' '+c12[vr[3]]; {для мужского рода валюты}{один,два}
              if c8='средний род' then
               sp:=sp+' '+c13[vr[3]];
             end;
         1:      sp:=sp+' '+c11[vr[3]];{одна,две}

         2..4:   sp:=sp+' '+c12[vr[3]];{для женского рода валюты}{один,два}

         end;
   3..9: sp:=sp+' '+c12[vr[3]];
   end;{case}

 (*
   case vr[3] of {единицы}
   0:;
   1..2: case i of
         1:      sp:=sp+' '+c11[vr[3]];{одна,две}
         0,2..4:   sp:=sp+' '+c12[vr[3]];{один,два}
         end;

   3..9: sp:=sp+' '+c12[vr[3]];
   end;{case}
 *)
  case vr[3] of
   0:;
   1: m:=1;
   2..4: m:=2;
   5..9: m:=3;
   end;{case}
LB1: if(m<>0) and (i<>0) then sp:=sp+' '+ccm[m,i];{тысяч, миллионов, и т д}
   sr:=sp+sr;
   if i=0 then {склонение карбованца по младшей триаде}
    begin
     if (vr[1]=0) and (vr[2]=0) and (vr[3]=0) then mk:=3
     else mk:=m;
    end;
  end;     {for i:=0 to i3 do}
if Sr='' then sr:=c7;
 {mk-1 - склонение}
 if not withoutnamevalut then
  Sr:=Sr+' '+c5[mk]{ResStrings^.Get(msSpr51+(mk-1))};
 (*
 if StIntVal(BegZero(kop)) >= 0 then Sr:=Sr+' '+kop+' '+
 c6{ResStrings^.Get(msSpr54)};
*)

if not withoutnamevalut then
  Sr:=Sr+' '+kop+' '+c6;

 if Length(Sr) > L then
  begin
   Ssl:=Copy(Sr,1,L);
   while Ssl[Length(Ssl)] <> ' ' do  Delete(Ssl,Length(Ssl),1);
   L:=Length(Ssl);
   Sr:=Ssl+chr(13)+Copy(Sr,L,Length(Sr));
  end;

  Sr:=Trim(Sr);
  Sr[1]:=UpCaseAll(Sr[1]);{Большая первая !}
  Text_Numb:=Sr;
end;



end.

unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil;
Const
VariantArr:array[1..6] of String = (
'Варіант 1. "Розфарбування графа за алгоритмом прямого перебору"',
'Варіант 2. "Розфарбування графа за евристичним алгоритмом"',
'Варіант 3. "Розфарбування графа за модифікованим евристичним алгоритмом"',
'Варіант 4. "Розфарбування графа. Алгоритм розфарбування за методом А.П. Єршова"',
'Варіант 5. "Розфарбування графа. Рекурсивна процедура послідовного розфарбування"',
'Варіант 6. "Розфарбування графа. "Жадібний" алгоритм розфарбування"');

type
  TDataLabModule = class(TDataModule)
  private
    { private declarations }
  public
    { public declarations }
  end;

var
 DataLabModule: TDataLabModule;
 NumVariant:Integer; {Номер варіанта}
 NZK:Integer;        {Номер залікової книжки}
 NumNodes:Integer;   {Кількість вершин графа}
 NumEdges:Integer;   {Кількість ребер графа}
 DataPath:String;   {Шлях даних }


implementation

{$R *.lfm}

end.


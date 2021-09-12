unit ModelProduto;

interface

uses Produto, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, DMConexao, System.SysUtils, System.Classes;

type
  TModelProduto = class(TInterfacedObject, IModelProduto)
  private
    FQuery: TFDQuery;

    FCodProduto: integer;
    FNomeProduto: string;
    FQuantidade: Double;
    FValorUnitario: Double;
    FValorTotal: Double;
    FIdItens: integer;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelProduto;

    function CodProduto(value: integer): IModelProduto;
    function RetornaProduto(FList: TStringList): IModelProduto;
    function NomeProduto(value: string): IModelProduto;
    function Quantidade(value: Double): IModelProduto;
    function ValorUnitario(value: Double): IModelProduto;
    function ValorTotal(value: Double): IModelProduto;
    function CalcValorTotal: string;
    function ValorDaCompra(FTable: TFDMemTable): string;
    function PopTabela(FTable: TFDMemTable): IModelProduto;
    function EditTabela(FTable: TFDMemTable): IModelProduto;
    function DeletaTabela(FTable: TFDMemTable): IModelProduto;
    function IdItens(value:integer):IModelProduto;
  end;

implementation

{ TModelProduto }

uses Functions;


function TModelProduto.CalcValorTotal: string;
begin
  Result := FormataValor(FloatToStr(FValorUnitario * FQuantidade));
end;

function TModelProduto.CodProduto(value: integer): IModelProduto;
begin
  Result := self;
  FCodProduto := value;
end;

constructor TModelProduto.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DM.FDConexao;
  FQuery.Active := false;
  FQuery.SQL.Clear;
end;

function TModelProduto.DeletaTabela(FTable: TFDMemTable): IModelProduto;
begin
  Result := self;
  if FTable.RecordCount <> 0 then
  begin
    FTable.Delete;
    FTable.ApplyUpdates(0);
  end;
end;

destructor TModelProduto.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TModelProduto.EditTabela(FTable: TFDMemTable): IModelProduto;
begin
  Result := self;

  FTable.Edit;
  FTable.FieldByName('cod_produto').AsInteger := FCodProduto;
  FTable.FieldByName('val_unitario').AsFloat  := FValorUnitario;
  FTable.FieldByName('qtd_produtos').AsFloat  := FQuantidade;
  FTable.FieldByName('val_total').AsFloat     := FValorTotal;
  FTable.Post;
end;

function TModelProduto.IdItens(value: integer): IModelProduto;
begin
  Result := self;
  FIdItens := value;
end;

class function TModelProduto.New: IModelProduto;
begin
  Result := self.Create;
end;

function TModelProduto.NomeProduto(value: string): IModelProduto;
begin
  Result := self;
  FNomeProduto := value;
end;

function TModelProduto.PopTabela(FTable: TFDMemTable): IModelProduto;
begin
  Result := self;

  FTable.Append;
  FTable.FieldByName('cod_produto').AsInteger := FCodProduto;
  FTable.FieldByName('produto').AsString      := FNomeProduto;
  FTable.FieldByName('val_unitario').AsFloat  := FValorUnitario;
  FTable.FieldByName('qtd_produtos').AsFloat  := FQuantidade;
  FTable.FieldByName('val_total').AsFloat     := FValorTotal;
  FTable.Post;
end;

function TModelProduto.Quantidade(value: Double): IModelProduto;
begin
  Result := self;
  FQuantidade := value;
end;

function TModelProduto.RetornaProduto(FList: TStringList): IModelProduto;
begin
  Result := self;

  FQuery.SQL.Add
    ('SELECT * FROM wkvenda.tb_produtos where id_produtos = :idproduto;');
  FQuery.ParamByName('idproduto').AsInteger := FCodProduto;
  FQuery.Open;

  for var i := 0 to FQuery.FieldCount - 1 do
  begin
    FList.Add(FQuery.Fields[i].AsString);
    FQuery.Next;
  end;
end;

function TModelProduto.ValorDaCompra(FTable: TFDMemTable): string;
var
  i: Integer;
  Valor: Double;
begin
  Valor := 0;
  FTable.First;
  for i := 0 to FTable.RecordCount - 1 do
  begin
    Valor := Valor + FTable.FieldByName('val_total').AsFloat;
    FTable.Next;
  end;

  result := FormataValor(FloatToStr(Valor));
end;

function TModelProduto.ValorTotal(value: Double): IModelProduto;
begin
  Result := self;
  FValorTotal := value;
end;

function TModelProduto.ValorUnitario(value: Double): IModelProduto;
begin
  Result := self;
  FValorUnitario := value;
end;

end.

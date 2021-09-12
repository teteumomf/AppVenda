unit ModelPedidoItens;

interface

uses Pedido, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, DMConexao, System.SysUtils, System.Classes;

type
  TModelPedidoItens = class(TInterfacedObject, IModelPedidoItens)
  private
    FQuery: TFDQuery;

    FCodPedido: integer;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelPedidoItens;

    function CodPedido(value: integer): IModelPedidoItens;
    function GravaPedidoItens(FTable: TFDMemTable): IModelPedidoItens;
    function DeletaPedidoItens: IModelPedidoItens;
    function BuscaPedidoItens(FTable: TFDMemTable): IModelPedidoItens;
  end;

implementation

{ TModelPedidoItens }

function TModelPedidoItens.BuscaPedidoItens(FTable: TFDMemTable)
  : IModelPedidoItens;
begin
  Result := self;
  FQuery.sql.Add('SELECT * FROM wkvenda.tb_pedido_itens where cod_pedido = :cod_pedido;');
  FQuery.ParamByName('cod_pedido').AsInteger := FCodPedido;
  FQuery.Open;
  FTable.CopyDataSet(FQuery);
end;

function TModelPedidoItens.CodPedido(value: integer): IModelPedidoItens;
begin
  Result := self;
  FCodPedido := value;
end;

constructor TModelPedidoItens.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DM.FDConexao;
  FQuery.Active := false;
  FQuery.SQL.Clear;
end;

function TModelPedidoItens.DeletaPedidoItens: IModelPedidoItens;
begin
  Result := self;
  DM.FDConexao.StartTransaction;
  try
    FQuery.SQL.Add
      ('delete from wkvenda.tb_pedido_itens where cod_pedido = :idpedido');
    FQuery.ParamByName('idpedido').AsInteger := FCodPedido;
    FQuery.ExecSQL;
    DM.FDConexao.Commit;
  except
    DM.FDConexao.Rollback;
  end;
end;

destructor TModelPedidoItens.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TModelPedidoItens.GravaPedidoItens(FTable: TFDMemTable)
  : IModelPedidoItens;
var
  n: integer;
begin
  Result := self;
  DM.FDConexao.StartTransaction;
  try
    FTable.First;
    for n := 0 to FTable.RecordCount - 1 do
    begin
      FQuery.SQL.Add('INSERT INTO wkvenda.tb_pedido_itens (cod_pedido, cod_produto, qtd_produtos, val_unitario, val_total) values ((select max(id_pedido) from wkvenda.tb_pedido), :cod_produto, :qtd_produtos, :val_unitario, :val_total);');
      FQuery.ParamByName('cod_produto').AsInteger := FTable.FieldByName('cod_produto').AsInteger;
      FQuery.ParamByName('qtd_produtos').AsFloat := FTable.FieldByName('qtd_produtos').AsFloat;
      FQuery.ParamByName('val_unitario').AsFloat := FTable.FieldByName('val_unitario').AsFloat;
      FQuery.ParamByName('val_total').AsFloat := FTable.FieldByName('val_total').AsFloat;
      FQuery.ExecSQL;
      FTable.Next;
    end;
    DM.FDConexao.Commit;
  except
    DM.FDConexao.Rollback;
  end;

end;

class function TModelPedidoItens.New: IModelPedidoItens;
begin
  Result := self.Create;
end;

end.

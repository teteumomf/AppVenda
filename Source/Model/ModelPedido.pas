unit ModelPedido;

interface

uses Pedido, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, DMConexao, System.SysUtils, System.Classes;

type
  TModelPedido = class(TInterfacedObject, IModelPedido)
  private
    FQuery: TFDQuery;

    FCodPedido: Integer;
    FCodCliente: Integer;
    FDataPedido: TDateTime;
    FValorPedido: Double;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelPedido;

    function CodPedido(value: Integer): IModelPedido;
    function CodCliente(value: Integer): IModelPedido;
    function DataPedido(value: TDateTime): IModelPedido;
    function ValorPedido(value: Double): IModelPedido;
    function GravaPedido: IModelPedido;
    function DeletaPedido: IModelPedido;
    function BuscaPedido: string;
  end;

implementation

{ TModelPedido }

function TModelPedido.BuscaPedido: string;
begin
  FQuery.SQL.Add('SELECT * FROM wkvenda.tb_pedido where id_pedido = :idpedido');
  FQuery.ParamByName('idpedido').AsInteger := FCodPedido;
  FQuery.open;
  result := FQuery.FieldByName('cod_cliente').AsString;
end;

function TModelPedido.CodCliente(value: Integer): IModelPedido;
begin
  Result := self;
  FCodCliente := value;
end;

function TModelPedido.CodPedido(value: Integer): IModelPedido;
begin
  Result := self;
  FCodPedido := value;
end;

constructor TModelPedido.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DM.FDConexao;
  FQuery.Active := false;
  FQuery.SQL.Clear;
end;

function TModelPedido.DataPedido(value: TDateTime): IModelPedido;
begin
  Result := self;
  FDataPedido := value;
end;

function TModelPedido.DeletaPedido: IModelPedido;
begin
  Result := self;
  DM.FDConexao.StartTransaction;
  try
    FQuery.SQL.Add('delete from wkvenda.tb_pedido where id_pedido = :idpedido');
    FQuery.ParamByName('idpedido').AsInteger := FCodPedido;
    fQuery.ExecSQL;
    DM.FDConexao.Commit;
  except
    DM.FDConexao.Rollback;
  end;
end;

destructor TModelPedido.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TModelPedido.GravaPedido: IModelPedido;
begin
  Result := self;
  DM.FDConexao.StartTransaction;
  try
    FQuery.SQL.Add('INSERT INTO wkvenda.tb_pedido (cod_cliente, dat_pedido, val_pedido) values (:cod_cliente, :dat_pedido, :val_pedido)');
    FQuery.ParamByName('cod_cliente').AsInteger := FCodCliente;
    FQuery.ParamByName('dat_pedido').AsDateTime := FDataPedido;
    fQuery.ParamByName('val_pedido').AsFloat := FValorPedido;
    FQuery.ExecSQL;
    DM.FDConexao.Commit;
  except
    DM.FDConexao.Rollback;
  end;
end;

class function TModelPedido.New: IModelPedido;
begin
  Result := self.Create;
end;

function TModelPedido.ValorPedido(value: Double): IModelPedido;
begin
  Result := self;
  FValorPedido := value;
end;

end.

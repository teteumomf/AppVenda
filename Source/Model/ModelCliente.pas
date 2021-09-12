unit ModelCliente;

interface

uses Cliente, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, DMConexao, System.SysUtils, System.Classes;

type
  TModelCliente = class(TInterfacedObject, IModelCliente)
  private
    FQuery: TFDQuery;

    FCodCliente: integer;
    FNomeCliente: string;
    FCidadeCliente: string;
    FEstadoCliente: string;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelCliente;

    function CodCliente(value: integer): IModelCliente;
    function NomeCliente(nome: string): IModelCliente;
    function CidadeCliente(cidade: string): IModelCliente;
    function EstadoCliente(estado: string): IModelCliente;
    function RetornaCliente(FList: TStringList): IModelCliente;

  end;

implementation

{ TModelCliente }

function TModelCliente.CidadeCliente(cidade: string): IModelCliente;
begin
  Result := self;
  FCidadeCliente := cidade;
end;

function TModelCliente.CodCliente(value: integer): IModelCliente;
begin
  Result := self;
  FCodCliente := value;
end;

constructor TModelCliente.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DM.FDConexao;
  FQuery.Active := false;
  FQuery.SQL.Clear;
end;

destructor TModelCliente.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TModelCliente.EstadoCliente(estado: string): IModelCliente;
begin
  Result := self;
  FEstadoCliente := estado;
end;

class function TModelCliente.New: IModelCliente;
begin
  Result := self.Create;
end;

function TModelCliente.NomeCliente(nome: string): IModelCliente;
begin
  Result := self;
  FNomeCliente := nome;
end;

function TModelCliente.RetornaCliente(FList: TStringList): IModelCliente;
begin
  Result := self;

  FQuery.SQL.Add('SELECT * FROM wkvenda.tb_clientes where id_cliente = :idcliente;');
  FQuery.ParamByName('idcliente').AsInteger := FCodCliente;
  FQuery.Open;

  //FQuery.Open('SELECT * FROM wkvenda.tb_clientes where id_cliente = ' + FCodCliente.ToString);
  for var i := 0 to FQuery.FieldCount - 1 do
  begin
    FList.Add(FQuery.Fields[i].AsString);
    FQuery.Next;
  end;
end;

end.

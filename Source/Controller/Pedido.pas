unit Pedido;

interface

uses
  FireDAC.Comp.Client;

type
  IModelPedido = interface
    ['{DCCCF2BA-8911-4EF3-814A-E1D52E1565DC}']
    function CodPedido(value: integer): IModelPedido;
    function CodCliente(value: integer): IModelPedido;
    function DataPedido(value: TDateTime): IModelPedido;
    function ValorPedido(value: double): IModelPedido;
    function GravaPedido: IModelPedido;
    function DeletaPedido: IModelPedido;
    function BuscaPedido: string;

  end;

  IModelPedidoItens = interface
    ['{93B613C3-E5FD-46BC-962A-A71A954D77E6}']
    function CodPedido(value: integer): IModelPedidoItens;
    function GravaPedidoItens(FTable: TFDMemTable): IModelPedidoItens;
    function DeletaPedidoItens: IModelPedidoItens;
    function BuscaPedidoItens(FTable: TFDMemTable): IModelPedidoItens;
  end;

implementation

end.

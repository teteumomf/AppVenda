unit Cliente;

interface

uses
  System.Classes;

type
  IModelCliente = Interface
    ['{E1424B5A-1B2C-417C-B767-0A25AB0C9201}']
  function CodCliente(value:integer): IModelCliente;
  function NomeCliente(nome:string): IModelCliente;
  function CidadeCliente(cidade:string): IModelCliente;
  function EstadoCliente(estado:string): IModelCliente;
  function RetornaCliente(FList: TStringList): IModelCliente;

  End;

implementation

end.

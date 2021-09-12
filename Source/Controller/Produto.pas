unit Produto;

interface

uses
  System.Classes, FireDAC.Comp.Client;

type
  IModelProduto = Interface
    ['{2EEF0751-FC27-4553-9B12-7036438A1846}']
    function CodProduto(value: integer): IModelProduto;
    function IdItens(value:integer):IModelProduto;
    function NomeProduto(value:string): IModelProduto;
    function Quantidade(value:double) : IModelProduto;
    function ValorUnitario(value:double): IModelProduto;
    function ValorTotal(value:double): IModelProduto;
    function CalcValorTotal : string;
    function ValorDaCompra(FTable: TFDMemTable): string;
    function PopTabela(FTable: TFDMemTable) : IModelProduto;
    function EditTabela(FTable: TFDMemTable) : IModelProduto;
    function DeletaTabela(FTable:TFDMemTable) : IModelProduto;
    function RetornaProduto(FList: TStringList): IModelProduto;
  End;

implementation

end.

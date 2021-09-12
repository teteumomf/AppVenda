unit DMUtil;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMAuxiliar = class(TDataModule)
    ds_ListaPedidos: TDataSource;
    mem_Produtos: TFDMemTable;
    mem_ProdutosORDEM: TAutoIncField;
    mem_ProdutosCODIGO: TIntegerField;
    mem_ProdutosPRODUTO: TStringField;
    mem_ProdutosQUANTIDADE: TFloatField;
    mem_ProdutosVALOR: TFloatField;
    mem_ProdutosTOTAL: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMAuxiliar: TDMAuxiliar;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

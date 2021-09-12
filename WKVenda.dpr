program WKVenda;

uses
  Vcl.Forms,
  untPrincipal in 'Source\View\untPrincipal.pas' {Form1},
  DMConexao in 'Source\Componente\DMConexao.pas' {DM: TDataModule},
  Cliente in 'Source\Controller\Cliente.pas',
  ModelCliente in 'Source\Model\ModelCliente.pas',
  Produto in 'Source\Controller\Produto.pas',
  ModelProduto in 'Source\Model\ModelProduto.pas',
  Functions in 'Source\Util\Functions.pas',
  DMUtil in 'Source\Componente\DMUtil.pas' {DMAuxiliar: TDataModule},
  Pedido in 'Source\Controller\Pedido.pas',
  ModelPedido in 'Source\Model\ModelPedido.pas',
  ModelPedidoItens in 'Source\Model\ModelPedidoItens.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDMAuxiliar, DMAuxiliar);
  Application.Run;
end.

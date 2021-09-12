unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, ModelCliente, ModelProduto, ModelPedidoItens,
  ModelPedido;

type
  TForm1 = class(TForm)
    edCodCliente: TEdit;
    lblCodCliente: TLabel;
    edNome: TEdit;
    edCidade: TEdit;
    lblNomeCliente: TLabel;
    lblCidade: TLabel;
    edEstado: TEdit;
    lblEstado: TLabel;
    edCodProduto: TEdit;
    lblCodProduto: TLabel;
    edDescProduto: TEdit;
    edQtd: TEdit;
    lblDescProduto: TLabel;
    lblQtd: TLabel;
    edValor: TEdit;
    lblValor: TLabel;
    PanelB: TPanel;
    PanelC: TPanel;
    btnInserir: TButton;
    PanelA: TPanel;
    edNumeroPedido: TEdit;
    lblNumeroPedido: TLabel;
    btnCarregar: TButton;
    btnCancelar: TButton;
    lblPedido: TLabel;
    Label1: TLabel;
    db_Produtos: TDBGrid;
    PanelD: TPanel;
    lblValorTotal: TLabel;
    lblValorT: TLabel;
    edValorT: TEdit;
    btnGravar: TButton;
    procedure edCodClienteChange(Sender: TObject);
    procedure edCodProdutoChange(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure edValorChange(Sender: TObject);
    procedure edQtdChange(Sender: TObject);
    procedure db_ProdutosCellClick(Column: TColumn);
    procedure db_ProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    identificador, id_prod: integer;

  public
    { Public declarations }
    procedure Clean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses DMUtil, Functions;

procedure TForm1.btnInserirClick(Sender: TObject);
begin
  if (StrToInt(edCodProduto.Text) = id_prod) and
    (DMAuxiliar.mem_Produtos.Locate('iditens', identificador,
    [loCaseInsensitive, loPartialKey])) then
  begin
    if MessageDlg('Quer alterar esse produto?', mtConfirmation, [mbYes, mbNo],
      0) = mrYes then
    begin
      TModelProduto.new.IdItens(identificador)
        .CodProduto(StrToInt(edCodProduto.Text))
        .ValorUnitario(StrParaDouble(edValor.Text))
        .Quantidade(StrParaDouble(edQtd.Text))
        .ValorTotal(StrParaDouble(edValorT.Text))
        .EditTabela(DMAuxiliar.mem_Produtos);
    end;
  end
  else
    TModelProduto.new.CodProduto(StrToInt(edCodProduto.Text))
      .NomeProduto(edDescProduto.Text).ValorUnitario(StrToFloat(edValor.Text))
      .Quantidade(StrToFloat(edQtd.Text)).ValorTotal(StrToFloat(edValorT.Text))
      .PopTabela(DMAuxiliar.mem_Produtos);

  lblValorTotal.Caption := 'Valor Total - R$' + TModelProduto.new.ValorDaCompra
    (DMAuxiliar.mem_Produtos);
  lblValorTotal.Visible := true;
end;

procedure TForm1.btnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar o pedido?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    TModelPedidoItens.new.CodPedido(StrToInt(edNumeroPedido.Text)).DeletaPedidoItens;
    TModelPedido.new.CodPedido(StrToInt(edNumeroPedido.Text)).DeletaPedido;
    lblValorTotal.Caption := 'Valor Total: R$0,00';
  end;
end;

procedure TForm1.btnCarregarClick(Sender: TObject);
begin
  edCodCliente.Text := TModelPedido.New.CodPedido(StrToInt(edNumeroPedido.Text)).BuscaPedido;

  TModelPedidoItens.New.CodPedido(StrToInt(edNumeroPedido.Text)).BuscaPedidoItens(DMAuxiliar.mem_Produtos);

  lblValorTotal.Caption := 'Valor Total - R$' + TModelProduto.new.ValorDaCompra(DMAuxiliar.mem_Produtos);
end;

procedure TForm1.btnGravarClick(Sender: TObject);
begin
  if ((edCodCliente.Text <> EmptyStr) or (edCodCliente.Text <> '0')) and (DMAuxiliar.mem_Produtos.RecordCount <> 0) then
  begin
    TModelPedido.new.CodCliente(StrToInt(edCodCliente.Text)).DataPedido(now)
    .ValorPedido(StrParaDouble(TModelProduto.new.ValorDaCompra(DMAuxiliar.mem_Produtos))).GravaPedido;

    TModelPedidoItens.new.GravaPedidoItens(DMAuxiliar.mem_Produtos);

    Clean;
  end;

end;

procedure TForm1.Clean;
begin
  edCodCliente.Text := EmptyStr;
  edCidade.Text := EmptyStr;
  edNome.Text := EmptyStr;
  edEstado.Text := EmptyStr;

  edCodProduto.Text := EmptyStr;
  edDescProduto.Text := EmptyStr;
  edQtd.Text := EmptyStr;
  edValor.Text := EmptyStr;
  edValorT.Text := EmptyStr;

  DMAuxiliar.mem_Produtos.EmptyDataSet;
  lblValorTotal.Caption := 'Valor Total - R$0,00';
end;

procedure TForm1.db_ProdutosCellClick(Column: TColumn);
begin
  identificador := db_Produtos.DataSource.DataSet.FieldByName('iditens')
    .AsInteger;
  id_prod := db_Produtos.DataSource.DataSet.FieldByName('cod_produto')
    .AsInteger;
  edCodProduto.Text := IntToStr(db_Produtos.DataSource.DataSet.FieldByName
    ('cod_produto').AsInteger);
  edQtd.Text := db_Produtos.DataSource.DataSet.FieldByName
    ('qtd_produtos').AsString;
  edValor.Text := db_Produtos.DataSource.DataSet.FieldByName
    ('val_unitario').AsString;
  edValorChange(self);
end;

procedure TForm1.db_ProdutosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    if MessageDlg('Deseja Apagar o Registro ?', mtConfirmation, [mbYes, mbNo],
      0) = mrYes then
    begin
      TModelProduto.new.DeletaTabela(DMAuxiliar.mem_Produtos);
    end;
  end
  else if Key = VK_RETURN then
  begin
    identificador := db_Produtos.DataSource.DataSet.FieldByName('iditens')
      .AsInteger;
    id_prod := db_Produtos.DataSource.DataSet.FieldByName('cod_produto')
      .AsInteger;
    edCodProduto.Text := IntToStr(db_Produtos.DataSource.DataSet.FieldByName
      ('cod_produto').AsInteger);
    edQtd.Text := db_Produtos.DataSource.DataSet.FieldByName
      ('qtd_produtos').AsString;
    edValor.Text := db_Produtos.DataSource.DataSet.FieldByName
      ('val_unitario').AsString;
    edValorChange(self);
  end;

end;

procedure TForm1.edCodClienteChange(Sender: TObject);
var
  List: TStringList;
begin
  if (edCodCliente.Text = EmptyStr) or (edCodCliente.Text = '0') then
  begin
    PanelA.Visible := true;
    edNome.Text := EmptyStr;
    edCidade.Text := EmptyStr;
    edEstado.Text := EmptyStr;
    edCodProduto.Text := EmptyStr;
    edDescProduto.Text := EmptyStr;
    edQtd.Text := EmptyStr;
    edValor.Text := EmptyStr;
  end
  else
    PanelA.Visible := false;

  List := TStringList.Create;
  try
    if edCodCliente.Text <> '' then
    begin
      TModelCliente.new.CodCliente(StrToInt(edCodCliente.Text))
        .RetornaCliente(List);

      edNome.Text := List[1];
      edCidade.Text := List[2];
      edEstado.Text := List[3];

    end;
  finally
    FreeAndNil(List);
  end;
end;

procedure TForm1.edCodProdutoChange(Sender: TObject);
var
  List: TStringList;
begin
  List := TStringList.Create;
  try
    if edCodProduto.Text <> '' then
    begin
      TModelProduto.new.CodProduto(StrToInt(edCodProduto.Text))
        .RetornaProduto(List);

      edDescProduto.Text := List[1];
    end;
  finally
    FreeAndNil(List);
  end;
end;

procedure TForm1.edQtdChange(Sender: TObject);
begin
  if (edQtd.Text = '0') or (edQtd.Text = EmptyStr) then
    edQtd.Text := '1';
  if edValor.Text = '' then
    edValor.Text := '0';

  edValorT.Text := TModelProduto.new.Quantidade(StrParaDouble(edQtd.Text))
    .ValorUnitario(StrParaDouble(edValor.Text)).CalcValorTotal;
end;

procedure TForm1.edValorChange(Sender: TObject);
begin
  if (edQtd.Text = '0') or (edQtd.Text = EmptyStr) then
    edQtd.Text := '1';
  if edValor.Text = '' then
    edValor.Text := '0';

  edValorT.Text := TModelProduto.new.Quantidade(StrParaDouble(edQtd.Text))
    .ValorUnitario(StrParaDouble(edValor.Text)).CalcValorTotal;
end;

end.

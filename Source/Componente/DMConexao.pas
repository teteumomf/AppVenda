unit DMConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB;

type
  TDM = class(TDataModule)
    FDConexao: TFDConnection;
    FDTransaction: TFDTransaction;
    DriverMySQl: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses
  Vcl.Forms, Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  FDConexao.Connected := false;
  try
    FDConexao.Params.Clear;
    FDConexao.Params.Values['DriverID'] := 'MySQL';
    FDConexao.Params.Values['Server'] := 'localhost';
    FDConexao.Params.Values['Port'] := '3306';
    FDConexao.Params.Values['DataBase'] := 'wkvenda';
    FDConexao.Params.Values['User_name'] := 'root';
    FDConexao.Params.Values['Password'] := '1234';
    FDConexao.Connected := true;
  except
    on E: Exception do
    begin
      ShowMessage('Não foi possível conectar com o banco de dados!' + sLineBreak + E.Message);
      Application.Terminate;
    end;
  end;
end;

end.

unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Data.DB, Data.Win.ADODB;

type
  TfrmMain = class(TForm)
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.Button1Click(Sender: TObject);
var
  Connection: TADOConnection;
  Query: TADOQuery;
  i: integer;
begin
  StringGrid1.RowCount := 0;
  Connection := TADOConnection.Create(nil);
  try
    Query := TADOQuery.Create(nil);
    try
      Connection.LoginPrompt := False;
      Connection.ConnectionString := 'Provider=ADsDSOObject;Encrypt Password=False;Mode=Read;Bind Flags=0';

      Query.SQL.Text := Memo1.Lines.Text;
      Query.Connection := Connection;
      // Query.Properties('Page Size') := 100;
      // Query.Properties('Timeout') := 30;
      // Query.Properties('Cache Results') := False;

      Query.Open;
      Query.Last;
      Query.First;
      StringGrid1.RowCount := Query.RecordCount;
      StringGrid1.ColCount := Query.FieldCount;
      while not Query.eof do
      begin
        for i := 0 to Query.FieldCount - 1 do
        begin
          StringGrid1.Cells[i, Query.RecNo] := Query.Fields[i].AsString;
        end;
        Query.Next;
      end;
    finally
      Query.Free;
    end;
  finally
    Connection.Free;
  end;

end;

end.

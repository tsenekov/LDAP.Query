program ldap_console;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils, Data.DB, Data.Win.ADODB, ActiveX;

var
  Connection: TADOConnection;
  Query: TADOQuery;
  i: integer;
  req, line: string;

begin
  try
    req := 'SELECT CN,msExchHomeServerName FROM ''LDAP://OU=Users,OU=NetGenIT,DC=netgenit,DC=local'' WHERE objectClass=''User'' AND UserAccountControl <> 514';

    CoInitialize(nil);
    Connection := TADOConnection.Create(nil);
    Query := TADOQuery.Create(nil);
    try

      Connection.LoginPrompt := False;
      Connection.ConnectionString := 'Provider=ADsDSOObject;Encrypt Password=False;Mode=Read;Bind Flags=0';
      Query.Connection := Connection;
      Query.SQL.Text := req;
      // Query.Properties('Page Size') := 100;
      // Query.Properties('Timeout') := 30;
      // Query.Properties('Cache Results') := False;

      Query.Open;
      Query.Last;
      Query.First;

      // Get all entries
      while not Query.eof do
      begin
        line := '';
        for i := 0 to Query.FieldCount - 1 do
        begin
          line := line + Query.Fields[i].AsString + ';';
        end;
        Writeln(line);
        Query.Next;
      end;

    finally
      Query.Free;
      Connection.Free;
      CoUnInitialize;
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.

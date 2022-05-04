unit LogDownloadDAO;

interface

uses
  QueryInterface, LogDownloadDAOInterface, Data.DB;

type

  TLogDownloadDAO = class(TInterfacedObject, iLogDownloadDAO)

  private

    FQuery: iQuery;
    function ObterProximoCodigo: Integer;

  public

    constructor Create;
    destructor Destroy; override;
    class function New: TLogDownloadDAO;
    function Listar(Value: TDataSource): iLogDownloadDAO;
    function Gravar(URL: String): iLogDownloadDAO;

  end;

implementation

uses
  FactoryQueryController, System.SysUtils;

{ TLogDownloadDAO }

constructor TLogDownloadDAO.Create;
begin

  FQuery := TFactoryQueryController.New.Query;

end;

destructor TLogDownloadDAO.Destroy;
begin

  inherited;

end;

function TLogDownloadDAO.Listar(Value: TDataSource): iLogDownloadDAO;
begin

  Result := Self;
  FQuery.SQL('SELECT * FROM LOGDOWNLOAD');
  Value.DataSet := FQuery.DataSet;

end;

function TLogDownloadDAO.Gravar(URL: String): iLogDownloadDAO;
begin

  FQuery.Execute('INSERT INTO LOGDOWNLOAD  ' +
                 '           (CODIGO,      ' +
                 '            URL,         ' +
                 '            DATAINICIO,  ' +
                 '            DATAFIM)     ' +
                 '   VALUES (' + ObterProximoCodigo.ToString + ',' +
                  QuotedStr(URL) + ', ' +
                  QuotedStr(FormatDateTime('yyyy-mm-dd', Date)) + ', '+
                  QuotedStr(FormatDateTime('yyyy-mm-dd', Date)) + ')');

end;

class function TLogDownloadDAO.New: TLogDownloadDAO;
begin

  Result := Self.Create;

end;

function TLogDownloadDAO.ObterProximoCodigo: Integer;
begin

  FQuery.SQL('SELECT MAX(CODIGO) AS CODIGO FROM LOGDOWNLOAD');
  Result := FQuery.DataSet.FieldByName('CODIGO').AsInteger + 1;

end;

end.

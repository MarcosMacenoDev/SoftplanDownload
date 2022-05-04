unit LogDownloadDAOInterface;

interface

uses
  Data.DB;

type

  iLogDownloadDAO = interface

    ['{F3EABD5F-159C-4E24-96A7-A7EA6B745942}']
    function Listar(Value: TDataSource): iLogDownloadDAO;
    function Gravar(URL: String): iLogDownloadDAO;

  end;

implementation

end.

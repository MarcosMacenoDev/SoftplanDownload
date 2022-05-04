unit HistoricoDownloadsView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  LogDownloadDAOInterface;

type
  TFHistoricoDownloadsView = class(TForm)
    dsLogDownloads: TDataSource;
    DBGridLogDownloads: TDBGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FLogDownloads: iLogDownloadDAO;
  public
    { Public declarations }
  end;

var
  FHistoricoDownloadsView: TFHistoricoDownloadsView;

implementation

uses
  LogDownloadDAO;

{$R *.dfm}

procedure TFHistoricoDownloadsView.FormCreate(Sender: TObject);
begin

  FLogDownloads := TLogDownloadDAO.New;
  FLogDownloads.Listar(dsLogDownloads);

end;

end.

program PSoftplanDownloads;

uses
  System.SysUtils,
  Vcl.Forms,
  PrincipalView in 'Views\PrincipalView.pas' {FPrincipalView},
  ConexaoInterface in 'Interfaces\ConexaoInterface.pas',
  ConexaoFiredacModel in 'Models\ConexaoFiredacModel.pas',
  QueryFiredacModel in 'Models\QueryFiredacModel.pas',
  QueryInterface in 'Interfaces\QueryInterface.pas',
  FactoryQueryController in 'Controllers\FactoryQueryController.pas',
  FactoryQueryControllerInterface in 'Interfaces\FactoryQueryControllerInterface.pas',
  LogDownloadDAO in 'DAO\LogDownloadDAO.pas',
  LogDownloadDAOInterface in 'Interfaces\LogDownloadDAOInterface.pas',
  HttpClientInterface in 'Interfaces\HttpClientInterface.pas',
  FireDAC.Comp.Client,
  HttpClientNetModel in 'Models\HttpClientNetModel.pas',
  HistoricoDownloadsView in 'Views\HistoricoDownloadsView.pas' {FHistoricoDownloadsView},
  FactoryHttpClient in 'Interfaces\FactoryHttpClient.pas',
  FactoryHttpClientController in 'Controllers\FactoryHttpClientController.pas',
  ControlsDownloadModel in 'Models\ControlsDownloadModel.pas',
  ThreadDownloadModel in 'Models\ThreadDownloadModel.pas',
  PrincipalController in 'Controllers\PrincipalController.pas',
  ObserverInterface in 'Interfaces\ObserverInterface.pas',
  SubjectModel in 'Models\SubjectModel.pas',
  ObserverModel in 'Models\ObserverModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  FConexao := TFDConnection(TConexaoFiredacModel.New(ExtractFilePath(Application.ExeName) + 'database\dbSoftplanDownloads.db').Connection);
  Application.CreateForm(TFPrincipalView, FPrincipalView);
  Application.Run;
end.

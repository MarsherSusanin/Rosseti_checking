unit GlobalVar;


interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, System.IOUtils, System.JSON, XSuperObject,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  FMX.ScrollBox, FMX.Memo;

Var
 BaseUrl : string;
 user_id, fio, flash_user_id, userType, allUsers : string;
 Listworkorders : TStringList;
 WorkorderL,WorkorderL1,WorkorderL0 : string;

implementation

end.

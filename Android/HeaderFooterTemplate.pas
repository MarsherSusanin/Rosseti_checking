unit HeaderFooterTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, System.IOUtils, System.JSON, XSuperObject,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  FMX.ScrollBox, FMX.Memo, FMX.ListBox, FMX.Objects, FMX.Ani;

type
  THeaderFooterForm = class(TForm)
    StyleBook1: TStyleBook;
    IdHTTP1: TIdHTTP;
    Rectangle1: TRectangle;
    RoundRect1: TRoundRect;
    Rectangle2: TRectangle;
    GradientAnimation1: TGradientAnimation;
    Label2: TLabel;
    RoundRect3: TRoundRect;
    Label3: TLabel;
    Label4: TLabel;
    RoundRect2: TRoundRect;
    Label5: TLabel;
    RoundRect4: TRoundRect;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    Rectangle3: TRectangle;
    RoundRect5: TRoundRect;
    Label10: TLabel;
    RoundRect6: TRoundRect;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label9: TLabel;
    function GetNewWorkOrders : string;
    function GetAllUsersFromType : string;
    function GetTypeFromUserId : string;
    function GetFioFromUserId : string;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RoundRect1Click(Sender: TObject);
    procedure RoundRect5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeaderFooterForm: THeaderFooterForm;
  //sForm : TForm1;


implementation

{$R *.fmx}

uses main, GlobalVar, Unitworkorder;

function THeaderFooterForm.GetNewWorkOrders : string;
var
  login_url: string;
  sResponse: string;
  JsonToSend: TStringList;
  O: ISuperObject;
begin
  //
  login_url:= BaseUrl+'get_new_workorders/';
  //ShowMessage(login_url);
  //ShowMessage(flash_user_id);

  try
   IdHTTP1.HandleRedirects := true;
   IdHTTP1.ReadTimeout := 5000;

   IdHTTP1.Request.UserAgent:='Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36';
   IdHTTP1.Request.Accept := 'application/json, text/javascript, */*; q=0.01';
   IdHTTP1.Request.ContentType := 'application/x-www-form-urlencoded; charset=UTF-8';
   IdHTTP1.Request.CharSet:='utf-8';

   jsonToSend := TStringList.create;
   jsonToSend.values['user_id'] := flash_user_id;

   try
    sResponse := IdHTTP1.post(login_url, jsonToSend);
   except
    on E: Exception do
     ShowMessage('Error on request: '#13#10 + e.Message);
   end;
  finally
   jsonToSend.free;
  end;

  GetNewWorkOrders := sResponse;
end;

function THeaderFooterForm.GetAllUsersFromType : string;
var
  login_url: string;
  sResponse: string;
  JsonToSend: TStringList;
  O: ISuperObject;
begin
  //
  login_url:= BaseUrl+'get_all_users_from_type/';
  //ShowMessage(login_url);
  //ShowMessage(flash_user_id);

  try
   IdHTTP1.HandleRedirects := true;
   IdHTTP1.ReadTimeout := 5000;

   IdHTTP1.Request.UserAgent:='Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36';
   IdHTTP1.Request.Accept := 'application/json, text/javascript, */*; q=0.01';
   IdHTTP1.Request.ContentType := 'application/x-www-form-urlencoded; charset=UTF-8';
   IdHTTP1.Request.CharSet:='utf-8';

   jsonToSend := TStringList.create;
   jsonToSend.values['itype'] := flash_user_id;

   try
    sResponse := IdHTTP1.post(login_url, jsonToSend);
   except
    on E: Exception do
     ShowMessage('Error on request: '#13#10 + e.Message);
   end;
  finally
   jsonToSend.free;
  end;

  GetAllUsersFromType := sResponse;
end;

function THeaderFooterForm.GetTypeFromUserId : string;
var
  login_url: string;
  sResponse: string;
  JsonToSend: TStringList;
  O: ISuperObject;
begin
  //
  login_url:= BaseUrl+'get_type_from_user_id/';
  //ShowMessage(login_url);
  //ShowMessage(flash_user_id);

  try
   IdHTTP1.HandleRedirects := true;
   IdHTTP1.ReadTimeout := 5000;

   IdHTTP1.Request.UserAgent:='Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36';
   IdHTTP1.Request.Accept := 'application/json, text/javascript, */*; q=0.01';
   IdHTTP1.Request.ContentType := 'application/x-www-form-urlencoded; charset=UTF-8';
   IdHTTP1.Request.CharSet:='utf-8';

   jsonToSend := TStringList.create;
   jsonToSend.values['user_id'] := flash_user_id;

   try
    sResponse := IdHTTP1.post(login_url, jsonToSend);
   except
    on E: Exception do
     ShowMessage('Error on request: '#13#10 + e.Message);
   end;
  finally
   jsonToSend.free;
  end;

  GetTypeFromUserId := sResponse;
end;


procedure THeaderFooterForm.RoundRect1Click(Sender: TObject);
begin
 WorkorderL:=Listworkorders[1];
 Form2.show;
end;

procedure THeaderFooterForm.RoundRect5Click(Sender: TObject);
begin
 WorkorderL:=Listworkorders[0];
 Form2.show;
end;

function THeaderFooterForm.GetFioFromUserId : string;
var
  login_url: string;
  sResponse: string;
  JsonToSend: TStringList;
  O: ISuperObject;
begin
  //
  login_url:= BaseUrl+'get_fio_from_user_id/';
  //ShowMessage(login_url);
  //ShowMessage(flash_user_id);

  try
   IdHTTP1.HandleRedirects := true;
   IdHTTP1.ReadTimeout := 5000;

   IdHTTP1.Request.UserAgent:='Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36';
   IdHTTP1.Request.Accept := 'application/json, text/javascript, */*; q=0.01';
   IdHTTP1.Request.ContentType := 'application/x-www-form-urlencoded; charset=UTF-8';
   IdHTTP1.Request.CharSet:='utf-8';

   jsonToSend := TStringList.create;
   jsonToSend.values['user_id'] := flash_user_id;

   try
    sResponse := IdHTTP1.post(login_url, jsonToSend);
   except
    on E: Exception do
     ShowMessage('Error on request: '#13#10 + e.Message);
   end;
  finally
   jsonToSend.free;
  end;

  GetFioFromUserId := sResponse;
end;

procedure THeaderFooterForm.FormCreate(Sender: TObject);
begin
 Listworkorders:=TStringList.Create;
end;

procedure THeaderFooterForm.FormShow(Sender: TObject);
Var
  i : integer;
  f : TextFile;
  s,FileName,st,str : string;
  JsonObject,Json: TJSONObject;
  JSONEnum: TJSONObject.TEnumerator;
  O,P: ISuperObject;
  sForm : TForm1;
begin
 //Rectangle2.Fill.Color:=
 JsonObject:=TJSONObject.Create;
 FileName  := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetHomePath, 'settings.json');
 //ShowMessage(FileName);
 if FileExists(fileName) then
  begin
   // transport json file to superobject;
   O:= TSuperObject.ParseFile(FileName, False);
   // get value of object memeber
   BaseUrl:=O.S['base_url'];
   user_id:=O.S['user_id'];
   //ShowMessage(O.AsJSON);
   if user_id<>'' then
    begin
     //ShowMessage(BaseUrl);
     flash_user_id:=user_id;
     fio := GetFioFromUserId;
     userType := GetTypeFromUserId;
     //flash_user_id:='Главный инженер';//'Электромонтер';
     //allUsers := GetAllUsersFromType;
    end;
  end;

 if user_id = '' then
  begin
   ShowMessage('Войдите в систему!');
   Form1.Show;
   if user_id = '' then
    close;
  end
   else
    begin
      Label9.Text:='Соединение с сервером...';
      Label1.Text:=userType+#10#13+fio;

      flash_user_id:=user_id;
      st:=GetNewWorkOrders;

      i:=2;
      while i<length(st) do
       begin
        str:='';
        while st[i]<>'}' do
         begin
          str:=str+st[i];
          i:=i+1;
         end;
        str:=str+st[i];
        Listworkorders.Add(str);
        i:=i+2;
       end;


      //FileName:=System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetHomePath, 'set1.json');
      //assignfile(f,FileName);
      //rewrite(f);
      //writeln(f,Listworkorders[1]);
      //closefile(f);
      //P:=TSuperObject.ParseFile(FileName, False);
      //Label7.Text:='Распоряжение № '+P.S['nameworkorder'];
      //Label8.Text:=P.S['nameworkplace'];
      //WorkorderL1:=P.S['workorder_id'];

      //FileName:=System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetHomePath, 'set0.json');
      //assignfile(f,FileName);
      //rewrite(f);
      //writeln(f,Listworkorders[0]);
      //closefile(f);
      //P:=TSuperObject.ParseFile(FileName, False);
      //Label12.Text:='Распоряжение № '+P.S['nameworkorder'];
      //Label13.Text:=P.S['nameworkplace'];
      //WorkorderL0:=P.S['workorder_id']

      JSON:=TJSONObject.ParseJSONValue(Listworkorders[1],False, True) as TJSONObject;
      Label7.Text:='Распоряжение № '+JSON.Values['nameworkorder'].Value;
      Label8.Text:=JSON.Values['nameworkplace'].Value;

      ShowMessage(Listworkorders[0]);
      JSON:=TJSONObject.ParseJSONValue(Listworkorders[0],False, True) as TJSONObject;
      Label12.Text:='Распоряжение № '+JSON.Values['nameworkorder'].Value;
      Label13.Text:=JSON.Values['nameworkplace'].Value;

      Label9.Text:='Сегодня 2 Распоряжения';

    end;
end;

end.

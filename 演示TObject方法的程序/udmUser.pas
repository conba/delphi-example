unit udmUser;

interface
uses
  SysUtils, Classes, DBClient, Provider, DB, ADODB;
type
  TUserDM = class(TDataModule)
    adoUser: TADOConnection;
    AdqByName: TADOQuery;
    dspUser: TDataSetProvider;
    adqTemp: TADOQuery;
  end;

implementation

end.

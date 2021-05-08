unit uPMDataConst;

interface
uses DB;
const
  RecordLevel = 'level'; // ��¼�ȼ�
  RecordReserveLevel = 'level2'; //Ԥ����¼�ȼ�
  TableName = 'self_att_tablename'; //���� ��key
  StateField = 'State_Info_Field'; //stateinfo�ֶ���
  isShowSelfNoDetail = 'isShowSelfNoDetail'; //�ֶ��� �����ӱ�����  ��û�дӱ��¼ʱ �Ƿ���ʾ���� 0����ʾ 1 ����ʾ
  DataSetAtt_Key_Variable = 'Variable'; //��������key
  DataSetatt_Key_MaxField = 'MaxField'; //���ֵ�ֶ�
  DataSetAtt_Key_ReBuild = 'ReBuild'; //ˢ����ͼʱ �Ƿ� ���� ����״̬
  DataSetAtt_Key_TableVersion = 'TableVersion'; // ��汾��Ϣ    .
  DataSetAtt_Key_UserName = 'UserName'; //�û���������
  DataSetAtt_Key_ShowName = 'ShowName'; //��ʾ����
  DataSetAtt_Key_DataStructCode = 'DataStructCode'; // ����ģ�ͱ�ʶ
  ftStrings = [ftString, ftWideString, ftGuid];

const
  cst_logname = 'ys.log';
  //DataSet Log Code
  cst_error_ED_0001 = 'ED_0001 ';  //
  cst_error_ED_0002 = 'ED_0002 ';  //
  cst_error_ED_0003 = 'ED_0003 ';  //
  cst_error_ED_0004 = 'ED_0004 ';  //
  cst_error_ED_0005 = 'ED_0005 ';  //
  cst_error_ED_0006 = 'ED_0006 ';  //
  cst_error_ED_0007 = 'ED_0007 ';  //
  cst_error_ED_0008 = 'ED_0008 ';  //
  cst_error_ED_0009 = 'ED_0009 ';  //
  cst_error_ED_0010 = 'ED_0010 ';  //
  cst_error_ED_0011 = 'ED_0011 ';  //
  cst_error_ED_0012 = 'ED_0012 ';  //
  cst_error_ED_0013 = 'ED_0013 ';  //
  cst_error_ED_0014 = 'ED_0014 ';  //
  cst_error_ED_0015 = 'ED_0015 ';  //
  cst_error_ED_0016 = 'ED_0016 ';  //
  cst_error_ED_0017 = 'ED_0017 ';  //
  cst_error_ED_0018 = 'ED_0018 ';  //
  cst_error_ED_0019 = 'ED_0019 ';  //
  cst_error_ED_0020 = 'ED_0020 ';  //
  cst_error_ED_0021 = 'ED_0021 ';  //
  cst_error_ED_0022 = 'ED_0022 ';  //
  cst_error_ED_0023 = 'ED_0023 ';  //
  cst_error_ED_0024 = 'ED_0024 ';  //
  cst_error_ED_0025 = 'ED_0025 ';  //
  cst_error_ED_0026 = 'ED_0026 ';  //
  cst_error_ED_0027 = 'ED_0027 ';  //
  cst_error_ED_0028 = 'ED_0028 ';  //
  cst_error_ED_0029 = 'ED_0029 ';  //
  cst_error_ED_0030 = 'ED_0030 ';  //
  cst_error_ED_0031 = 'ED_0031 ';  //
  cst_error_ED_0032 = 'ED_0032 ';  //
  cst_error_ED_0033 = 'ED_0033 ';  //
  cst_error_ED_0034 = 'ED_0034 ';  //
  cst_error_ED_0035 = 'ED_0035 ';  //
  cst_error_ED_0036 = 'ED_0036 ';  //
  cst_error_ED_0037 = 'ED_0037 ';  //
  cst_error_ED_0038 = 'ED_0038 ';  //
  cst_error_ED_0039 = 'ED_0039 ';  //
  cst_error_ED_0040 = 'ED_0040 ';  //

  //Save Log code
  cst_error_ES_0001 = 'ES_0001 ';  //
  cst_error_ES_0002 = 'ES_0002 ';  //
  cst_error_ES_0003 = 'ES_0003 ';  //
  cst_error_ES_0004 = 'ES_0004 ';  //
  cst_error_ES_0005 = 'ES_0005 ';  //
  cst_error_ES_0006 = 'ES_0006 ';  //
  cst_error_ES_0007 = 'ES_0007 ';  //
  cst_error_ES_0008 = 'ES_0008 ';  //
  cst_error_ES_0009 = 'ES_0009 ';  //
  cst_error_ES_0010 = 'ES_0010 ';  //
  cst_error_ES_0011 = 'ES_0011 ';  //
  cst_error_ES_0012 = 'ES_0012 ';  //
  cst_error_ES_0013 = 'ES_0013 ';  //
  cst_error_ES_0014 = 'ES_0014 ';  //
  cst_error_ES_0015 = 'ES_0015 ';  //
  cst_error_ES_0016 = 'ES_0016 ';  //
  cst_error_ES_0017 = 'ES_0017 ';  //
  cst_error_ES_0018 = 'ES_0018 ';  //
  cst_error_ES_0019 = 'ES_0019 ';  //
  cst_error_ES_0020 = 'ES_0020 ';  //
  cst_error_ES_0021 = 'ES_0021 ';  //
  cst_error_ES_0022 = 'ES_0022 '; //
  cst_error_ES_0023 = 'ES_0023 '; //
  cst_error_ES_0024 = 'ES_0024 '; //
  cst_error_ES_0025 = 'ES_0025 '; //
  cst_error_ES_0026 = 'ES_0026 '; //
  cst_error_ES_0027 = 'ES_0027 '; //
  cst_error_ES_0028 = 'ES_0028 '; //
  cst_error_ES_0029 = 'ES_0029 ';

type
  TPMSortOption = (pmDesc, pmAsc); //��������
  TMoveMode = (mmUp, mmDown, mmChild, mmSibling, mmNothing); //�ƶ�����
  TPMSortOptions = set of TPMSortOption;
  TStringArray = array of string;
  TPMFieldType = (fStr, fInt, fDou, fBoo, fLargeint, fWideStr{UTF-8����}); //�ֶ�
  TPMChangType = (cDelete, cAddAfter, cAddBefore, cUpdate, cMove);
  TFieldTypeByImport = (ftAppointFirst, ftSelfAdd, ftAuto); // ����ʱ �ֶ����ɹ���
  TViewStatus = (vDefault, vFiler, vSort, vSortFiler); //��ͼ�е����� ״̬
  TPMStateStatus = (stDefault, stReDo, stUnDo); // state״̬
  TPMViewType = (tDefault, tLinkVertical, tLinkRow, tLinkRecView); //��ͼ����
  TMarkStateStatus = (mDefault, mUpdate, mInsert, mDelete); // state����
  TPmComparerType = (cmInteger, cmString); //�Ա�����
  TPMRECHashMod = (phDGl, phDglInt, phHash2, phIniFile, phNone);
implementation

end.


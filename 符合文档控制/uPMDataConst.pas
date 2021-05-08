unit uPMDataConst;

interface
uses DB;
const
  RecordLevel = 'level'; // 记录等级
  RecordReserveLevel = 'level2'; //预留记录等级
  TableName = 'self_att_tablename'; //表名 的key
  StateField = 'State_Info_Field'; //stateinfo字段名
  isShowSelfNoDetail = 'isShowSelfNoDetail'; //字段名 关联从表特殊  当没有从表记录时 是否显示本身 0不显示 1 不显示
  DataSetAtt_Key_Variable = 'Variable'; //变量属性key
  DataSetatt_Key_MaxField = 'MaxField'; //最大值字段
  DataSetAtt_Key_ReBuild = 'ReBuild'; //刷新视图时 是否 保持 界面状态
  DataSetAtt_Key_TableVersion = 'TableVersion'; // 表版本信息    .
  DataSetAtt_Key_UserName = 'UserName'; //用户定义名称
  DataSetAtt_Key_ShowName = 'ShowName'; //显示名称
  DataSetAtt_Key_DataStructCode = 'DataStructCode'; // 数据模型标识
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
  TPMSortOption = (pmDesc, pmAsc); //排序类型
  TMoveMode = (mmUp, mmDown, mmChild, mmSibling, mmNothing); //移动类型
  TPMSortOptions = set of TPMSortOption;
  TStringArray = array of string;
  TPMFieldType = (fStr, fInt, fDou, fBoo, fLargeint, fWideStr{UTF-8编码}); //字段
  TPMChangType = (cDelete, cAddAfter, cAddBefore, cUpdate, cMove);
  TFieldTypeByImport = (ftAppointFirst, ftSelfAdd, ftAuto); // 导入时 字段生成规则
  TViewStatus = (vDefault, vFiler, vSort, vSortFiler); //视图中的数据 状态
  TPMStateStatus = (stDefault, stReDo, stUnDo); // state状态
  TPMViewType = (tDefault, tLinkVertical, tLinkRow, tLinkRecView); //视图类型
  TMarkStateStatus = (mDefault, mUpdate, mInsert, mDelete); // state类型
  TPmComparerType = (cmInteger, cmString); //对比类型
  TPMRECHashMod = (phDGl, phDglInt, phHash2, phIniFile, phNone);
implementation

end.


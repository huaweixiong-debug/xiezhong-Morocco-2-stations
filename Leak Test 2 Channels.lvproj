<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="14008000">
	<Property Name="varPersistentID:{072AAEF8-0B11-445D-975D-A77AB27D4ADF}" Type="Ref">/我的电脑/OPC.lvlib/B工位NG样件需求</Property>
	<Property Name="varPersistentID:{1332920D-0C52-4A55-998F-19A4F05AD6CA}" Type="Ref">/我的电脑/OPC.lvlib/B复位</Property>
	<Property Name="varPersistentID:{28482B57-79DA-4D55-B1CC-EB30CA434D86}" Type="Ref">/我的电脑/OPC.lvlib/A安全门禁用</Property>
	<Property Name="varPersistentID:{2900E0CC-F0B0-4E98-B846-3E0D8AA20C91}" Type="Ref">/我的电脑/OPC.lvlib/A工位校准时间到</Property>
	<Property Name="varPersistentID:{41665C77-F939-4DE9-A1A5-17457D2AA42C}" Type="Ref">/我的电脑/OPC.lvlib/B安全门禁用</Property>
	<Property Name="varPersistentID:{4383484B-0D10-4BDE-A132-7706875F4CF8}" Type="Ref">/我的电脑/OPC.lvlib/A手动夹紧</Property>
	<Property Name="varPersistentID:{44FC068B-3AAB-4444-9D6C-DE781C93657F}" Type="Ref">/我的电脑/OPC.lvlib/B手动封堵</Property>
	<Property Name="varPersistentID:{4BF255F1-F037-4C40-9A0B-76EB4DF72AED}" Type="Ref">/我的电脑/OPC.lvlib/B切换为手动</Property>
	<Property Name="varPersistentID:{4F5172F6-E9F1-48C8-8454-71B5722B0E10}" Type="Ref">/我的电脑/OPC.lvlib/B手动夹紧</Property>
	<Property Name="varPersistentID:{51347BB2-9FCC-4BCC-8D86-13FE433BB24F}" Type="Ref">/我的电脑/OPC.lvlib/A正负压开启</Property>
	<Property Name="varPersistentID:{59E0B9DA-CFBA-4939-BD9B-C3BDF1D9323B}" Type="Ref">/我的电脑/OPC.lvlib/A手动移载</Property>
	<Property Name="varPersistentID:{5A0CD94E-42A0-4F36-A252-BD6A80182843}" Type="Ref">/我的电脑/OPC.lvlib/B手动移载</Property>
	<Property Name="varPersistentID:{6F31EA25-E24F-44A7-9F41-B1B731D43393}" Type="Ref">/我的电脑/OPC.lvlib/A手动封堵</Property>
	<Property Name="varPersistentID:{7B86B4C1-022F-4659-A1EC-D5543A1DA985}" Type="Ref">/我的电脑/OPC.lvlib/B工位校准时间到</Property>
	<Property Name="varPersistentID:{7C18F4FB-6839-4495-B6DD-F2893BDDCD75}" Type="Ref">/我的电脑/OPC.lvlib/B扫码OK</Property>
	<Property Name="varPersistentID:{84B42357-8E17-4A7C-A157-7DDF2D54D0ED}" Type="Ref">/我的电脑/OPC.lvlib/A工位NG样件需求</Property>
	<Property Name="varPersistentID:{8D197590-5E8A-4F19-B025-BA7A06B30BC2}" Type="Ref">/我的电脑/OPC.lvlib/B正负压开启</Property>
	<Property Name="varPersistentID:{AEB0D065-64FA-4333-9238-756808135647}" Type="Ref">/我的电脑/OPC.lvlib/B启动信号</Property>
	<Property Name="varPersistentID:{B4790F6F-1636-432C-A136-53E1FD9E291D}" Type="Ref">/我的电脑/OPC.lvlib/A工位OK样件需求</Property>
	<Property Name="varPersistentID:{B5CF3893-34BC-40DF-849F-FAE56B2BAF4B}" Type="Ref">/我的电脑/OPC.lvlib/A复位</Property>
	<Property Name="varPersistentID:{C095D92A-028A-4924-9846-21CB8CFC8C0C}" Type="Ref">/我的电脑/OPC.lvlib/A手动盖章</Property>
	<Property Name="varPersistentID:{C2577DD8-DD84-45C1-837E-3A8FCB0C6139}" Type="Ref">/我的电脑/OPC.lvlib/A启动信号</Property>
	<Property Name="varPersistentID:{C6C7BC45-8ADF-4208-8550-35E283EAF988}" Type="Ref">/我的电脑/OPC.lvlib/B手动盖章</Property>
	<Property Name="varPersistentID:{C81334AC-14BB-45ED-BA97-69A93EC0E0AB}" Type="Ref">/我的电脑/OPC.lvlib/A切换为手动</Property>
	<Property Name="varPersistentID:{DB04B4C8-9A72-412C-9311-C148EF5DF08E}" Type="Ref">/我的电脑/OPC.lvlib/A扫码OK</Property>
	<Property Name="varPersistentID:{E3FB47FF-A973-41D6-9F4F-136704D33073}" Type="Ref">/我的电脑/OPC.lvlib/B工位OK样件需求</Property>
	<Item Name="我的电脑" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">我的电脑/VI服务器</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">我的电脑/VI服务器</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Main.vi" Type="VI" URL="../Main.vi"/>
		<Item Name="OPC.lvlib" Type="Library" URL="../OPC.lvlib"/>
		<Item Name="xz.ico" Type="Document" URL="../xz.ico"/>
		<Item Name="扫码查询.vi" Type="VI" URL="../扫码查询.vi"/>
		<Item Name="扫码查询B.vi" Type="VI" URL="../扫码查询B.vi"/>
		<Item Name="数据查询.vi" Type="VI" URL="../数据查询.vi"/>
		<Item Name="数据查询B.vi" Type="VI" URL="../数据查询B.vi"/>
		<Item Name="数据库保存子viB.vi" Type="VI" URL="../箱体气密机 2024/D/BaiduNetdiskWorkspace/OneDrive - business/A协众/气密机程序双腔双工位/箱体气密机 文件夹/新建文件夹/D/220902 Labview/Sub Vi/数据库保存子viB.vi"/>
		<Item Name="数据库保存子viB1.vi" Type="VI" URL="../箱体气密机 2024/D/BaiduNetdiskWorkspace/OneDrive - business/A协众/气密机程序双腔双工位/箱体气密机 文件夹/新建文件夹/D/220902 Labview/Sub Vi/数据库保存子viB1.vi"/>
		<Item Name="数据库插入子viB.vi" Type="VI" URL="../箱体气密机 2024/D/BaiduNetdiskWorkspace/OneDrive - business/A协众/气密机程序双腔双工位/箱体气密机 文件夹/新建文件夹/D/220902 Labview/Sub Vi/数据库插入子viB.vi"/>
		<Item Name="数据库读取.vi" Type="VI" URL="../数据库读取.vi"/>
		<Item Name="数据库读取B.vi" Type="VI" URL="../数据库读取B.vi"/>
		<Item Name="未命名 1.vi" Type="VI" URL="../未命名 1.vi"/>
		<Item Name="已贴标签A.vi" Type="VI" URL="../已贴标签A.vi"/>
		<Item Name="已贴标签B.vi" Type="VI" URL="../已贴标签B.vi"/>
		<Item Name="依赖关系" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="8.6CompatibleGlobalVar.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/8.6CompatibleGlobalVar.vi"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Close Registry Key.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Close Registry Key.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="Internecine Avoider.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/Internecine Avoider.vi"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_LVConfig.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/config.llb/NI_LVConfig.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Open Registry Key.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Open Registry Key.vi"/>
				<Item Name="Read Registry Value DWORD.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Read Registry Value DWORD.vi"/>
				<Item Name="Read Registry Value Simple STR.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Read Registry Value Simple STR.vi"/>
				<Item Name="Read Registry Value Simple U32.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Read Registry Value Simple U32.vi"/>
				<Item Name="Read Registry Value Simple.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Read Registry Value Simple.vi"/>
				<Item Name="Read Registry Value STR.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Read Registry Value STR.vi"/>
				<Item Name="Read Registry Value.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Read Registry Value.vi"/>
				<Item Name="Registry Handle Master.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Registry Handle Master.vi"/>
				<Item Name="Registry refnum.ctl" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Registry refnum.ctl"/>
				<Item Name="Registry RtKey.ctl" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Registry RtKey.ctl"/>
				<Item Name="Registry SAM.ctl" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Registry SAM.ctl"/>
				<Item Name="Registry Simplify Data Type.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Registry Simplify Data Type.vi"/>
				<Item Name="Registry View.ctl" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Registry View.ctl"/>
				<Item Name="Registry WinErr-LVErr.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Registry WinErr-LVErr.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="STR_ASCII-Unicode.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/STR_ASCII-Unicode.vi"/>
				<Item Name="subDisplayMessage.vi" Type="VI" URL="/&lt;vilib&gt;/express/express output/DisplayMessageBlock.llb/subDisplayMessage.vi"/>
				<Item Name="System Exec.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/System Exec.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="TCP Listen Internal List.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/TCP Listen Internal List.vi"/>
				<Item Name="TCP Listen List Operations.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/TCP Listen List Operations.ctl"/>
				<Item Name="TCP Listen.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/TCP Listen.vi"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="VISA Configure Serial Port" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port"/>
				<Item Name="VISA Configure Serial Port (Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Instr).vi"/>
				<Item Name="VISA Configure Serial Port (Serial Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Serial Instr).vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Write Registry Value DWORD.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Write Registry Value DWORD.vi"/>
				<Item Name="Write Registry Value Simple STR.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Write Registry Value Simple STR.vi"/>
				<Item Name="Write Registry Value Simple U32.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Write Registry Value Simple U32.vi"/>
				<Item Name="Write Registry Value Simple.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Write Registry Value Simple.vi"/>
				<Item Name="Write Registry Value STR.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Write Registry Value STR.vi"/>
				<Item Name="Write Registry Value.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Write Registry Value.vi"/>
				<Item Name="Write Spreadsheet String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Spreadsheet String.vi"/>
				<Item Name="Write To Spreadsheet File (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File (DBL).vi"/>
				<Item Name="Write To Spreadsheet File (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File (I64).vi"/>
				<Item Name="Write To Spreadsheet File (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File (string).vi"/>
				<Item Name="Write To Spreadsheet File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File.vi"/>
			</Item>
			<Item Name="ADO Connection Close.vi" Type="VI" URL="../箱体气密机 2024/D/BaiduNetdiskWorkspace/OneDrive - business/A协众/气密机程序双腔双工位/箱体气密机 文件夹/新建文件夹/D/6. LabSQL/LabSQL ADO functions/Connection/ADO Connection Close.vi"/>
			<Item Name="ADO Connection Create.vi" Type="VI" URL="../箱体气密机 2024/D/BaiduNetdiskWorkspace/OneDrive - business/A协众/气密机程序双腔双工位/箱体气密机 文件夹/新建文件夹/D/6. LabSQL/LabSQL ADO functions/Connection/ADO Connection Create.vi"/>
			<Item Name="ADO Connection Destroy.vi" Type="VI" URL="../箱体气密机 2024/D/BaiduNetdiskWorkspace/OneDrive - business/A协众/气密机程序双腔双工位/箱体气密机 文件夹/新建文件夹/D/6. LabSQL/LabSQL ADO functions/Connection/ADO Connection Destroy.vi"/>
			<Item Name="ADO Connection Execute.vi" Type="VI" URL="../箱体气密机 2024/D/BaiduNetdiskWorkspace/OneDrive - business/A协众/气密机程序双腔双工位/箱体气密机 文件夹/新建文件夹/D/6. LabSQL/LabSQL ADO functions/Connection/ADO Connection Execute.vi"/>
			<Item Name="ADO Connection Open.vi" Type="VI" URL="../箱体气密机 2024/D/BaiduNetdiskWorkspace/OneDrive - business/A协众/气密机程序双腔双工位/箱体气密机 文件夹/新建文件夹/D/6. LabSQL/LabSQL ADO functions/Connection/ADO Connection Open.vi"/>
			<Item Name="ADO Recordset Destroy.vi" Type="VI" URL="../箱体气密机 2024/D/BaiduNetdiskWorkspace/OneDrive - business/A协众/气密机程序双腔双工位/箱体气密机 文件夹/新建文件夹/D/6. LabSQL/LabSQL ADO functions/Recordset/ADO Recordset Destroy.vi"/>
			<Item Name="ADO Recordset GetString.vi" Type="VI" URL="../箱体气密机 2024/D/BaiduNetdiskWorkspace/OneDrive - business/A协众/气密机程序双腔双工位/箱体气密机 文件夹/新建文件夹/D/6. LabSQL/LabSQL ADO functions/Recordset/ADO Recordset GetString.vi"/>
			<Item Name="Advapi32.dll" Type="Document" URL="Advapi32.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="ATEQread气密机一.vi" Type="VI" URL="../箱体气密机 2024/D/BaiduNetdiskWorkspace/OneDrive - business/A协众/气密机程序双腔双工位/箱体气密机 文件夹/新建文件夹/D/0.ATEQ/AETQ Modobus/ATEQread气密机一.vi"/>
			<Item Name="ATEQwrite程序选择.vi" Type="VI" URL="../箱体气密机 2024/D/BaiduNetdiskWorkspace/OneDrive - business/A协众/气密机程序双腔双工位/箱体气密机 文件夹/0.ATEQ/AETQ Modobus/ATEQwrite程序选择.vi"/>
			<Item Name="CRC16string气密机一.vi" Type="VI" URL="../箱体气密机 2024/D/BaiduNetdiskWorkspace/OneDrive - business/A协众/气密机程序双腔双工位/箱体气密机 文件夹/新建文件夹/D/220902 Labview/AETQ Modobus/CRC16string气密机一.vi"/>
			<Item Name="Get Window RefNum.vi" Type="VI" URL="../Windows API/Windows API/Labview windows util/WINUTIL.LLB/Get Window RefNum.vi"/>
			<Item Name="kernel32.dll" Type="Document" URL="kernel32.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="MD5 F function__ogtk.vi" Type="VI" URL="../license/MD5 F function__ogtk.vi"/>
			<Item Name="MD5 FGHI functions__ogtk.vi" Type="VI" URL="../license/MD5 FGHI functions__ogtk.vi"/>
			<Item Name="MD5 G function__ogtk.vi" Type="VI" URL="../license/MD5 G function__ogtk.vi"/>
			<Item Name="MD5 H function__ogtk.vi" Type="VI" URL="../license/MD5 H function__ogtk.vi"/>
			<Item Name="MD5 I function__ogtk.vi" Type="VI" URL="../license/MD5 I function__ogtk.vi"/>
			<Item Name="MD5 Message Digest (Binary String)__ogtk.vi" Type="VI" URL="../license/MD5 Message Digest (Binary String)__ogtk.vi"/>
			<Item Name="MD5 Message Digest (Hexadecimal String)__ogtk.vi" Type="VI" URL="../license/MD5 Message Digest (Hexadecimal String)__ogtk.vi"/>
			<Item Name="MD5 Message Digest__ogtk.vi" Type="VI" URL="../license/MD5 Message Digest__ogtk.vi"/>
			<Item Name="MD5 Padding__ogtk.vi" Type="VI" URL="../license/MD5 Padding__ogtk.vi"/>
			<Item Name="MD5 ti__ogtk.vi" Type="VI" URL="../license/MD5 ti__ogtk.vi"/>
			<Item Name="MD5 Unrecoverable character padding__ogtk.vi" Type="VI" URL="../license/MD5 Unrecoverable character padding__ogtk.vi"/>
			<Item Name="Move Window to Bottom v1.vi" Type="VI" URL="../Move Window to Bottom v1.vi"/>
			<Item Name="Not a Window Refnum" Type="VI" URL="../Windows API/Windows API/Labview windows util/WINUTIL.LLB/Not a Window Refnum"/>
			<Item Name="ReadRealStatus气密机一.vi" Type="VI" URL="../箱体气密机 2024/D/BaiduNetdiskWorkspace/OneDrive - business/A协众/气密机程序双腔双工位/箱体气密机 文件夹/新建文件夹/D/0.ATEQ/AETQ Modobus/ReadRealStatus气密机一.vi"/>
			<Item Name="Set Window Z-Position.vi" Type="VI" URL="../Windows API/Windows API/Labview windows util/WINUTIL.LLB/Set Window Z-Position.vi"/>
			<Item Name="SQL Execute.vi" Type="VI" URL="../箱体气密机 2024/D/BaiduNetdiskWorkspace/OneDrive - business/A协众/气密机程序双腔双工位/箱体气密机 文件夹/新建文件夹/D/6. LabSQL/LabSQL ADO functions/SQL Execute.vi"/>
			<Item Name="SQL Fetch Data (GetString).vi" Type="VI" URL="../箱体气密机 2024/D/BaiduNetdiskWorkspace/OneDrive - business/A协众/气密机程序双腔双工位/箱体气密机 文件夹/新建文件夹/D/6. LabSQL/LabSQL ADO functions/SQL Fetch Data (GetString).vi"/>
			<Item Name="user32.dll" Type="Document" URL="user32.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Window Refnum" Type="VI" URL="../Windows API/Windows API/Labview windows util/WINUTIL.LLB/Window Refnum"/>
			<Item Name="初始化注册表.vi" Type="VI" URL="../license/初始化注册表.vi"/>
			<Item Name="创建注册表.vi" Type="VI" URL="../license/创建注册表.vi"/>
			<Item Name="读写注册表.vi" Type="VI" URL="../license/读写注册表.vi"/>
			<Item Name="更新t2.vi" Type="VI" URL="../license/更新t2.vi"/>
			<Item Name="客户端校验.vi" Type="VI" URL="../license/客户端校验.vi"/>
			<Item Name="判断时间正常.vi" Type="VI" URL="../license/判断时间正常.vi"/>
			<Item Name="判断试用期.vi" Type="VI" URL="../license/判断试用期.vi"/>
			<Item Name="生成机器码.vi" Type="VI" URL="../license/生成机器码.vi"/>
			<Item Name="数据库保存子vi.vi" Type="VI" URL="../箱体气密机 2024/D/BaiduNetdiskWorkspace/OneDrive - business/A协众/气密机程序双腔双工位/箱体气密机 文件夹/新建文件夹/D/220902 Labview/Sub Vi/数据库保存子vi.vi"/>
			<Item Name="数据库插入子vi.vi" Type="VI" URL="../箱体气密机 2024/D/BaiduNetdiskWorkspace/OneDrive - business/A协众/气密机程序双腔双工位/箱体气密机 文件夹/新建文件夹/D/220902 Labview/Sub Vi/数据库插入子vi.vi"/>
			<Item Name="校验license.vi" Type="VI" URL="../license/校验license.vi"/>
		</Item>
		<Item Name="程序生成规范" Type="Build">
			<Item Name="我的应用程序" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{B8FE7EA4-AEE4-4370-ADDC-35E8F25ED8CB}</Property>
				<Property Name="App_INI_GUID" Type="Str">{B08B4383-C728-4761-8BAC-592764C9FE47}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="Bld_autoIncrement" Type="Bool">true</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{E274218F-8602-4E09-8D9D-3460C9BF5808}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">我的应用程序</Property>
				<Property Name="Bld_defaultLanguage" Type="Str">ChineseS</Property>
				<Property Name="Bld_excludeInlineSubVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/我的应用程序</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{4313C9CB-185C-4A99-B9A8-1055EEB04192}</Property>
				<Property Name="Bld_version.build" Type="Int">63</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">应用程序.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/我的应用程序/应用程序.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">支持目录</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/我的应用程序/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Exe_iconItemID" Type="Ref">/我的电脑/xz.ico</Property>
				<Property Name="Source[0].itemID" Type="Str">{A0B4C4F9-42C7-4F93-8D77-15C1D2002446}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/我的电脑/Main.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
				<Property Name="TgtF_fileDescription" Type="Str">我的应用程序</Property>
				<Property Name="TgtF_internalName" Type="Str">我的应用程序</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">版权 2025 </Property>
				<Property Name="TgtF_productName" Type="Str">我的应用程序</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{9E10F526-1630-458C-A09E-BDADB223C256}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">应用程序.exe</Property>
			</Item>
		</Item>
	</Item>
</Project>

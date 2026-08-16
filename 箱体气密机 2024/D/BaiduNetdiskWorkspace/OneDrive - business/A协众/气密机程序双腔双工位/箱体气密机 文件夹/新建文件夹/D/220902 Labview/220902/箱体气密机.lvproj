<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="14008000">
	<Property Name="varPersistentID:{19BFE001-C078-4FBD-BE15-35DDCAD39DC3}" Type="Ref">/我的电脑/OPC.lvlib/左复位</Property>
	<Property Name="varPersistentID:{465ED993-5C9B-4FDC-B3D1-C72A83E74083}" Type="Ref">/我的电脑/OPC.lvlib/右工位扫码开始</Property>
	<Property Name="varPersistentID:{6EC7D330-CE46-4596-8312-464F954302AE}" Type="Ref">/我的电脑/OPC.lvlib/左工位扫码打开_关闭</Property>
	<Property Name="varPersistentID:{7835C4F1-6724-4457-A4BE-3CB9BA369EAA}" Type="Ref">/我的电脑/OPC.lvlib/右复位</Property>
	<Property Name="varPersistentID:{8DEE794E-70C6-4357-90B3-43D3B424B5BD}" Type="Ref">/我的电脑/OPC.lvlib/左工位单双切换</Property>
	<Property Name="varPersistentID:{A54977A9-3A57-45B7-B281-63F95CBA938B}" Type="Ref">/我的电脑/OPC.lvlib/左扫码启动</Property>
	<Property Name="varPersistentID:{AF4B8251-9933-43B1-82AE-421428D465D8}" Type="Ref">/我的电脑/OPC.lvlib/右扫码打开_关闭</Property>
	<Property Name="varPersistentID:{CBBBDD09-5857-4689-9D97-E1F5F64F3392}" Type="Ref">/我的电脑/OPC.lvlib/右工位扫码合格</Property>
	<Property Name="varPersistentID:{E3726BE8-2325-4725-A2E0-435A407372F9}" Type="Ref">/我的电脑/OPC.lvlib/右工位单双切换</Property>
	<Property Name="varPersistentID:{FCAEEB12-8AB8-4248-8617-0D84F8876251}" Type="Ref">/我的电脑/OPC.lvlib/左扫码合格</Property>
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
		<Item Name="221004箱码生成和打印.vi" Type="VI" URL="../../../../A协众/220517芯体气密封线/上位机程序/221004箱码生成和打印.vi"/>
		<Item Name="ATEQwriteBit气密机一.vi" Type="VI" URL="../../../../../0.ATEQ/AETQ Modobus/ATEQwriteBit气密机一.vi"/>
		<Item Name="ATEQwrite程序选择.vi" Type="VI" URL="../../../../../0.ATEQ/AETQ Modobus/ATEQwrite程序选择.vi"/>
		<Item Name="menu.rtm" Type="Document" URL="../../../../../../../../../../../C/Users/Administrator/AppData/Local/Temp/360zip$Temp/360$2/menu.rtm"/>
		<Item Name="menu.rtm" Type="Document" URL="../../../../../../../../../../../Y/协众/001摩洛哥干检/界面中英文切换/menu.rtm"/>
		<Item Name="OPC.lvlib" Type="Library" URL="../OPC.lvlib"/>
		<Item Name="TCP-Main.vi" Type="VI" URL="../TcpConnect/TCP-Main.vi"/>
		<Item Name="菜单.rtm" Type="Document" URL="../../../../../../../../../../../C/Users/Administrator/AppData/Local/Temp/360zip$Temp/360$1/菜单.rtm"/>
		<Item Name="打码工位查验.vi" Type="VI" URL="../打码工位查验.vi"/>
		<Item Name="复位F620.vi" Type="VI" URL="../复位F620.vi"/>
		<Item Name="复位结果.vi" Type="VI" URL="../复位结果.vi"/>
		<Item Name="控件 1.ctl" Type="VI" URL="../控件 1.ctl"/>
		<Item Name="气密封测试.vi" Type="VI" URL="../气密封测试.vi"/>
		<Item Name="数据库插入子vi.vi" Type="VI" URL="../../Sub Vi/数据库插入子vi.vi"/>
		<Item Name="统计合格数.vi" Type="VI" URL="../../Sub Vi/统计合格数.vi"/>
		<Item Name="统计行数.vi" Type="VI" URL="../../Sub Vi/统计行数.vi"/>
		<Item Name="未命名 1.vi" Type="VI" URL="../未命名 1.vi"/>
		<Item Name="右启动扫码全局.vi" Type="VI" URL="../右启动扫码全局.vi"/>
		<Item Name="左启动全局.vi" Type="VI" URL="../左启动全局.vi"/>
		<Item Name="依赖关系" Type="Dependencies"/>
		<Item Name="程序生成规范" Type="Build">
			<Item Name="我的应用程序" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{580C0198-89C6-4264-B38F-E4E822C238EF}</Property>
				<Property Name="App_INI_GUID" Type="Str">{44A32E5A-1C85-437D-8AE5-3169264B64C7}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="Bld_autoIncrement" Type="Bool">true</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{D27EDBED-7965-4CF9-9404-5169992FBE86}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">我的应用程序</Property>
				<Property Name="Bld_defaultLanguage" Type="Str">ChineseS</Property>
				<Property Name="Bld_excludeInlineSubVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">/D/我的应用程序</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{B1597EC5-FE4E-4B09-B24E-0276095B988B}</Property>
				<Property Name="Bld_version.build" Type="Int">11</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">气密封测试.exe</Property>
				<Property Name="Destination[0].path" Type="Path">/D/我的应用程序/气密封测试.exe</Property>
				<Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">支持目录</Property>
				<Property Name="Destination[1].path" Type="Path">/D/我的应用程序/data</Property>
				<Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{A3C3D185-D7F9-4759-88B6-C7670626DC71}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/我的电脑/气密封测试.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
				<Property Name="TgtF_fileDescription" Type="Str">我的应用程序</Property>
				<Property Name="TgtF_internalName" Type="Str">我的应用程序</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">版权 2024 </Property>
				<Property Name="TgtF_productName" Type="Str">我的应用程序</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{EF9270DF-E378-40F3-8C2F-7ADED36B8995}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">气密封测试.exe</Property>
			</Item>
		</Item>
	</Item>
</Project>

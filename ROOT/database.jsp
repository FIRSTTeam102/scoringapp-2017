
<% //Checks server name and creates local variables isServer and isEclipse. 
//Currently used for mySql connections, determining to either do localhost or ip.
boolean isServer = false;
boolean isEclipse = false;
String osName = System.getProperty("os.name");
if(osName.equals("Linux")){
	isServer = true;
}else if(osName.equals("Windows 10")){
	isEclipse = true;
}
%>


<% if(isServer == true){ %> <!-- If program is running on server, use gearheads@localhost -->

<sql:setDataSource var="database" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/scoring2017?useOldAliasMetadataBehavior=true" user="gearheads"
	password="Gearhe3ads4prezdent"/>
<% } else { %> <!-- If program is running on Eclipse, use root@localhost -->


<sql:setDataSource var="database" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/scoring2017?useOldAliasMetadataBehavior=true" user="root"
	password=""/>
	<%--
<sql:setDataSource var="database" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://198.100.45.55/Scoring2017?useOldAliasMetadataBehavior=true" user="gearheads"
	password="Gearhe3ads4prezdent"/>--%>
<% } %>
-->
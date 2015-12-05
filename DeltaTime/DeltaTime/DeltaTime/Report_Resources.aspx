<%@ Page Language="C#" MasterPageFile="MasterPage.master"
    Inherits="Report_Resources_aspx" Title="Project and Resource Report" Culture="auto" UICulture="auto" CodeBehind="Report_Resources.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <h1>Project and Resource Report</h1>
    <h3>Use ctrl+click to select multiple resources at once</h3>
    <fieldset>
        <table class="ProjectResourceTable">
            <tr>
                <td>
                    <asp:label id="Label2" runat="server" text="Label" associatedcontrolid="ProjectList"><h4>Select a project</h4></asp:label>
                </td>
                <td>
                    <asp:label id="Label1" runat="server" text="Label" associatedcontrolid="UserList"><h4>Select a resource</h4></asp:label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:objectdatasource id="ProjectData" runat="server" typename="ASPNET.BusinessLogicLayer.Project" />
                    <asp:listbox id="ProjectList" runat="server" selectionmode="Multiple" cssclass="projectlist"
                        width="220px" height="300px" rows="20" datasourceid="ProjectData" datavaluefield="Id"
                        datatextfield="Name" />
                </td>
                <td>
                    <asp:objectdatasource id="UserData" runat="server" typename="ASPNET.BusinessLogicLayer.Project" />
                    <asp:listbox id="UserList" runat="server" selectionmode="Multiple" cssclass="resourcelist"
                        width="220px" height="300px" rows="20" datasourceid="UserData" />
                    <br />
                    <asp:requiredfieldvalidator id="UserListRequiredFieldValidator" runat="server" width="223px"
                        errormessage="At least one resource must be selected." controltovalidate="UserList"
                        display="Dynamic"></asp:requiredfieldvalidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                    <h4>Select a date range</h4>
                    Dates from:<br />
                    <asp:textbox id="StartDate" runat="server"
                        borderstyle="None"></asp:textbox>
                    <a href="javascript:OpenPopupPage('Calendar.aspx','<%= StartDate.ClientID %>','<%= Page.IsPostBack %>');">
                        <img src="images/icon-calendar.gif"></a>
                    <asp:comparevalidator id="CompletionDateCompareValidator" runat="server" controltovalidate="StartDate"
                        display="Dynamic" errormessage="Date format is incorrect." operator="DataTypeCheck"
                        type="Date"></asp:comparevalidator>
                    &emsp;to&emsp;
            <asp:textbox id="EndDate" runat="server" borderstyle="None"></asp:textbox>
                    <a href="javascript:OpenPopupPage('Calendar.aspx','<%= EndDate.ClientID %>','<%= Page.IsPostBack %>');">
                        <img src="images/icon-calendar.gif"></a>
                    <asp:comparevalidator id="CompareValidator1" runat="server" controltovalidate="EndDate"
                        display="Dynamic" errormessage="Date format is incorrect." operator="DataTypeCheck"
                        type="Date"></asp:comparevalidator>
                </td>
            </tr>
        </table>

        <br />

        <asp:button id="GenResourceRpt" runat="server" cssclass="submit" text="Create Report"
            causesvalidation="False" onclick="GenResourceRpt_Click" />
    </fieldset>
    <%--    </div>--%>
</asp:Content>
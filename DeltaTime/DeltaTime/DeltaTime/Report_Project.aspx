<%@ Page Language="C#" MasterPageFile="MasterPage.master"
    Inherits="Report_Project_aspx" Title="Create Project Report" Culture="auto" UICulture="auto" CodeBehind="Report_Project.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div id="projectreport">
        <a name="content_start" id="content_start"></a>
        <fieldset>
            <h2 class="none">Project Report</h2>
            <legend>Project Report</legend>
            <asp:label id="Label1" runat="server" text="Label" associatedcontrolid="ProjectList">Select a project. Use ctrl+click to select multiple
            resources at once:</asp:label>
            <br />
            <asp:objectdatasource id="ProjectData" runat="server" typename="ASPNET.BusinessLogicLayer.Project" />
            <asp:listbox id="ProjectList" runat="server" selectionmode="Multiple" cssclass="projectlist"
                rows="28" datasourceid="ProjectData" datavaluefield="Id"
                datatextfield="Name" />
            <br>
            <asp:requiredfieldvalidator id="ProjectListRequiredFieldValidator" runat="server"
                errormessage="At least one project must be selected." controltovalidate="ProjectList"
                display="Dynamic" />
            <br>
            <asp:button id="GenProjectRpt" runat="server" cssclass="submit" text="Generate Report"
                causesvalidation="False" onclick="GenProjectRpt_Click" />
        </fieldset>
    </div>
</asp:Content>
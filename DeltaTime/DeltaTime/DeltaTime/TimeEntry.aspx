<%@ Page Language="C#" MasterPageFile="MasterPage.master"
    Inherits="TimeEntry_aspx" Title="Log a Time Entry"
    Culture="auto" UICulture="auto" CodeBehind="TimeEntry.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <h1>Log your hours</h1>
    <div id="TimeEntryView" runat="server" visible="false">
        <div id="addhours">
            <br />
            Project<br />
            <asp:objectdatasource id="ProjectData" runat="server" typename="ASPNET.BusinessLogicLayer.Project" />
            <asp:dropdownlist id="ProjectList" runat="server" autopostback="True" datasourceid="ProjectData"
                datatextfield="Name" datavaluefield="Id" />
            <asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" controltovalidate="ProjectList"
                errormessage="Project is a required value." display="Dynamic" validationgroup="newEntry"></asp:requiredfieldvalidator>
            <br />
            Category<br />
            <asp:objectdatasource id="ProjectCategories" runat="server" typename="ASPNET.BusinessLogicLayer.Category"
                selectmethod="GetCategoriesByProjectId">
                        <SelectParameters>
                            <asp:ControlParameter Name="projectId" ControlID="ProjectList" PropertyName="SelectedValue"
                                DefaultValue="0" Type="Int32" />
                        </SelectParameters>
                    </asp:objectdatasource>
            <asp:dropdownlist id="CategoryList" runat="server" datasourceid="ProjectCategories"
                datatextfield="Name" datavaluefield="Id" />
            <br />
            Day<br />
            <asp:textbox id="WeekEnding2" runat="server" columns="12" validationgroup="newEntry"></asp:textbox>
            <a href="javascript:OpenPopupPage('Calendar.aspx','<%= WeekEnding2.ClientID %>','<%= Page.IsPostBack %>');">
                <img src="images/icon-calendar.gif" border="0" align="absBottom" width="24" height="16"></a>
            <asp:comparevalidator id="CompletionDateCompareValidator" runat="server" display="Dynamic" errormessage="Date format is incorrect." controltovalidate="WeekEnding2" operator="DataTypeCheck" type="Date">
                </asp:comparevalidator>
            <br />
            Hours<br />
            <asp:textbox id="Hours" runat="server" columns="5" cssclass="hours" Font-Size="Medium"></asp:textbox>
            <asp:requiredfieldvalidator id="Requiredfieldvalidator1" runat="server" errormessage="Hours is a required value."
                controltovalidate="Hours" display="Dynamic" validationgroup="newEntry"></asp:requiredfieldvalidator>
            <asp:comparevalidator id="CompareValidator1" runat="server" errormessage="Hours must be a decimal value."
                controltovalidate="Hours" type="Currency" operator="DataTypeCheck" display="Dynamic"
                validationgroup="newEntry"></asp:comparevalidator>
            <asp:rangevalidator id="RangeValidator1" runat="server" errormessage="Hours is out of range."
                controltovalidate="Hours" maximumvalue="24" minimumvalue="0" type="Double" validationgroup="newEntry"></asp:rangevalidator>
            <br />
            <%--Description<br>--%>
            <asp:textbox id="Description" runat="server" textmode="MultiLine" rows="9" columns="20"
                maxlength="200"></asp:textbox>
            <asp:customvalidator id="CustomValidator1" runat="server"
                controltovalidate="Description" errormessage="Description must be less than 200 characters"
                onservervalidate="CustomValidator1_ServerValidate"></asp:customvalidator>
            <br />
            <asp:button id="AddEntry" runat="server" cssclass="submit" causesvalidation="False"
                text="Add Entry" onclick="AddEntry_Click" validationgroup="newEntry" />
            <asp:button id="Cancel" runat="server" cssclass="reset" causesvalidation="False"
                text="Cancel" onclick="Cancel_Click" />
        </div>
        <div id="timesheet">
               Time Sheet For:
                        <asp:objectdatasource id="ProjectMembers" runat="server" typename="ASPNET.BusinessLogicLayer.Project"
                            selectmethod="GetProjectMembers">
                            <SelectParameters>
                                <asp:ControlParameter Name="Id" ControlID="ProjectList" PropertyName="SelectedValue"
                                    DefaultValue="0" Type="Int32" />
                            </SelectParameters>
                        </asp:objectdatasource>
                    <asp:dropdownlist id="UserList" runat="server" autopostback="True" cssclass="username" />

                <asp:objectdatasource id="ProjectListDataSource" runat="server" typename="ASPNET.BusinessLogicLayer.TimeEntry"
                    selectmethod="GetTimeEntries" deletemethod="DeleteTimeEntry" updatemethod="UpdateTimeEntry" oldvaluesparameterformatstring="{0}">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:ControlParameter Name="projectId" ControlID="ProjectList" PropertyName="SelectedValue"
                                DefaultValue="0" Type="Int32" />
                            <asp:ControlParameter Name="userName" ControlID="UserList" PropertyName="SelectedValue"
                                Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                            <asp:Parameter Name="CategoryName" Type="String" />
                            <asp:Parameter Name="Duration" Type="Decimal" />
                            <asp:Parameter Name="ReportedDate" Type="DateTime" />
                            <asp:ControlParameter Name="UserName" ControlID="UserList" PropertyName="SelectedValue"
                                Type="String" />
                        </UpdateParameters>
                    </asp:objectdatasource>
                <asp:gridview id="ProjectListGridView" runat="server" datasourceid="ProjectListDataSource"
                    datakeynames="Id" autogeneratecolumns="False" allowsorting="true" borderwidth="0"
                    borderstyle="None" width="100%" cellpadding="2" pagesize="25" onrowdeleting="ProjectListGridView_RowDeleting" onrowupdated="ProjectListGridView_RowUpdated">
                        <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly=true />
                            <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" />
                            <asp:BoundField DataField="Duration" HeaderText="Duration" />
                            <asp:BoundField DataField="ReportedDate" HeaderText="ReportedDate" DataFormatString="{0:d}" />
                            <asp:CommandField ShowEditButton="True" HeaderText="Edit" ButtonType="Image" EditImageUrl="images/icon-edit.gif"
                                UpdateImageUrl="images/icon-save.gif" CancelImageUrl="images/icon-cancel.gif" />
                            <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" DeleteImageUrl="images/icon-delete.gif"
                                ButtonType="Image" />
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Label ID="Label10" runat="server" Text="Label">There are no time entries for this user</asp:Label>
                        </EmptyDataTemplate>
                        <RowStyle CssClass="row1" BorderStyle="None" />
                        <HeaderStyle CssClass="grid-header" HorizontalAlign="Left" />
                    </asp:gridview>
            </fieldset>
        </div>
    </div>
    <div id="MessageView" runat="server" visible="false">
        <div id="projectadministration">
            <fieldset>
                <h2 class="none">Time Sheet for:</h2>
                <legend>Time Sheet For:</legend>
                <center>
                    You do not have any projects assigned to you.
                </center>
            </fieldset>
        </div>
    </div>
</asp:Content>
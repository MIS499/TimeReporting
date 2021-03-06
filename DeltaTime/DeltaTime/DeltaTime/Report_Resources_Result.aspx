<%@ Page Language="C#" MasterPageFile="MasterPage.master"
    Inherits="Report_Resources_Result_aspx" Title="Resource Report" Culture="auto" UICulture="auto" CodeBehind="Report_Resources_Result.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <h1>Resources Report</h1>
    <asp:objectdatasource id="UserReportData" runat="server" typename="ASPNET.BusinessLogicLayer.UserTotalDurationReport"
        selectmethod="GetUserReportsByUserNames">
                <SelectParameters>
                    <asp:SessionParameter Name="userNames" SessionField="SelectedUserNames" Type="String" />
                </SelectParameters>
            </asp:objectdatasource>
    <table class="tan-border" cellspacing="11" cellpadding="0" width="100%" border="0"
        height="526">
        <tr valign="top">
            <td>
                <asp:label id="NoData" runat="server" visible="False" cssclass="header-gray">
      No Data Retrieved.
                        </asp:label>
                <asp:datalist id="UserList" runat="server" width="100%" datasourceid="UserReportData"
                    onitemcreated="OnListUserTimeEntriesItemCreated">
                            <HeaderTemplate>
                                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tr>
                                        <td colspan="3">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td width="150" class="report-header">
                                            Beginning Date</td>
                                        <td width="150" class="report-header">
                                            Ending Date</td>
                                        <td width="*" class="report-header">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="report-text">
                                            <asp:Label ID="StartDate" runat="server" Text='<%# Session["SelectedStartingDate"] %>' />
                                        </td>
                                        <td class="report-text">
                                            <asp:Label ID="EndDate" runat="server" Text='<%# Session["SelectedEndDate"]  %>' />
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tr>
                                        <td width="150" class="report-main-header">
                                            Consultant</td>
                                        <td width="78" align="right" class="report-main-header">
                                            Total Hours</td>
                                        <td width="*" class="report-main-header">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="report-text">
                                            <%# Eval("UserName") %>
                                        </td>
                                        <td class="report-text" align="right">
                                            <%# Eval("TotalDuration") %>
                                        </td>
                                        <td class="report-text">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td height="24" colspan="3">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                                <table cellspacing="0" cellpadding="3" width="100%" border="0">
                                    <tr>
                                        <td>
                                            <asp:ObjectDataSource ID="TimeEntryData" runat="server" TypeName="ASPNET.BusinessLogicLayer.TimeEntry"
                                                SelectMethod="GetTimeEntriesByUserNameAndDates">
                                                <SelectParameters>
                                                    <asp:Parameter Name="userName" Type="string" />
                                                    <asp:SessionParameter Name="startingDate" SessionField="SelectedStartingDate" Type="DateTime" />
                                                    <asp:SessionParameter Name="endDate" SessionField="SelectedEndDate" Type="DateTime" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <asp:GridView ID="ListUserTimeEntries" DataSourceID="TimeEntryData" DataKeyNames="Id"
                                                AutoGenerateColumns="False" AllowSorting="true" BorderWidth="0" runat="server"
                                                BorderStyle="None" Width="90%" CellPadding="2" PageSize="25">
                                                <HeaderStyle CssClass="grid-header" HorizontalAlign="Left" />
                                                <RowStyle HorizontalAlign="Left" BorderWidth="5" BorderStyle="solid" BorderColor="Blue"
                                                    ForeColor="Red" />
                                                <Columns>
                                                    <asp:BoundField DataField="ReportedDate" HeaderText="Reported Date" SortExpression="ReportedDate"
                                                        DataFormatString="{0:d}" />
                                                    <asp:BoundField DataField="ProjectName" HeaderText="Project Name" SortExpression="ProjectName" />
                                                    <asp:BoundField DataField="CategoryName" HeaderText="Category Name" SortExpression="CategoryName" />
                                                    <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                                                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="48">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:datalist>
            </td>
        </tr>
    </table>
</asp:Content>
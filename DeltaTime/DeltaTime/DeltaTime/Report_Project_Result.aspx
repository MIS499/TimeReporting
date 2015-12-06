<%@ Page Language="C#" MasterPageFile="MasterPage.master"
    Inherits="Report_Project_Result_aspx" Title="Project Report" Culture="auto" UICulture="auto" CodeBehind="Report_Project_Result.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <h1>Project Report</h1>
    <asp:label id="NoData" runat="server" cssclass="header-gray" visible="False">
      No Data Retrieved.
            </asp:label>
    <asp:objectdatasource id="ProjectReportData" runat="server" typename="ASPNET.BusinessLogicLayer.Project"
        selectmethod="GetProjectByIds">
                <SelectParameters>
                    <asp:SessionParameter Name="ProjectIds" SessionField="SelectedProjectIds" Type="String" />
                </SelectParameters>
            </asp:objectdatasource>
    <asp:datalist id="ProjectList" repeatcolumns="1" repeatdirection="Vertical" runat="server"
        datasourceid="projectReportData" onitemcreated="OnProjectListItemCreated">
                <ItemTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" class="Content" width="100%">
                        <tr>
                            <td valign="top">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0" class="Content" width="100%">
                                    <tr>
                                        <td width="200" class="report-main-header">
                                            <h4>Project Name</h4></td>
                                        <td width="200" align="right" class="report-main-header">
                                            <h4>Est. Hours</h4></td>
                                        <td width="200" align="right" class="report-main-header">
                                            <h4>Actual Hours</h4></td>
                                        <td width="200" align="right" class="report-main-header">
                                            <h4>Est. Completion</h4></td>
                                    </tr>
                                    <tr>
                                        <td class="report-text">
                                            <%# Eval("Name") %>
                                        </td>
                                        <td class="report-text" align="right">
                                            <%# Eval("EstimateDuration") %>
                                        </td>
                                        <td class="report-text" align="right">
                                            <%# Eval("ActualDuration") %>
                                        </td>
                                        <td class="report-text" align="right">
                                            <%# Eval("CompletionDate", "{0:d}") %>
                                        </td>
                                    </tr>
                                </table>
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:ObjectDataSource ID="CategorReportData" runat="server" TypeName="ASPNET.BusinessLogicLayer.Category"
                                    SelectMethod="GetCategoriesByProjectId">
                                    <SelectParameters>
                                        <asp:Parameter Name="ProjectId" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:DataList ID="CategoryList" RepeatColumns="1" RepeatDirection="Vertical" DataSourceID="CategorReportData"
                                    runat="server" OnItemCreated="OnCategoryListItemCreated">
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" class="Content" width="100%">
                                            <tr>
                                                <td valign="top" width="72" class="report-header">
                                                    Category</td>
                                                <td valign="top" width="70" align="right" class="report-header">
                                                    Est. Hours</td>
                                                <td valign="top" width="100" align="right" class="report-header">
                                                    Actual Hours</td>
                                            </tr>
                                            <tr>
                                                <td valign="top" class="report-text">
                                                    <%# Eval("Abbreviation") %>
                                                </td>
                                                <td valign="top" class="report-text" align="right">
                                                    <%# Eval("EstimateDuration") %>
                                                </td>
                                                <td valign="top" class="report-text" align="right">
                                                    <%# Eval("ActualDuration") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" colspan="2">
                                                    &nbsp;</td>
                                                <td colspan="2">
                                                    <asp:ObjectDataSource ID="UserReportData" runat="server" TypeName="ASPNET.BusinessLogicLayer.UserReport"
                                                        SelectMethod="GetUserReportsByCategoryId">
                                                        <SelectParameters>
                                                            <asp:QueryStringParameter Name="CategoryId" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                    <asp:DataList ID="EntryList" Width="100%" RepeatColumns="1" RepeatDirection="Vertical"
                                                        DataSourceID="UserReportData" runat="server" OnDataBinding="EntryListDataBinding">
                                                        <HeaderTemplate>
                                                            <table border="0" cellpadding="0" cellspacing="0" class="Content" width="100%">
                                                                <tr>
                                                                    <td valign="top" align="left" class="report-header">
                                                                        Consultant</td>
                                                                    <td valign="top" align="right" class="report-header">
                                                                        Hours</td>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td valign="top" class="report-text">
                                                                    <!-- Add Hyperlink here00 -->
                                                                    <%# Eval("UserName") %>
                                                                </td>
                                                                <td valign="top" class="report-text" align="right">
                                                                    <%# Eval("ActualDuration") %>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:datalist>
    </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
</asp:Content>
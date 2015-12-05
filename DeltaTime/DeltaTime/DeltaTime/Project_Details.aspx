<%@ Page Language="C#" MasterPageFile="MasterPage.master"
    Inherits="Project_Details_aspx" Title="Manage Projects" Culture="auto" UICulture="auto" CodeBehind="Project_Details.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <a name="content_start" id="content_start"></a>

    <h1>Project Configuration</h1>
    <h3>Define the project and specify which users
            will be part of the project. Then add categories to the project to help keep track
            of specific areas of product. Press the SAVE button at the bottom for your configuration
            to take effect.</h3>
    <table>
        <tr valign="top">
            <td width="30%">
                <div>
                    <h2>Project Information</h2>
                </div>
                <p>
                    <asp:label id="Label1" runat="server" text="Label" associatedcontrolid="ProjectName">Project Name</asp:label>
                    <br>
                    <asp:textbox id="ProjectName" runat="server" width="194px"
                        maxlength="50"></asp:textbox>
                    <asp:requiredfieldvalidator id="ProjectNameRequiredfieldvalidator" runat="server"
                        display="Dynamic" controltovalidate="ProjectName" errormessage="Project Name is a required value.">
                </asp:requiredfieldvalidator>
                    <br />
                    <asp:label id="Label2" runat="server" text="Label" associatedcontrolid="Managers">Project Manager</asp:label>
                    <br>
                    <asp:objectdatasource id="ManagerData" runat="server" typename="System.Web.Security.Roles"
                        selectmethod="GetUsersInRole"></asp:objectdatasource>
                    <asp:dropdownlist id="Managers" runat="server" width="193px"
                        datasourceid="ManagerData" />
                    <asp:requiredfieldvalidator id="ManagerRequiredFieldValidator" runat="server" display="Dynamic"
                        controltovalidate="Managers" errormessage="You must select a manager.">
                </asp:requiredfieldvalidator>
                    <br />
                    <asp:label id="Label3" runat="server" text="Label" associatedcontrolid="CompletionDate">Estimated complete date:</asp:label>
                    <br />
                    <asp:textbox id="CompletionDate" runat="server" width="76px" columns="12"></asp:textbox>
                    <a href="javascript:OpenPopupPage('Calendar.aspx','<%= CompletionDate.ClientID %>','<%= Page.IsPostBack %>');">
                        <img src="images/icon-calendar.gif"></a>
                    <asp:comparevalidator id="CompletionDateCompareValidator" runat="server" display="Dynamic"
                        errormessage="Date format is incorrect." operator="DataTypeCheck" type="Date"
                        controltovalidate="CompletionDate">
                </asp:comparevalidator>
                    <asp:requiredfieldvalidator id="CompletionDateRequiredFieldValidator" runat="server"
                        controltovalidate="CompletionDate" errormessage="Est. Comletion Date is required."
                        display="Dynamic">
                </asp:requiredfieldvalidator>
                    <br />
                    <asp:label id="Label4" runat="server" text="Label" associatedcontrolid="Duration">Estimated Duration (in hours):</asp:label>
                    <br />
                    <asp:textbox id="Duration" runat="server" width="49px" columns="12"></asp:textbox>
                    <asp:comparevalidator id="DurationCompareValidator" runat="server" controltovalidate="Duration"
                        errormessage="Duration must be integer value." display="Dynamic" operator="DataTypeCheck"
                        type="Integer">
                </asp:comparevalidator>
                    <asp:requiredfieldvalidator id="DurationRequiredFieldValidator" runat="server" controltovalidate="Duration"
                        errormessage="Duration is required." display="Dynamic">
                </asp:requiredfieldvalidator>
                    <asp:rangevalidator id="RangeValidator1" runat="server" errormessage="Duration is out of range"
                        controltovalidate="Duration" maximumvalue="99999" minimumvalue="0" type="Integer">
                </asp:rangevalidator>
                    <br />
                    <asp:label id="Label5" runat="server" text="Label" associatedcontrolid="Description">Description:</asp:label>
                    <br />
                    <asp:textbox id="Description" runat="server" textmode="MultiLine"
                        width="204px" columns="20" rows="8" maxlength="200"></asp:textbox>
                    <br />
                    <asp:customvalidator id="CustomValidator1" runat="server" controltovalidate="Description"
                        errormessage="Description must be less than 200 characters" onservervalidate="CustomValidator1_ServerValidate"></asp:customvalidator>
                </p>
            </td>
            <td width="30%">
                <div>
                    <h2>Specify Project Members</h2>
                </div>
                <p>
                    <asp:label id="Label6" runat="server" text="Label" associatedcontrolid="Consultants">Select a resource. Use ctrl+click to select multiple resources at once:</asp:label>
                    <br>
                    <asp:objectdatasource id="ProjectConsultantData" runat="server" typename="System.Web.Security.Roles"
                        selectmethod="GetUsersInRole">
                </asp:objectdatasource>
                    <asp:listbox id="Consultants" runat="server" selectionmode="Multiple" rows="9" datasourceid="ProjectConsultantData" cssclass="resourcelist" />
                </p>
            </td>

            <td width="40%" runat="server" id="ProjectCategoryColumn">
                <div>
                    <h2>Define Project Categories for Project Management</h2>
                </div>
                <p>
                    Categories can be added in two ways. You can <b>ADD</b> a category by specifying
                name, abbreviation (4 characters max), and duration - the amount of hours that may
                be charged under the category. Or, You can <b>COPY</b> categories that already have
                been defined in another project to this project.
                </p>
                <p>

                    <asp:label id="Label7" runat="server" text="Label" associatedcontrolid="CategoryName">Category name:</asp:label>
                    <br />
                    <asp:textbox id="CategoryName" runat="server" width="166px" enableviewstate="False"
                        maxlength="50" validationgroup="CategoryValidation"></asp:textbox>
                    <asp:requiredfieldvalidator
                        id="RequiredFieldValidator1" runat="server" controltovalidate="CategoryName"
                        display="Dynamic" errormessage="Category Name is a required value." validationgroup="CategoryValidation"></asp:requiredfieldvalidator>
                    <asp:regularexpressionvalidator id="CategoryNameValidator" runat="server" errormessage="Category name must be alphanumeric."
                        controltovalidate="CategoryName" display="Dynamic" validationexpression="[a-zA-Z0-9 ]*" validationgroup="CategoryValidation">
                </asp:regularexpressionvalidator>
                    <br />
                    <asp:label id="Label8" runat="server" text="Label" associatedcontrolid="Abbrev">Category abbreviation:</asp:label>
                    <br />
                    <asp:textbox id="Abbrev" runat="server" width="70px" enableviewstate="False" validationgroup="CategoryValidation"></asp:textbox>
                    <br />
                    <asp:requiredfieldvalidator
                        id="RequiredFieldValidator2" runat="server" controltovalidate="Abbrev"
                        display="Dynamic" errormessage="Category abbreviation  is a required value." validationgroup="CategoryValidation"></asp:requiredfieldvalidator>
                    <asp:regularexpressionvalidator id="RegularExpressionValidator1" runat="server" errormessage="Category abbreviation must be alphanumeric."
                        controltovalidate="Abbrev" display="Dynamic" validationexpression="[a-zA-Z0-9 ]*" validationgroup="CategoryValidation">
                </asp:regularexpressionvalidator>
                    <br />
                    <asp:label id="Label9" runat="server" text="Label" associatedcontrolid="CatDuration">Duration:</asp:label>
                    <br />
                    <asp:textbox id="CatDuration" runat="server" width="70px"
                        enableviewstate="False" validationgroup="CategoryValidation"></asp:textbox>
                    <br />
                    <asp:requiredfieldvalidator
                        id="RequiredFieldValidator3" runat="server" controltovalidate="CatDuration"
                        display="Dynamic" errormessage="Duration  is a required value." validationgroup="CategoryValidation"></asp:requiredfieldvalidator>
                    <asp:comparevalidator id="CatDurationValidator" runat="server" controltovalidate="CatDuration"
                        errormessage="Duration for category must be integer value." display="Dynamic"
                        operator="DataTypeCheck" type="Integer" validationgroup="CategoryValidation">
                </asp:comparevalidator>
                    <asp:rangevalidator id="RangeValidator2" runat="server" errormessage="Duration is out of range."
                        controltovalidate="CatDuration" maximumvalue="99999" minimumvalue="0" type="Integer" validationgroup="CategoryValidation">
                </asp:rangevalidator>
                    <br />
                    <asp:button id="AddButton" runat="server" width="46px" cssclass="submit" text="Add"
                        onclick="AddButton_Click" validationgroup="CategoryValidation"></asp:button>
                    <br />
                    <asp:objectdatasource id="CategoryData" runat="server" typename="ASPNET.BusinessLogicLayer.Category"
                        selectmethod="GetCategoriesByProjectId" deletemethod="DeleteCategory" updatemethod="UpdateCategory">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="projectId" QueryStringField="ProjectId" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Abbreviation" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                        <asp:Parameter Name="EstimateDuration" Type="decimal" />
                        <asp:Parameter Name="Name" Type="string" />
                    </UpdateParameters>
                </asp:objectdatasource>
                    <asp:gridview id="ListAllCategories" datasourceid="CategoryData" datakeynames="Id"
                        autogeneratecolumns="False" allowsorting="true" allowpaging="true" runat="server"
                        borderstyle="None" width="90%" cellpadding="2" borderwidth="0">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Identification" ReadOnly="true" Visible=false />
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="CategoryName2" runat="server" CssClass="catname" Text='<%# Bind("Name") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="CategoryNameValidator2" runat="server" ErrorMessage="Category name must be alphanumeric."
                                    ControlToValidate="CategoryName2" Display="Dynamic" ValidationExpression="[a-zA-Z0-9 ]*">
                                </asp:RegularExpressionValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Abbreviation">
                            <ItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("Abbreviation") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Abbrev2" runat="server" CssClass="catabbr" Text='<%# Bind("Abbreviation") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server"
                                    ErrorMessage="Category abbreviation must be alphanumeric." ControlToValidate="Abbrev2"
                                    Display="Dynamic" ValidationExpression="[a-zA-Z0-9 ]*">
                                </asp:RegularExpressionValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estimate Duration">
                            <ItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("EstimateDuration") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="CatDuration2" runat="server" CssClass="catduration" Text='<%# Bind("EstimateDuration") %>'></asp:TextBox>
                                <asp:CompareValidator ID="CatDurationValidator2" runat="server" ControlToValidate="CatDuration2"
                                    ErrorMessage="Duration for category must be integer value." Display="Dynamic"
                                    Operator="DataTypeCheck" Type="Integer">
                                </asp:CompareValidator>
                                <asp:RangeValidator ID="RangeValidator22" runat="server" ErrorMessage="Duration is out of range."
                                    ControlToValidate="CatDuration2" MaximumValue="99999" MinimumValue="0" Type="Integer">
                                </asp:RangeValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" HeaderText="Edit" ButtonType="Image" EditImageUrl="images/icon-edit.gif"
                            UpdateImageUrl="images/icon-save.gif" CancelImageUrl="images/icon-cancel.gif" />
                        <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" DeleteImageUrl="images/icon-delete.gif"
                            ButtonType="Image" />
                    </Columns>
                    <RowStyle BorderStyle="None" CssClass="row1" />

                    <HeaderStyle CssClass="grid-header"></HeaderStyle>
                    <EmptyDataTemplate>
                        <asp:Label ID="Label10" runat="server" Text="Label">There are no categories associated to this project</asp:Label>
                    </EmptyDataTemplate>
                </asp:gridview>
                </p>
                <p>
                    OR
                </p>
                <p>
                    Add categories from another project:<br />
                    <asp:objectdatasource id="ProjectData" runat="server" typename="ASPNET.BusinessLogicLayer.Project" />
                    <asp:dropdownlist id="ProjectList" runat="server" width="190px"
                        datasourceid="ProjectData" datavaluefield="Id" datatextfield="Name" onprerender="ProjectList_PreRender" />
                    <br />
                    <asp:button id="CopyButton" runat="server" width="46" causesvalidation="False" cssclass="standard-text"
                        text="Copy" onclick="CopyButton_Click" enabled="false"></asp:button>
                </p>
                <p>
                    <asp:label id="ErrorMessage" runat="server" cssclass="standard-text" enableviewstate="False"
                        forecolor="Red"></asp:label>
                </p>
            </td>
        </tr>
    </table>
    <div class="ProjectDetailsBottomBar">
        <asp:button id="SaveButton2" runat="server" cssclass="submit" text="Save" onclick="SaveButton_Click"></asp:button>
        &nbsp;

        <asp:button id="CancelButton2" runat="server" causesvalidation="False" cssclass="reset"
            text="Cancel" onclick="CancelButton_Click"></asp:button>
        &nbsp;

        <asp:button id="DeleteButton2" runat="server" text="Delete" cssclass="delete" causesvalidation="False"
            onclick="DeleteButton_Click"></asp:button>
    </div>
</asp:Content>
<%@ Page Language="C#" MasterPageFile="~/TimeTracker/MasterPage.master"
    Inherits="User_Create_aspx" Title="User Create" Culture="auto" UICulture="auto" CodeBehind="User_Create.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div>
        <h1>Create User</h1>
        <a name="content_start" id="content_start"></a>
        <fieldset>
            <asp:createuserwizard id="CreateUserWizard1" runat="server" onfinishbuttonclick="Wizard_FinishButton_Click"
                continuedestinationpageurl="TimeEntry.aspx" oncreateduser="CreateUserWizard1_CreatedUser">
                <WizardSteps>
                    <asp:CreateUserWizardStep runat="server" Title=" ">
                    </asp:CreateUserWizardStep>
                    <asp:WizardStep runat="server">
                        <center>
                            Add the user to a gropup:
                            <br />
                            <asp:DropDownList ID="GroupName" runat="server" Width="150px">
                                <asp:ListItem Value="0" Text="Project Administrator"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Project Manager"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Project Consultant"></asp:ListItem>
                            </asp:DropDownList>
                        </center>
                    </asp:WizardStep>
                    <asp:CompleteWizardStep runat="server" Title="Complete">
                    </asp:CompleteWizardStep>
                </WizardSteps>
                <TitleTextStyle CssClass="header-lightgray" />
            </asp:createuserwizard>
            <asp:label runat="server" id="noAccessMsg" visible="false" enableviewstate="false"
                text="User can not be created at this time. Please contact your admistratior"></asp:label>
        </fieldset>
    </div>
</asp:Content>
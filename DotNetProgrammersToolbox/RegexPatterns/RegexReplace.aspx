<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegexReplace.aspx.cs" Inherits="DotNetProgrammersToolbox.RegexPatterns.RegexReplace" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h3>Regex.Replace</h3>
<table>
    <tr>
        <td>
            Text search:</td>
        <td>
            <asp:TextBox ID="SourceTextTextBox" runat="server" Rows="6" 
                TextMode="MultiLine" Width="720px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="RegularExpressionRequiredFieldValidator" 
                runat="server" ControlToValidate="RegularExpressionTextBox" Display="Dynamic" 
                ErrorMessage="Regular expression cannot be empty" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
            <asp:CustomValidator ID="RegularExpressionCustomValidator" runat="server" 
                ControlToValidate="RegularExpressionTextBox" Display="Dynamic" 
                ErrorMessage="Invalid regular expression:" ForeColor="#CC0000">*</asp:CustomValidator>
            Regular Expression:</td>
        <td>
            <asp:TextBox ID="RegularExpressionTextBox" runat="server" Rows="4" 
                TextMode="MultiLine" Width="720px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Replacement:</td>
        <td>
            <asp:TextBox ID="ReplacementTextBox" runat="server" Rows="4" 
                TextMode="MultiLine" Width="720px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Options:</td>
        <td>
            <asp:CheckBoxList ID="OptionsCheckBoxList" runat="server" 
                DataSourceID="OptionsDataSource" DataTextField="DisplayText" 
                DataValueField="Value" RepeatColumns="3">
            </asp:CheckBoxList>
            <asp:ObjectDataSource ID="OptionsDataSource" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="DotNetProgrammersToolbox.RegexPatterns.RegexOptionData">
            </asp:ObjectDataSource>
            <table>
                <tr>
                    <td>
                        <asp:RadioButton ID="NoneRadioButton" runat="server" AutoPostBack="True" 
                            Checked="True" GroupName="CountAndStart" 
                            oncheckedchanged="NoneRadioButton_CheckedChanged" Text="(unlimited)" />
                    </td>
                    <td>
                        <asp:RadioButton ID="CountRadioButton" runat="server" AutoPostBack="True" 
                            GroupName="CountAndStart" oncheckedchanged="CountRadioButton_CheckedChanged" 
                            Text="Count" />
                        <asp:RequiredFieldValidator ID="CountRequiredFieldValidator" runat="server" 
                            ControlToValidate="CountTextBox" Display="Dynamic" ErrorMessage="*" 
                            ForeColor="#CC0000" Enabled="False"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="CountRangeValidator" runat="server" Display="Dynamic" 
                            ErrorMessage="*" ForeColor="#CC0000" MaximumValue="2147483647" MinimumValue="0" 
                            Type="Double" ControlToValidate="CountTextBox" Enabled="False"></asp:RangeValidator>
                        <asp:RegularExpressionValidator ID="CountRegularExpressionValidator" 
                            runat="server" ControlToValidate="CountTextBox" Display="Dynamic" 
                            ErrorMessage="*" ForeColor="#CC0000" ValidationExpression="\d+" Enabled="False"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:RadioButton ID="StartAtRadioButton" runat="server" AutoPostBack="True" 
                            GroupName="CountAndStart" oncheckedchanged="StartAtRadioButton_CheckedChanged" 
                            Text="Start At" />
                        <asp:RequiredFieldValidator ID="StartAtRequiredFieldValidator" runat="server" 
                            ControlToValidate="StartAtTextBox" Display="Dynamic" Enabled="False" 
                            ErrorMessage="*" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="StartAtRangeValidator" runat="server" Display="Dynamic" 
                            ErrorMessage="*" ForeColor="#CC0000" MaximumValue="2147483647" Enabled="False" MinimumValue="0" 
                            Type="Double" ControlToValidate="StartAtTextBox"></asp:RangeValidator>
                        <asp:RegularExpressionValidator ID="StartAtRegularExpressionValidator" 
                            runat="server" ControlToValidate="StartAtTextBox" Display="Dynamic" 
                            ErrorMessage="*" ForeColor="#CC0000" ValidationExpression="\d+" Enabled="False"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:TextBox ID="CountTextBox" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="StartAtTextBox" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <div style="text-align: right"><asp:Button ID="GoButton" runat="server" onclick="GoButton_Click" Text="Go" /></div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                ForeColor="#CC0000" HeaderText="Errors:" />
        </td>
    </tr>
    <tr id="ResultsHtmlTableRow" runat="server" visible="false">
        <td>
            Result:</td>
        <td>
            <asp:TextBox ID="ResultsTextTextBox" runat="server" ReadOnly="True" Rows="6" 
                TextMode="MultiLine" Width="720px"></asp:TextBox>
        </td>
    </tr>
</table>
</asp:Content>

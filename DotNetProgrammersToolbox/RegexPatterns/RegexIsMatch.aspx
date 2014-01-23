<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegexIsMatch.aspx.cs" Inherits="DotNetProgrammersToolbox.RegexPatterns.RegexIsMatch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h3>Regex.IsMatch</h3>
<table>
    <tr>
        <td>
            Text to search:</td>
        <td>
            <asp:TextBox ID="SourceTextTextBox" runat="server" Rows="12" 
                TextMode="MultiLine" Width="720px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Regular Expression:</td>
        <td>
            <asp:TextBox ID="RegularExpressionTextBox" runat="server" Rows="4" 
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
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td style="text-align: right">
            <asp:Button ID="GoButton" runat="server" onclick="GoButton_Click" Text="Go" /></td>
    </tr>
    <tr id="ErrorsHtmlTableRow" runat="server" visible="false">
        <td>
            Errors:</td>
        <td>
            <asp:BulletedList ID="ErrorsBulletedList" runat="server">
            </asp:BulletedList>
        </td>
    </tr>
    <tr id="ResultsHtmlTableRow" runat="server" visible="false">
        <td>
            Result:</td>
        <td>
            <asp:Label ID="ResultLabel" runat="server" Text="Not Evaluated"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>

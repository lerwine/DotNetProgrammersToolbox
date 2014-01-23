<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegexEscape.aspx.cs" Inherits="DotNetProgrammersToolbox.RegexPatterns.RegexEscape" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h3>Regex.Escape</h3>
<table>
    <tr>
        <td>
            Text to escape:</td>
        <td>
            <asp:TextBox ID="SourceTextTextBox" runat="server" Rows="4" 
                TextMode="MultiLine" Width="720px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td style="text-align: right">
            <asp:Button ID="GoButton" runat="server" onclick="GoButton_Click" Text="Go" />
        </td>
    </tr>
    <tr>
        <td>
            Result:</td>
        <td>
            <asp:TextBox ID="ResultsTextTextBox" runat="server" ReadOnly="True" Rows="4" 
                TextMode="MultiLine" Width="720px"></asp:TextBox>
        </td>
    </tr>
</table>
</asp:Content>

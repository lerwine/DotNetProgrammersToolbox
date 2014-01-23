<%@ Page Title="Regular Expression Testing" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DotNetProgrammersToolbox.RegexPatterns.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h3>Regular Expression Testing</h3>
<ul>
    <li><asp:HyperLink ID="RegexEscapeHyperLink" runat="server" NavigateUrl="RegexEscape.aspx">Regex.Escape</asp:HyperLink></li>
    <li><asp:HyperLink ID="RegexUnescapeHyperLink" runat="server" NavigateUrl="RegexUnescape.aspx">Regex.Unescape</asp:HyperLink></li>
    <li><asp:HyperLink ID="RegexIsMatchHyperLink" runat="server" NavigateUrl="RegexIsMatch.aspx">Regex.IsMatch</asp:HyperLink></li>
    <li><asp:HyperLink ID="RegexMatchHyperLink" runat="server" NavigateUrl="RegexMatch.aspx">Regex.Match</asp:HyperLink></li>
    <li><asp:HyperLink ID="RegexMatchesHyperLink" runat="server" NavigateUrl="RegexMatches.aspx">Regex.Matches</asp:HyperLink></li>
    <li><asp:HyperLink ID="RegexReplaceHyperLink" runat="server" NavigateUrl="RegexReplace.aspx">Regex.Replace</asp:HyperLink></li>
    <li><asp:HyperLink ID="RegexSplitHyperLink" runat="server" NavigateUrl="RegexSplit.aspx">Regex.Split</asp:HyperLink></li>
</ul>
</asp:Content>
